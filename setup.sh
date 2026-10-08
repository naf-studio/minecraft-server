#!/bin/bash
# ==============================================================================
# Script Name: setup.sh
# Description: Automated setup script for NAF Minecraft Server on Linux.
#              Downloads Leaf server core and plugins.
# Usage:
#   ./setup.sh
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST_FILE="${SCRIPT_DIR}/server-manifest.json"
PLUGINS_DIR="${SCRIPT_DIR}/plugins"
DATAPACKS_DIR="${SCRIPT_DIR}/world/datapacks"

if [ ! -f "${MANIFEST_FILE}" ]; then
    echo "ERROR: server-manifest.json not found in ${SCRIPT_DIR}" >&2
    exit 1
fi

mkdir -p "${PLUGINS_DIR}" "${DATAPACKS_DIR}"

download_file() {
    local name="$1"
    local url="$2"
    local dest="$3"

    if [ -f "${dest}" ]; then
        echo "  [OK] ${name} already exists. Skipping."
        return 0
    fi

    echo "  -> Downloading ${name}..."
    local temp_dest="${dest}.tmp"
    if command -v curl >/dev/null 2>&1; then
        curl -sSL -H "User-Agent: NAF-Server-Setup/1.0" -o "${temp_dest}" "${url}"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -U "NAF-Server-Setup/1.0" -O "${temp_dest}" "${url}"
    else
        echo "ERROR: Neither curl nor wget is available." >&2
        return 1
    fi
    mv "${temp_dest}" "${dest}"
    echo "  [+] ${name} downloaded successfully."
}

echo "Reading server manifest..."

# Use python3 to parse manifest and download assets
python3 -c "
import json, os, sys, urllib.request

manifest_path = '${MANIFEST_FILE}'
script_dir = '${SCRIPT_DIR}'
plugins_dir = '${PLUGINS_DIR}'
datapacks_dir = '${DATAPACKS_DIR}'

with open(manifest_path, 'r', encoding='utf-8') as f:
    manifest = json.load(f)

def download(name, url, dest):
    if os.path.isfile(dest):
        print(f'  [OK] {name} already exists. Skipping.')
        return
    print(f'  -> Downloading {name}...')
    tmp = dest + '.tmp'
    try:
        req = urllib.request.Request(url, headers={'User-Agent': 'NAF-Server-Setup/1.0'})
        with urllib.request.urlopen(req) as resp, open(tmp, 'wb') as out_f:
            while chunk := resp.read(65536):
                out_f.write(chunk)
        os.replace(tmp, dest)
        print(f'  [+] {name} downloaded successfully.')
    except Exception as e:
        print(f'  [ERROR] Failed to download {name} from {url}: {e}', file=sys.stderr)
        if os.path.isfile(tmp):
            os.remove(tmp)

print('\n=== 1. Server Core ===')
server = manifest.get('server', {})
s_name = server.get('name', 'server')
s_url = server.get('url', '')
s_file = os.path.join(script_dir, server.get('filename', 'server.jar'))
if s_url:
    download(s_name, s_url, s_file)

print('\n=== 2. Plugins Ecosystem ===')
for p in manifest.get('plugins', []):
    name = p.get('name')
    fname = p.get('filename')
    url = p.get('url')
    commercial = p.get('commercial', False)
    homepage = p.get('homepage')
    dest = os.path.join(plugins_dir, fname)

    if commercial:
        if os.path.isfile(dest):
            print(f'  [OK] {name} ({fname}) is installed.')
        else:
            print(f'  [!] {name} is a commercial plugin. Please place your licensed jar into plugins/{fname}')
        continue

    if url:
        download(name, url, dest)
    elif homepage:
        if not os.path.isfile(dest):
            print(f'  [!] {name} requires manual download from: {homepage}')
        else:
            print(f'  [OK] {name} already exists.')

print('\n=== 3. Datapacks Ecosystem ===')
for dp in manifest.get('datapacks', []):
    name = dp.get('name')
    fname = dp.get('filename')
    url = dp.get('url')
    if url:
        dest = os.path.join(datapacks_dir, fname)
        download(name, url, dest)
"

echo -e "\nSetup complete! You can now launch the server using ./run.sh"
