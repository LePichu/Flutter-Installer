# System Related
$GLOBAL:ProgressPreference = 'SilentlyContinue'

# Flutter Related
$FLUTTER_PATH = "C:/Program Files/Flutter/"
$FLUTTER_FNAME = "flutter_windows_" 
$FLUTTER_VER = switch($args[0]) {
    "" {
        $FLUTTER_FNAME + "3.0.5-stable"
    }
    default {
        $FLUTTER_FNAME + $args[0]
    }
}

# System Related
$OLD_PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$NEW_PATH = "$OLD_PATH;%FLUTTER_PATH%"

function Write-PrecursorText() {
    Write-Host ">> " -NoNewLine -ForegroundColor Blue
}

# Check if Path Exists
if (Test-Path -Path $FLUTTER_PATH) {} else { mkdir $FLUTTER_PATH }

# Download
Write-Output "$(Write-PrecursorText) Downloading Flutter!"
try {
    Invoke-WebRequest -Uri "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/$FLUTTER_VER.zip" -OutFile "$FLUTTER_PATH/$FLUTTER_VER.zip"
} catch {
    Write-Host ">> " -NoNewLine -ForegroundColor Red
    Write-Output "An Error Occured! We couldn't find the version you were looking for. :("
    exit $LASTEXITCODE
}


# Extract
Write-Output "$(Write-PrecursorText) Extracting Flutter!"
Expand-Archive -Path "$FLUTTER_PATH/$FLUTTER_VER.zip" -DestinationPath "$FLUTTER_PATH"

# Install
Write-Output "$(Write-PrecursorText) Installing Flutter!"
Rename-Item -Path "$FLUTTER_PATH/flutter" -NewName "$FLUTTER_VER"
Remove-Item -Path "$FLUTTER_PATH/$FLUTTER_VER.zip" -Force

[Environment]::SetEnvironmentVariable("FLUTTER_PATH", "$FLUTTER_PATH/$FLUTTER_VER/bin", "Machine")
if (-not $($OLD_PATH -Contains "%FLUTTER_PATH%")) {
    [Environment]::SetEnvironmentVariable("PATH", $NEW_PATH, "Machine")
}

# Finish
Write-Output "$(Write-PrecursorText) Flutter has been installed! Please restart your terminal for the changes to take effect. Happy Fluttering! 🐦"


