![Flutter Installer for Windows](https://github.com/LePichu/Flutter-Installer/blob/master/Flutter-Installer.png?raw=true)

# Flutter Installer
This is a PowerShell script intended to install Flutter (alongside Dart) on a Windows machine. 

## Usage
```powershell
# Passing a version as script argument is allowed, but its optional and will default to latest. I'll put latest as an example:
Invoke-WebRequest "https://raw.githubusercontent.com/LePichu/Flutter-Installer/master/Flutter-Install.ps1" | Invoke-Expression "3.0.5-stable"
```
