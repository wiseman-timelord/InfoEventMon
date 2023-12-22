@echo off

:: INITIALIZATION
mode con cols=60 lines=30
color 0E
echo.
echo ===================( PerforMancer-BaPs )====================
echo.
timeout /t 1 /nobreak >nul

:: Run Script
echo.
echo Launching PowerShell Script...
echo.
timeout /t 2 /nobreak >nul
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1"
echo.

:: Exit Launcher
echo.
echo PowerShell Script Exited!
pause