
@echo off
setlocal enabledelayedexpansion

:: User input for number of times
set /p max="Enter how many times to run (e.g. 1 - 20): "

:: Loop from 1 to %max%
for /L %%i in (1,1,%max%) do (
    echo.
    set /p site="Enter site for task %%i: "
    start "DirSearch URL: %%i" cmd /k "py -3 dirsearch/dirsearch.py -u !site! --async --recursive --random-agent -i 200,301,302 -e php,aspx,log,env,zip"
    timeout /t 5 >nul
)

echo [✓] All tasks started.
pause

