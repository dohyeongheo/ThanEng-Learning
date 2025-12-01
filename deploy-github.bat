@echo off
echo ========================================
echo GitHub Pages 배포 가이드
echo ========================================
echo.
echo 1. GitHub에 새 저장소를 만드세요
echo    https://github.com/new
echo.
echo 2. 저장소 이름을 입력하세요 (예: ThaiEng-Learning)
echo.
echo 3. 아래 명령어를 실행하세요:
echo.
echo    git remote add origin https://github.com/YOUR_USERNAME/저장소이름.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. GitHub 저장소 페이지에서:
echo    Settings ^> Pages ^> Source: main, / (root) 선택 ^> Save
echo.
echo 5. 몇 분 후 다음 주소로 접속 가능:
echo    https://YOUR_USERNAME.github.io/저장소이름/app.html
echo.
echo ========================================
pause

