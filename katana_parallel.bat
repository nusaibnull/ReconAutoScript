@echo off
setlocal enabledelayedexpansion

:: User input
set /p max="Enter how many input files to scan (e.g. 20): "

:: Create output\katana folder if it doesn't exist
if not exist output\katana (
    mkdir output\katana
)

:: Loop through 1 to %max%
for /L %%i in (1,1,%max%) do (
    echo [*] Running katana on report/%%i.txt
    start "Katana: %%i" cmd /k "katana -list reports/%%i.txt -o output\katana\katana_out_%%i.txt"
    timeout /t 3 >nul
)

echo [✓] All katana scans started in parallel.
pause
