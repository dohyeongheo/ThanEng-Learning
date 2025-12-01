# 방콕 생존 완성 - 태국어 & 영어 학습 앱

태국어와 영어를 동시에 학습할 수 있는 웹 애플리케이션입니다.

## 🚀 빠른 시작

### 방법 1: Python 사용 (가장 간단)

1. **Windows (배치 파일 사용)**
   - `start-server.bat` 파일을 더블클릭
   - 브라우저에서 `http://localhost:8000/app.html` 열기

2. **수동 실행**
   ```bash
   python -m http.server 8000
   ```
   또는 Python 3인 경우:
   ```bash
   python3 -m http.server 8000
   ```

### 방법 2: Node.js 사용

1. **http-server 설치 (한 번만)**
   ```bash
   npm install -g http-server
   ```

2. **서버 실행**
   ```bash
   http-server -p 8000
   ```

   또는 npx 사용 (설치 없이):
   ```bash
   npx http-server -p 8000
   ```

### 방법 3: VS Code Live Server (추천)

1. VS Code에서 **Live Server** 확장 설치
2. `app.html` 파일을 우클릭
3. **"Open with Live Server"** 선택
4. 자동으로 브라우저가 열립니다

### 방법 4: PHP 사용 (PHP가 설치된 경우)

```bash
php -S localhost:8000
```

## 📁 파일 구조

```
ThaiEng/
├── app.html          # 메인 애플리케이션
├── data.json         # 학습 데이터
├── start-server.bat  # Windows 서버 시작 스크립트
└── README.md         # 이 파일
```

## 🔧 문제 해결

### CORS 오류가 발생하는 경우
- **절대** `file://` 프로토콜로 직접 열지 마세요
- 반드시 로컬 서버를 사용해야 합니다

### Python이 설치되지 않은 경우
- [Python 공식 사이트](https://www.python.org/downloads/)에서 다운로드
- 또는 Node.js 방법 사용

### 포트가 이미 사용 중인 경우
- 다른 포트 번호 사용: `python -m http.server 8080`
- 브라우저에서 `http://localhost:8080/app.html` 접속

## 📝 데이터 수정

`data.json` 파일을 수정하면 앱에 자동으로 반영됩니다.
서버를 재시작할 필요 없이 브라우저에서 새로고침(F5)만 하면 됩니다.

## 🎯 사용법

1. 서버 시작
2. 브라우저에서 `http://localhost:8000/app.html` 접속
3. 일차별로 학습 진행
4. 태국어/영어 탭 전환
5. 퀴즈로 복습

## 🌐 배포하기

이 프로젝트를 온라인에 배포하려면 `DEPLOY.md` 파일을 참고하세요.

### 빠른 배포 (GitHub Pages)
1. GitHub에 저장소 생성
2. 프로젝트 푸시
3. Settings → Pages에서 활성화
4. 완료!

자세한 내용은 `DEPLOY.md`를 확인하세요.

