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

if [ ! -f "${MANIFEST_FILE}" ]; then
    echo "ERROR: server-manifest.json not found in ${SCRIPT_DIR}" >&2
    exit 1
fi

mkdir -p "${PLUGINS_DIR}"

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

# Use python3 to parse manifest and output download tasks
python3 -c "
import json, os, subprocess

with open('${MANIFEST_FILE}', 'r', encoding='utf-8') as f:
    manifest = json.load(f)

print('\n=== 1. Server Core ===')
server = manifest.get('server', {})
s_name = server.get('name', 'server')
s_url = server.get('url', '')
s_file = os.path.join('${SCRIPT_DIR}', server.get('filename', 'server.jar'))

if s_url:
    subprocess.run(['bash', '-c', f'download_file \"{s_name}\" \"{s_url}\" \"{s_file}\"'], env=os.environ)

print('\n=== 2. Plugins Ecosystem ===')
for p in manifest.get('plugins', []):
    name = p.get('name')
    fname = p.get('filename')
    url = p.get('url')
    commercial = p.get('commercial', False)
    homepage = p.get('homepage')
    dest = os.path.join('${PLUGINS_DIR}', fname)

    if commercial:
        if os.path.isfile(dest):
            print(f'  [OK] {name} ({fname}) is installed.')
        else:
            print(f'  [!] {name} is a commercial plugin. Please place your licensed jar into plugins/{fname}')
        continue

    if url:
        subprocess.run(['bash', '-c', f'download_file \"{name}\" \"{url}\" \"{dest}\"'], env=os.environ)
    elif homepage:
        if not os.path.isfile(dest):
            print(f'  [!] {name} requires manual download from: {homepage}')
        else:
            print(f'  [OK] {name} already exists.')
"

echo -e "\nSetup complete! You can now launch the server using ./run.sh"
