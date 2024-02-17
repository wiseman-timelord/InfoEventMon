REM Script: Setup-Install.Bat

@echo off

:: Initialization
mode con cols=67 lines=32
color 80
title Setup-Install
cd /d "%~dp0"
echo.
echo =========================( InfoEventMon )==========================
echo.
timeout /t 1 /nobreak >nul
echo Batch Initialized....
echo.
timeout /t 2 /nobreak >nul

:: Setup-Install
cls
echo.
echo =========================( InfoEventMon )==========================
echo.
echo Starting Setup-Install...
echo.
echo Checking Directories..
timeout /t 1 /nobreak >nul
if not exist ".\cache\" (
    mkdir ".\cache"
	echo Created: .\cache..
)
echo ..Directories Done.
echo.
timeout /t 1 /nobreak >nul
echo ...Setup-Install Complete.
echo.
pause
goto end

:: End Function
:end
echo.
echo ....Exit Process Initiated!
echo.
timeout /t 3 /nobreak >nul