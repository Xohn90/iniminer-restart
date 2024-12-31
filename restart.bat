@echo off
setlocal enabledelayedexpansion
 
set "SCRIPT_DIR=%~dp0"
set "EXE_NAME=iniminer.exe"
set "CHECK_INTERVAL=10"
 
:CHECK_LOOP

tasklist /FI "IMAGENAME eq %EXE_NAME%" | findstr /I /C:"%EXE_NAME%" >nul
if %errorlevel% gtr 0 (
    echo %EXE_NAME% is not running. Starting %EXE_NAME%...
    REM start "" "%SCRIPT_DIR%%EXE_NAME%"
    call "%SCRIPT_DIR%start.bat"
) else (
    echo %EXE_NAME% is running.
)

echo start again...
timeout /t %CHECK_INTERVAL% >nul

goto :CHECK_LOOP
 
endlocal