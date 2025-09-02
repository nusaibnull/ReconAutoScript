@echo off
setlocal enabledelayedexpansion

:: ইউজার থেকে ইনপুট নিও
set /p max="Enter how many input files to scan (e.g. 20): "

:: output\wayback ফোল্ডার বানাও যদি না থাকে
if not exist output\wayback (
    mkdir output\wayback
)

:: লুপ চালাও ইউজার ইনপুট পর্যন্ত
for /L %%i in (1,1,%max%) do (
    echo [*] Running waybackurls.exe on reports\%%i.txt
    start "WayBackURLS: %%i" cmd /k "type reports\%%i.txt | waybackurls.exe > output\wayback\wayback_out_%%i.txt && type output\wayback\wayback_out_%%i.txt"
    timeout /t 3 >nul
)

echo [✓] All scans started in parallel.
pause
