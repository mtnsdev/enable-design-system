@echo off
echo ========================================
echo Enable Design System - Widgetbook
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] Getting dependencies...
call flutter pub get
if errorlevel 1 (
    echo ERROR: Failed to get dependencies
    pause
    exit /b 1
)

echo.
echo [2/3] Generating Widgetbook stories...
call dart run build_runner build --delete-conflicting-outputs
if errorlevel 1 (
    echo ERROR: Failed to generate Widgetbook files
    pause
    exit /b 1
)

echo.
echo [3/3] Starting Widgetbook...
echo.
echo Opening in browser at http://localhost:8080
echo Press Ctrl+C to stop
echo.

call flutter run -d chrome --web-port=8080 -t widgetbook/main.dart

pause

