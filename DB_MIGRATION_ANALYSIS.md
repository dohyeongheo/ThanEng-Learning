# DB 형식 전환 분석: RDBMS vs Supabase

## 현재 상황

- **데이터 크기**: 약 193KB (8305줄)
- **데이터 구조**: 단일 JSON 파일
- **배포 방식**: 정적 웹사이트 (GitHub Pages)
- **사용자**: 개인 학습 앱

## DB 형식 전환 옵션 비교

### 옵션 1: Supabase (추천 ⭐)

**특징:**
- PostgreSQL 기반 오픈소스 백엔드
- 무료 티어 제공 (500MB 데이터베이스, 2GB 대역폭)
- 실시간 구독, 인증, 스토리지 내장
- REST API 및 GraphQL 자동 생성

**장점:**
- ✅ 빠른 설정 (5분 내)
- ✅ 무료 티어로 시작 가능
- ✅ 실시간 데이터 업데이트
- ✅ 사용자별 데이터 관리 가능
- ✅ 강력한 검색 기능 (PostgreSQL Full-Text Search)
- ✅ 자동 API 생성
- ✅ Row Level Security (RLS)로 보안 관리
- ✅ 오프라인 지원 (Supabase JS 클라이언트 캐싱)

**단점:**
- ❌ 인터넷 연결 필요 (오프라인 제한적)
- ❌ 초기 설정 필요
- ❌ 무료 티어 제한 (트래픽 증가 시 유료)

**비용:**
- 무료: 500MB DB, 2GB 대역폭/월
- Pro: $25/월 (8GB DB, 50GB 대역폭)

**구현 복잡도:** ⭐⭐ (중간)

---

### 옵션 2: 전통적인 RDBMS (MySQL, PostgreSQL)

**특징:**
- 자체 서버 필요
- 직접 데이터베이스 관리

**장점:**
- ✅ 완전한 제어권
- ✅ 커스터마이징 자유도 높음
- ✅ 성능 최적화 가능

**단점:**
- ❌ 서버 인프라 필요
- ❌ 백엔드 API 개발 필요
- ❌ 유지보수 복잡
- ❌ 비용 발생 (서버, 도메인 등)

**비용:**
- 서버: $5-20/월 (VPS)
- 도메인: $10-15/년
- 개발 시간: 높음

**구현 복잡도:** ⭐⭐⭐⭐ (높음)

---

### 옵션 3: Firebase (Google)

**특징:**
- NoSQL 데이터베이스 (Firestore)
- 실시간 동기화
- 인증, 스토리지 내장

**장점:**
- ✅ 빠른 설정
- ✅ 실시간 동기화
- ✅ 무료 티어 제공
- ✅ 오프라인 지원 우수

**단점:**
- ❌ NoSQL (복잡한 쿼리 제한)
- ❌ 비용이 사용량에 따라 증가
- ❌ Google 의존성

**비용:**
- 무료: 1GB 저장, 10GB/월 전송
- Blaze: 사용량 기반

**구현 복잡도:** ⭐⭐⭐ (중간-높음)

---

### 옵션 4: IndexedDB (브라우저 내장)

**특징:**
- 클라이언트 사이드 데이터베이스
- 오프라인 완벽 지원
- 서버 불필요

**장점:**
- ✅ 완전 무료
- ✅ 오프라인 완벽 지원
- ✅ 서버 불필요
- ✅ 빠른 로컬 검색

**단점:**
- ❌ 브라우저별 제한
- ❌ 데이터 동기화 어려움
- ❌ 사용자 간 공유 불가
- ❌ 초기 데이터 로딩 필요

**구현 복잡도:** ⭐⭐⭐ (중간)

---

## 추천: Supabase 사용

### 이유

1. **현재 프로젝트에 적합**
   - 학습 앱은 정적 데이터가 많음
   - 향후 사용자별 학습 기록 추가 가능
   - 실시간 업데이트로 새 Day 추가 시 즉시 반영

2. **비용 효율적**
   - 무료 티어로 시작 가능
   - 193KB 데이터는 무료 티어로 충분

3. **확장성**
   - 사용자 증가 시에도 대응 가능
   - 학습 통계, 사용자별 진행도 등 추가 기능 구현 용이

4. **개발 편의성**
   - 자동 API 생성
   - 관리 대시보드 제공
   - SQL 직접 실행 가능

