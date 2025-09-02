@echo off
setlocal enabledelayedexpansion

:: Make report folder if not exists
if not exist report (
    mkdir report
)

set counter=1

:: Loop through each domain in list.txt
for /f "usebackq tokens=*" %%d in ("list.txt") do (
    echo [*] Running subfinder for domain: %%d
    subfinder -d %%d -v > report/subfinder/!counter!.txt
    set /a counter+=1
)

echo [✓] All done! Check the 'report' folder.
pause
