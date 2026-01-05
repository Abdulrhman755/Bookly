$ErrorActionPreference = "Continue"

Write-Host "Killing potentially locking processes..." -ForegroundColor Cyan
Stop-Process -Name "adb", "dart", "flutter", "java", "qemu-system-x86_64" -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2

function Remove-Link {
    param (
        [string]$Source,
        [string]$Target
    )

    if (Test-Path $Source) {
        Write-Host "Removing residual source $Source..." -ForegroundColor Yellow
        Remove-Item -Path $Source -Recurse -Force
    }

    if (-not (Test-Path $Source)) {
        Write-Host "Creating Junction: $Source -> $Target" -ForegroundColor Green
        cmd /c mklink /J "$Source" "$Target"
    }
    else {
        Write-Error "Failed to delete $Source. Please delete it manually and run: cmd /c mklink /J `"$Source`" `"$Target`""
    }
}

# Flutter
Force-Link -Source "C:\flutter" -Target "F:\Dev\flutter"

# Android SDK
Force-Link -Source "$env:LOCALAPPDATA\Android\sdk" -Target "F:\Dev\Android\sdk"

Write-Host "Cleanup and linking complete." -ForegroundColor Cyan
