Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Enable Design System - Widgetbook" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Set-Location $PSScriptRoot

Write-Host "[1/3] Getting dependencies..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to get dependencies" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[2/3] Generating Widgetbook stories..." -ForegroundColor Yellow
dart run build_runner build --delete-conflicting-outputs
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to generate Widgetbook files" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[3/3] Starting Widgetbook..." -ForegroundColor Yellow
Write-Host ""
Write-Host "Opening in browser at http://localhost:8080" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
Write-Host ""

flutter run -d chrome --web-port=8080 -t widgetbook/main.dart

