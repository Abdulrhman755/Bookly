$ErrorActionPreference = "Stop"

function Move-Directory {
    param (
        [string]$Source,
        [string]$Destination
    )

    if (-not (Test-Path $Source)) {
        Write-Host "Source $Source does not exist. Skipping." -ForegroundColor Yellow
        return
    }

    if (Test-Path $Destination) {
        Write-Host "Destination $Destination already exists. Checking contents..." -ForegroundColor Yellow
    } else {
        New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    }

    Write-Host "Copying from $Source to $Destination..." -ForegroundColor Cyan
    # Use Robocopy for robust copy /E (recursive) /MOVE (delete source) /NFL /NDL (less log)
    # /J (Unbuffered I/O for large files)
    # Note: Robocopy exit codes: 0-7 are success.
    
    $proc = Start-Process robocopy -ArgumentList "`"$Source`" `"$Destination`" /E /MOVE /J /NFL /NDL" -NoNewWindow -PassThru -Wait
    
    if ($proc.ExitCode -gt 7) {
        Write-Error "Robocopy failed with exit code $($proc.ExitCode)"
    }
    
    Write-Host "Move complete." -ForegroundColor Green
}

function Create-Link {
    param (
        [string]$Source, # This is the "Fake" path on C:
        [string]$Target # This is the "Real" path on F:
    )
    
    if (Test-Path $Source) {
         # Double check it's empty or deleted
         Write-Host "Source $Source still exists (folder structure). Attempting to remove..."
         Remove-Item -Path $Source -Recurse -Force -ErrorAction SilentlyContinue
    }
    
    Write-Host "Creating Junction: $Source -> $Target" -ForegroundColor Cyan
    cmd /c mklink /J "$Source" "$Target"
}

# 1. Flutter SDK
$flutterSource = "C:\flutter"
$flutterDest = "F:\Dev\flutter"

Move-Directory -Source $flutterSource -Destination $flutterDest
Create-Link -Source $flutterSource -Target $flutterDest

# 2. Android SDK
$androidSource = "$env:LOCALAPPDATA\Android\sdk"
$androidDest = "F:\Dev\Android\sdk"

Move-Directory -Source $androidSource -Destination $androidDest
Create-Link -Source $androidSource -Target $androidDest

Write-Host "Migration Successful! Please restart your terminal/IDE." -ForegroundColor Green
