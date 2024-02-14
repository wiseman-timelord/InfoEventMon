REM Script: DongleQuery.Bat

@echo off

:: Initialization
mode con cols=67 lines=32
color 80
title SysConfWha
cd /d "%~dp0"
set ErrorLog=Errors-Crash.Log
echo.
echo =========================( InfoEventMon )==========================
echo.
echo Performing Maintenance..
if exist ".\Errors-Crash.Log" (
    echo ..Deleting Log..
    del ".\Errors-Crash.Log"
)
echo ..Cleaning Done.
echo.
timeout /t 1 /nobreak >nul
echo Launcher Initialized...
echo.
timeout /t 2 /nobreak >nul

:: Main Menu
:menu
cls
echo   ^_^_^_        ^_^_       ^_^_^_^_^_                ^_   ^_^_  ^_^_             
echo  ^|^_ ^_^|^_^_^_^_  ^/ ^_^| ^_^_^_ ^| ^_^_^_^_^|   ^_^_^_^_^_ ^_^_^_^_ ^| ^|^_^|  ^\^/  ^| ^_^_^_  ^_^_^_^_  
echo   ^| ^|^|  ^_ ^\^| ^|^_ ^/ ^_ ^\^|  ^_^|^\ ^\ ^/ ^/ ^_ ^\  ^_ ^\^| ^_^_^| ^|^\^/^| ^|^/ ^_ ^\^|  ^_ ^\ 
echo   ^| ^|^| ^| ^| ^|  ^_^| ^<^_^> ^| ^|^_^_^_^\ V ^/  ^_^_^/ ^| ^| ^| ^|^_^| ^|  ^| ^| ^<^_^> ^| ^| ^| ^|
echo  ^|^_^_^_^|^_^| ^|^_^|^_^|  ^\^_^_^_^/^|^_^_^_^_^_^|^\^_^/ ^\^_^_^_^|^_^| ^|^_^|^\^_^_^|^_^|  ^|^_^|^\^_^_^_^/^|^_^| ^|^_^|
echo.
echo =========================( InfoEventMon )==========================
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                        1. Run InfoEventMon,
echo.
echo                      2. Check File Integrity,
echo.
echo                         X. Exit Launcher.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo -------------------------------------------------------------------

:: Variables
set /p choice=Select, Options=1-2, Exit=X: 
if "%choice%"=="1" goto executeMain
if "%choice%"=="2" goto checkScript
if "%choice%"=="x" goto end
echo Invalid choice. Try again.
timeout /t 2 /nobreak >nul
pause
goto menu

:: Check for presence of powershell core and execute main.py
:executeMain
cls
echo.
echo =========================( InfoEventMon )==========================
echo.
where pwsh >nul 2>&1
if %ERRORLEVEL% equ 0 (
    timeout /t 1 /nobreak >nul
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1" 2>>".\Errors-Crash.Log"
    echo.
	echo ..Psc Process Exited.
    echo.
) else (
    timeout /t 1 /nobreak >nul
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1" 2>>".\Errors-Crash.Log"
    echo.
	echo ..Ps Process Exited.
    echo.
)

:: Post Powershell Processes
color 80
echo Checking Errors-Crash.Log..
timeout /t 1 /nobreak >nul
for %%I in (".\Errors-Crash.Log") do if %%~zI==0 (
    echo ..Errors-Crash.Log Empty..
) else (
    echo ..Cleaning Errors-Crash-Log..
    pwsh.exe -NoProfile -File ".\scripts\cleaner.ps1"
)
echo.
echo Returning to menu..
timeout /t 3 /nobreak >nul
goto menu

:: Function to Check File Structure
:checkScript
cls
echo.
echo =========================( InfoEventMon )==========================
echo.
echo Checking Script Files..
set missing=0
timeout /t 1 /nobreak >nul
if not exist ".\scripts\utility.ps1" set missing=1
if not exist ".\scripts\display.ps1" set missing=1
if not exist ".\main.ps1" set missing=1
if %missing%==1 (
    echo ..Failure, Re-Install Program!
) else (
    echo ..Program Files Correct.
)
echo.
timeout /t 1 /nobreak >nul
echo Returning to menu..
echo.
timeout /t 2 /nobreak >nul
goto menu

:: End Function
:end
echo ...Exit Process Initiated.
timeout /t 5 /nobreak >nul