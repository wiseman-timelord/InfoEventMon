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
timeout /t 1 /nobreak >nul
echo Checking Cache Dir..
if not exist ".\cache\" (
    echo ..Not Found, Creating..
    mkdir ".\cache"
    echo ..Cache Dir Created.
) else (
    echo ..Cache Dir Present.
)
echo.
timeout /t 1 /nobreak >nul
echo Cleaning Event Logs..
if exist ".\cache\ProgramEvents.Log" (
    echo Deleted: ProgramEvents.Log
    del ".\cache\ProgramEvents.Log"
)
if exist ".\cache\SystemEvents.Log" (
    echo Deleted: SystemEvents.Log
    del ".\cache\SystemEvents.Log"
)
echo ..Cleaning Complete.
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
echo                        2. Check Integrity,
echo.
echo                        3. Clean Error Log.
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
if "%choice%"=="3" goto cleanLog
if "%choice%"=="x" goto end
echo Invalid choice. Try again.
timeout /t 2 /nobreak >nul
goto menu

:: Check for presence of powershell core and execute main.py
:executeMain
cls
echo.
echo =========================( InfoEventMon )==========================
echo.
echo Checking Error-Crash.Log..
if exist ".\Errors-Crash.Log" (
    echo Deleted: Errors-Crash.Log
    del ".\Errors-Crash.Log"
) else (
    echo ..First Run?
)
echo. ..Maintenance Done.
echo.
timeout /t 1 /nobreak >nul
echo Launching Script...
echo.
timeout /t 1 /nobreak >nul
where pwsh >nul 2>&1
if %ERRORLEVEL% equ 0 (
    pwsh.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1" 2>>".\Errors-Crash.Log"
	echo ...Psc Process Exited.
) else (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\main.ps1" 2>>".\Errors-Crash.Log"
	echo ...Ps Process Exited.
)
echo.
color 80
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
if not exist ".\scripts\cleaner.ps1" set missing=1
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

:: Function to Check File Structure
:cleanLog
cls
echo.
echo =========================( InfoEventMon )==========================
echo.
echo Cleaning Errors-Crash.Log..
for %%I in (".\Errors-Crash.Log") do if %%~zI==0 (
    echo ..Errors-Crash.Log Empty..
) else (
    echo ..Cleaning Errors-Crash-Log..
    pwsh.exe -NoProfile -File ".\scripts\cleaner.ps1"
)
Echo ..Cleaning Complete.
echo.
timeout /t 1 /nobreak >nul
echo Returning to menu..
echo.
timeout /t 2 /nobreak >nul
goto menu

:: End Function
:end
echo ...Exit Process Initiated.
timeout /t 2 /nobreak >nul