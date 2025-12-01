# PowerShell 스크립트로 로컬 서버 시작
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "로컬 서버 시작 중..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "브라우저에서 http://localhost:8000/app.html 을 열어주세요" -ForegroundColor Yellow
Write-Host ""
Write-Host "서버를 종료하려면 Ctrl+C를 누르세요" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Python이 설치되어 있는지 확인
try {
    python --version | Out-Null
    python -m http.server 8000
} catch {
    Write-Host "Python이 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "다음 방법 중 하나를 사용하세요:" -ForegroundColor Yellow
    Write-Host "1. Python 설치: https://www.python.org/downloads/" -ForegroundColor White
    Write-Host "2. Node.js 사용: npx http-server -p 8000" -ForegroundColor White
    Write-Host "3. VS Code Live Server 확장 사용" -ForegroundColor White
    Read-Host "계속하려면 Enter를 누르세요"
}

