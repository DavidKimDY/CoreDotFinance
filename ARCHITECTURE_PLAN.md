# CoreDotFinance 아키텍처 개선 Plan (간단 버전)

> 목표: 대규모 리팩터링 없이, 유지보수와 확장이 쉬워지도록 **얇은 레이어만** 정리한다.

## 현재 구조 (요약)

```
사용자
  ├─ KrxReader (data.py)          ← 고수준 API
  └─ data_reader (krx/api)        ← 저수준 API
         ↓
  classify.get_krx_instance()     ← 기능코드 → 클래스 분기
         ↓
  krx_website/* (Stock, Index…)     ← post_params 생성
         ↓
  fetch + jsp_util + column         ← KRX 서버 통신·파싱
         ↓
  process.get_dataframe()           ← DataFrame 변환
```

Binance / Database / Yahoo는 KRX와 별도 모듈로 공존한다.

---

## 문제점 (수정이 필요한 부분)

### 1. 진입점이 두 개
- `KrxReader.read()`와 `data_reader()`가 같은 일을 하지만 날짜 검증·옵션 처리가 분산되어 있다.
- `KrxReader.search()`는 `Info`를 직접 생성해 우회한다.

### 2. 기능코드 분기가 미완성
- `bond`, `derivative`, `commodity`, `oversees` 클래스는 있으나 `classify.py`에 연결되지 않았다.
- `function_code_list`는 정의만 있고 `import *`로 묶여 있어 추적이 어렵다.

### 3. HTTP 호출이 흩어져 있음
- KRX URL·헤더가 `fetch.py`, `info.py`, `jsp_util.py`에 각각 하드코딩되어 있다.
- `http://` 사용, 에러 처리·재시도 정책이 통일되지 않았다.

### 4. 부수효과·예외 처리
- `data_reader`가 `print(symbol_name)`으로 출력한다 (라이브러리에 부적합).
- `process.py`에 bare `except`, `fetch.py` JSON 실패 시 `None` 반환 가능.

---

## 개선 방향 (3단계)

### Step 1 — 공통 HTTP 클라이언트 (1파일)
**새 파일:** `coredotfinance/krx/core/client.py`

| 역할 | 내용 |
|------|------|
| URL 상수 | `BASE_URL`, `getJsonData`, `executeForResourceBundle`, JSP 경로 |
| 헤더 | User-Agent 한곳에서 관리 |
| 메서드 | `get_json()`, `get_jsp()`, `post_json()` |

`fetch.py`, `info.py`, `jsp_util.py`는 이 클라이언트만 호출하도록 점진 교체.

### Step 2 — KRX 파이프라인 하나로 묶기
**새 파일:** `coredotfinance/krx/core/pipeline.py`

```python
def fetch_krx_dataframe(krx_instance) -> pd.DataFrame:
    post_params = krx_instance.get_requested_data()
    # mdcstat → jsp → 변환 → 요청 → 컬럼 → DataFrame
```

- `data_reader()`와 `KrxReader` 내부가 **같은 함수**를 호출하게 한다.
- 날짜 변환(`YYYY-MM-DD` ↔ `YYYYMMDD`)은 `krx/core/dates.py` 한곳으로 모은다.

### Step 3 — 기능코드 레지스트리
**수정:** `classify.py` + `function_code_list.py`

```python
CODE_REGISTRY = {
    "stock": (stock_code_list, stock.Stock),
    "product": (product_code_list, products.Product),
    "index": (index_code_list, index.Index),
    # 이후 bond, derivative … 추가
}
```

- `import *` 제거.
- 미구현 도메인은 레지스트리에 주석 + `NotImplementedError`로 명시.

---

## 하지 않을 것 (스코프 제한)

- 전체 도메인 클래스 재설계 (Stock/Bond 등 상속 구조 유지)
- async / 캐시 레이어 / DI 프레임워크 도입
- Binance·Yahoo 모듈 통합
- JSP 로컬 캐시 방식 변경

---

## 권장 작업 순서

1. `client.py` 추가 → `fetch.py`만 먼저 이전 (테스트 통과 확인)
2. `pipeline.py` 추가 → `data_reader` 리팩터
3. `KrxReader`가 `pipeline` 사용하도록 연결
4. `classify` 레지스트리 정리 + bond 등 순차 연결
5. `print` 제거, 예외 타입 정리 (`KrxNoDataError` 등)

---

## 완료 기준 (Done)

- [ ] KRX HTTP 호출이 `client.py` 한곳에서만 이루어진다
- [ ] `data_reader`와 `KrxReader.read`가 동일 파이프라인을 탄다
- [ ] `classify`에서 코드 목록·클래스 매핑이 한눈에 보인다
- [ ] 라이브러리 호출 시 `print` 부수효과가 없다
