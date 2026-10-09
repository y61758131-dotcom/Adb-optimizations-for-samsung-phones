@echo off
setlocal EnableExtensions
chcp 65001 >nul
title Samsung ADB Safe Optimizer
color 0A

rem Find adb.exe beside this BAT, or fall back to adb in PATH.
set "ADB=%~dp0adb.exe"
if not exist "%ADB%" (
    set "ADB=adb"
    where adb >nul 2>&1
    if errorlevel 1 goto no_adb
)

:check_device
"%ADB%" get-state >nul 2>&1
if errorlevel 1 goto no_device

:menu
cls
echo =============================================
echo       SAMSUNG ADB SAFE OPTIMIZER
echo =============================================
echo 1. Apply safe UI animation settings (0.5x)
echo 2. Restore default UI animation settings (1.0x)
echo 3. Exit
echo.
choice /c 123 /n /m "Select 1, 2 or 3: "
if errorlevel 3 goto done
if errorlevel 2 goto restore
if errorlevel 1 goto optimize

:optimize
if not exist "%~dp0Samsung_ADB_Commands.txt" goto no_commands
cls
echo Applying settings from Samsung_ADB_Commands.txt...
echo Commands in the TXT are sent as-is to the Android shell.
echo.
"%ADB%" shell < "%~dp0Samsung_ADB_Commands.txt"
if errorlevel 1 echo WARNING: ADB returned an error. Check the phone and try again.
echo.
echo Note: This changes animation feel, not CPU power or available RAM.
pause
goto menu

:restore
if not exist "%~dp0Samsung_ADB_Restore.txt" goto no_restore
cls
echo Restoring default animation settings...
echo.
"%ADB%" shell < "%~dp0Samsung_ADB_Restore.txt"
if errorlevel 1 echo WARNING: ADB returned an error. Check the phone and try again.
echo.
pause
goto menu

:no_adb
echo ERROR: adb.exe was not found.
echo Put this BAT and the TXT files beside adb.exe from Android Platform Tools,
echo or add the Platform Tools folder to your Windows PATH.
echo Download Platform Tools from the official Android Developers website.
pause
exit /b 1

:no_device
echo ERROR: No single authorized ADB device was detected.
echo 1. Enable USB debugging on the phone.
echo 2. Connect the phone and accept the authorization prompt.
echo 3. Disconnect other Android devices or emulators.
pause
exit /b 1

:no_commands
echo ERROR: Samsung_ADB_Commands.txt is missing beside this BAT.
pause
exit /b 1

:no_restore
echo ERROR: Samsung_ADB_Restore.txt is missing beside this BAT.
pause
exit /b 1

:done
endlocal
exit /b 0
