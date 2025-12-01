@echo off
echo ========================================
echo 로컬 서버 시작 중...
echo ========================================
echo.
echo 브라우저에서 http://localhost:8000/app.html 을 열어주세요
echo.
echo 서버를 종료하려면 Ctrl+C를 누르세요
echo ========================================
echo.

python -m http.server 8000

pause

