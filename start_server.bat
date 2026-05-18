@echo off
title BPR System Server
echo ===================================================
echo Starting BPR System Local Server...
echo ===================================================

:: Try Python 3
python -c "exit()" >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Python is installed. Starting server...
    start http://localhost:8000
    python -m http.server 8000
    goto end
)

:: Try Node.js npx
npx -v >nul 2>&1
if %errorlevel% equ 0 (
    echo [OK] Node.js is installed. Starting server...
    start http://localhost:8000
    npx serve -p 8000
    goto end
)

echo [ERROR] Neither Python nor Node.js is installed!
echo Please install Python (https://www.python.org/downloads/) 
echo or install the "Live Server" extension in VS Code.
pause

:end