### Supabase 데이터베이스 스키마 설계

```sql
-- Days 테이블
CREATE TABLE days (
  id INTEGER PRIMARY KEY,
  topic TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Thai Words 테이블
CREATE TABLE thai_words (
  id SERIAL PRIMARY KEY,
  day_id INTEGER REFERENCES days(id),
  thai_text TEXT NOT NULL,
  korean_pronunciation TEXT,
  korean_meaning TEXT NOT NULL,
  order_index INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

-- English Words 테이블
CREATE TABLE english_words (
  id SERIAL PRIMARY KEY,
  day_id INTEGER REFERENCES days(id),
  english_text TEXT NOT NULL,
  korean_meaning TEXT NOT NULL,
  order_index INTEGER,
  created_at TIMESTAMP DEFAULT NOW()
);

-- 인덱스 추가 (검색 성능 향상)
CREATE INDEX idx_thai_words_day ON thai_words(day_id);
CREATE INDEX idx_english_words_day ON english_words(day_id);
CREATE INDEX idx_thai_words_meaning ON thai_words USING gin(to_tsvector('korean', korean_meaning));
CREATE INDEX idx_english_words_meaning ON english_words USING gin(to_tsvector('korean', korean_meaning));
```

### Supabase 마이그레이션 계획

1. **1단계: Supabase 프로젝트 생성**
   - supabase.com에서 무료 계정 생성
   - 새 프로젝트 생성

2. **2단계: 데이터베이스 스키마 생성**
   - 위의 SQL 스크립트 실행
   - RLS (Row Level Security) 설정

3. **3단계: 데이터 마이그레이션**
   - data.json → Supabase로 데이터 이전
   - Python 스크립트로 자동화 가능

4. **4단계: 클라이언트 코드 수정**
   - Supabase JS 클라이언트 추가
   - loadData() 함수를 Supabase 쿼리로 변경

5. **5단계: 캐싱 전략**
   - Supabase 클라이언트의 자동 캐싱 활용
   - 오프라인 지원

---

## 하이브리드 접근 (권장)

**현재 구조 유지 + Supabase 옵션 제공**

1. **기본**: JSON 파일 사용 (오프라인, 빠른 로딩)
2. **선택**: Supabase 연결 (실시간 업데이트, 사용자 기능)

```javascript
// 설정에서 데이터 소스 선택
const DATA_SOURCE = localStorage.getItem('data_source') || 'json'; // 'json' | 'supabase'

if (DATA_SOURCE === 'supabase') {
    await loadDataFromSupabase();
} else {
    await loadData(); // 기존 JSON 로드
}
```

---

## 결론 및 추천

### 현재 상황에서는:
- ✅ **JSON 구조 유지 권장**
  - 데이터 크기가 작음 (193KB)
  - 정적 데이터
  - 오프라인 완벽 지원
  - 서버 비용 없음

### Supabase 전환을 고려할 때:
- ✅ 사용자별 학습 기록 추가 시
- ✅ 실시간 데이터 업데이트 필요 시
- ✅ 다중 사용자 지원 필요 시
- ✅ 관리자 대시보드 필요 시

### 최종 추천:
**현재는 JSON 유지, 향후 필요 시 Supabase로 점진적 전환**

---

## Supabase 구현 예시 코드

```javascript
// Supabase 클라이언트 초기화
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'YOUR_SUPABASE_URL'
const supabaseKey = 'YOUR_SUPABASE_ANON_KEY'
const supabase = createClient(supabaseUrl, supabaseKey)

// 데이터 로드
async function loadDataFromSupabase() {
    // Days 목록 로드
    const { data: days, error } = await supabase
        .from('days')
        .select('*')
        .order('id')

    // 각 Day의 단어들 로드
    for (const day of days) {
        const [thaiWords, englishWords] = await Promise.all([
            supabase.from('thai_words').select('*').eq('day_id', day.id).order('order_index'),
            supabase.from('english_words').select('*').eq('day_id', day.id).order('order_index')
        ])

        DB[day.id] = {
            topic: day.topic,
            th: thaiWords.data,
            en: englishWords.data
        }
    }

    renderList()
}

// 검색 기능 (PostgreSQL Full-Text Search)
async function searchSupabase(query) {
    const { data } = await supabase
        .rpc('search_words', { search_query: query })
    return data
}
```

