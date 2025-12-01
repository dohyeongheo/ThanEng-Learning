# 배포 가이드

이 프로젝트는 정적 웹 애플리케이션이므로 여러 방법으로 배포할 수 있습니다.

## 방법 1: GitHub Pages (추천 - 무료)

### 1단계: GitHub 저장소 생성
1. [GitHub](https://github.com)에 로그인
2. 새 저장소 생성 (예: `ThaiEng-Learning`)
3. 저장소를 생성할 때 README는 추가하지 않기

### 2단계: 로컬 저장소와 연결
```bash
git remote add origin https://github.com/YOUR_USERNAME/ThaiEng-Learning.git
git branch -M main
git push -u origin main
```

### 3단계: GitHub Pages 활성화
1. GitHub 저장소 페이지로 이동
2. Settings → Pages 클릭
3. Source에서 "Deploy from a branch" 선택
4. Branch: `main`, Folder: `/ (root)` 선택
5. Save 클릭

### 4단계: 접속
- 몇 분 후 `https://YOUR_USERNAME.github.io/ThaiEng-Learning/app.html` 접속 가능
- 또는 `https://YOUR_USERNAME.github.io/ThaiEng-Learning/` (index.html이 있다면)

## 방법 2: Netlify (무료, 간단)

### 드래그 앤 드롭
1. [Netlify](https://www.netlify.com) 접속
2. "Add new site" → "Deploy manually"
3. 프로젝트 폴더를 드래그 앤 드롭
4. 자동으로 배포 완료!

### 또는 Netlify CLI
```bash
npm install -g netlify-cli
netlify deploy
netlify deploy --prod
```

## 방법 3: Vercel (무료)

```bash
npm install -g vercel
vercel
```

## 방법 4: 기타 호스팅 서비스

- **Firebase Hosting**: Google의 무료 호스팅
- **Cloudflare Pages**: 빠른 CDN 제공
- **AWS S3 + CloudFront**: AWS 사용 시
- **GitLab Pages**: GitLab 사용 시

## 중요 사항

- `data.json` 파일이 정상적으로 로드되려면 반드시 HTTP 서버를 통해 접속해야 합니다
- `file://` 프로토콜로 직접 열면 CORS 오류가 발생합니다
- 배포 후에도 로컬 서버처럼 동작합니다

