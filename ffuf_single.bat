
@echo off
setlocal enabledelayedexpansion

:: User input for number of times
set /p max="Enter how many times to run (e.g. 1 - 20): "

:: Loop from 1 to %max%
for /L %%i in (1,1,%max%) do (
    echo.
    set /p site="Enter site for task %%i: "
    start "FFUF URL: %%i" cmd /k "ffuf -u !site!/FUZZ -mc 200,301,302 -v -w WordLists/Filenames_PHP_All.wordlist"
    timeout /t 5 >nul
)

echo [✓] All tasks started.
pause
