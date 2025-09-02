@echo off
setlocal enabledelayedexpansion

:: User input
set /p max="Enter how many times to run (e.g. 20): "

:: Loop from 1 to %max%
for /L %%i in (1,1,%max%) do (
    start "DirSearch: %%i" cmd /k "py -3 dirsearch/dirsearch.py -l reports/%%i.txt --async --deep-recursive --random-agent -i 200,301,302 -e php,aspx,log,env, -o output/dirsearch/%%i.txt"
	
    timeout /t 5 >nul
)

echo [✓] All tasks started.
pause

