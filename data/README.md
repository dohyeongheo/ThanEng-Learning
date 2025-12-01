# 데이터 디렉토리

이 디렉토리는 학습 데이터 파일들을 포함합니다.

## 파일 구조

- `index.json`: Day 목록 및 메타데이터, 파일 매핑 정보
- `day-{번호}.json`: 각 Day별 데이터 파일 (예: day-1.json, day-2.json)

## 접근 방법

애플리케이션은 다음 순서로 데이터를 로드합니다:
1. `data/index.json` 로드 (메타데이터)
2. 필요한 Day 데이터만 개별 로드 (Lazy Loading)

