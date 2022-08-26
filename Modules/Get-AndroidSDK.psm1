$GLOBAL:ProgressPreference = "SilentlyContinue"

# Android Path
$ANDROID_HOME = "C:\Users\$Env:USERNAME\AppData\Local\AndroidTest\" 
Write-Output $ANDROID_HOME

function Write-PrecursorText() 
{
    Write-Host ">> " -NoNewLine -ForegroundColor Green
}

function Get-AndroidSDK 
{
    Write-Output "$(Write-PrecursorText) Installing Android SDK and Tools!"
    if(Test-Path -Path $ANDROID_HOME) {} else { mkdir $ANDROID_HOME }

    Invoke-WebRequest -Uri "https://dl.google.com/android/repository/commandlinetools-win-8512546_latest.zip" -Outfile "$ANDROID_HOME/commandlinetools.zip"
    Expand-Archive -Path "$ANDROID_PATH/commandlinetools.zip" -DestinationPath $ANDROID_HOME
}

Get-AndroidSDK