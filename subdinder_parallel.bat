@echo off
setlocal enabledelayedexpansion

:: Make reports folder if not exists
if not exist reports (
    mkdir reports
)

set counter=1

:: Loop through each domain in list.txt
for /f "usebackq tokens=*" %%d in ("list.txt") do (
    echo [*] Running subfinder for domain: %%d
    subfinder -d %%d -v > reports/subfinder/!counter!.txt
    set /a counter+=1
)

echo [✓] All done! Check the 'reports' folder.
pause

