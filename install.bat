@echo off
:: Define download URL and output folder
set DOWNLOAD_URL=https://github.com/ZohanHaqu/ADB-For-APK-Windows-Installer/releases/download/1.0/ADB.exe
set FOLDER_NAME=ADB-Windows-APK-Installer
set FILE_NAME=ADB.exe

:: Create the folder
mkdir "%FOLDER_NAME%"

:: Download the file using PowerShell
powershell -Command "Invoke-WebRequest -Uri %DOWNLOAD_URL% -OutFile .\%FOLDER_NAME%\%FILE_NAME%"

:: Check if the file was downloaded successfully
if exist "%FOLDER_NAME%\%FILE_NAME%" (
    echo File downloaded successfully.

    :: Run the installer
    start "" "%FOLDER_NAME%\%FILE_NAME%"

    :: Wait for the installer to finish
    timeout /t 10 /nobreak >nul

    :: Automatically close the script window
    exit
) else (
    echo Failed to download the file.
    exit /b 1
)
