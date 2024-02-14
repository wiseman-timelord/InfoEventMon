REM Script: LogClean-Ps.Bat
@echo off

:: Initialization
mode con cols=35 lines=17
color 80
title LogClean-Ps
cd /d "%~dp0"
echo.
echo LogClean Started...
echo.
echo.
timeout /t 1 /nobreak >nul

:: Run SCript
timeout /t 1 /nobreak >nul
where pwsh >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo Launching PowerShellCore Script..
	echo.
    timeout /t 2 /nobreak >nul
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File ".\logclean-ps.ps1"
    echo ..Main Script Has Exited.
	echo.
) else (
    echo Launching PowerShell Script..
    timeout /t 2 /nobreak >nul
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\logclean-ps.ps1"
    echo ..Main Script Has Exited.
	echo.
)
echo.

:: Exit Procedure
echo ...Exit Initiated.
timeout /t 5 /nobreak >nul
