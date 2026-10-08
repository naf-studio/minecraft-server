# ==============================================================================
# Script Name: setup.ps1
# Description: Automated setup script for NAF Minecraft Server.
#              Downloads Leaf server core and plugins.
# Usage:
#   .\setup.ps1
# ==============================================================================

[CmdletBinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$manifestPath = Join-Path $scriptDir "server-manifest.json"
$pluginsDir = Join-Path $scriptDir "plugins"

if (-not (Test-Path $manifestPath)) {
    Write-Error "server-manifest.json not found in $scriptDir"
    exit 1
}

Write-Host "Reading server manifest..." -ForegroundColor Cyan
$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json

if (-not (Test-Path $pluginsDir)) {
    New-Item -ItemType Directory -Path $pluginsDir | Out-Null
}

$failedDownloads = [System.Collections.Generic.List[string]]::new()

function Download-Asset {
    param(
        [string]$Name,
        [string]$Url,
        [string]$DestinationPath
    )

    if ((Test-Path $DestinationPath) -and (-not $Force)) {
        Write-Host "  [OK] $Name already exists. Skipping." -ForegroundColor DarkGray
        return
    }

    Write-Host "  -> Downloading $Name..." -ForegroundColor Yellow
    try {
        $tempPath = "$DestinationPath.tmp"
        Invoke-WebRequest -Uri $Url -OutFile $tempPath -UserAgent "NAF-Server-Setup/1.0"
        Move-Item -Path $tempPath -Destination $DestinationPath -Force
        Write-Host "  [+] $Name downloaded successfully." -ForegroundColor Green
    }
    catch {
        Write-Warning "Failed to download $Name from ${Url}: $($_.Exception.Message)"
        $failedDownloads.Add($Name)
        if (Test-Path $tempPath) {
            Remove-Item $tempPath -Force -ErrorAction SilentlyContinue
        }
    }
}

# 1. Download Server Core
Write-Host "`n=== 1. Server Core ($($manifest.server.name)) ===" -ForegroundColor Cyan
$serverDest = Join-Path $scriptDir $manifest.server.filename
Download-Asset -Name $manifest.server.name -Url $manifest.server.url -DestinationPath $serverDest

# 2. Download Plugins
Write-Host "`n=== 2. Plugins Ecosystem ===" -ForegroundColor Cyan
foreach ($plugin in $manifest.plugins) {
    $pluginDest = Join-Path $pluginsDir $plugin.filename

    if ($plugin.commercial) {
        if (Test-Path $pluginDest) {
            Write-Host "  [OK] $($plugin.name) ($($plugin.filename)) is installed." -ForegroundColor Green
        }
        else {
            Write-Host "  [!] $($plugin.name) is a commercial plugin." -ForegroundColor Magenta
            Write-Host "      Please place your licensed jar into plugins/$($plugin.filename)" -ForegroundColor DarkGray
        }
        continue
    }

    if ($plugin.url) {
        Download-Asset -Name $plugin.name -Url $plugin.url -DestinationPath $pluginDest
    }
    elseif ($plugin.homepage) {
        if (-not (Test-Path $pluginDest)) {
            Write-Host "  [!] $($plugin.name) requires manual download from: $($plugin.homepage)" -ForegroundColor Yellow
        }
        else {
            Write-Host "  [OK] $($plugin.name) already exists." -ForegroundColor DarkGray
        }
    }
}

if ($failedDownloads.Count -gt 0) {
    Write-Warning "`nSetup completed with errors! The following $($failedDownloads.Count) item(s) failed to download:"
    foreach ($item in $failedDownloads) {
        Write-Warning "  - $item"
    }
    exit 1
}
else {
    Write-Host "`nSetup complete! You can now launch the server using .\run.ps1" -ForegroundColor Green
}
