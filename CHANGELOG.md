# 3.2.1

Release Date: 2019-02-22

### 개선

- ​​지도 로딩 속도 및 데이터 사용량 개선

### 버그 수정

- 마커 캡션에 이모지 사용시 간헐적으로 크래시가 발생하는 오류 수정

# 3.2.0

Release Date: 2019-02-14

### 새로운 기능

- 공공기관용 네이버 클라우드 플랫폼 지원
  - `NMFMAuthManager.govClientId`

### 개선

- 오버레이의 비트맵을 오버레이가 화면에 나타나는 순간에 백그라운드에서 디코딩하도록 개선
- 마커 캡션에 이모지를 넣을 수 있도록 개선

### 버그 수정

- `isHideCollidedSymbol`이 `true`인 마커를 추가/삭제할 때 심벌이 재배치되지 않는 현상 수정
- 줌 변경시 지도 심벌이 겹쳐나오는 현상 수정
- 지도 로딩시 검은 화면이 잠깐 나타났다 사라지는 현상 수정
- 앱이 백그라운드에 있을 때 지도 API를 호출하고 포그라운드로 전환하면 화면이 즉시 갱신되지 않는 오류 수정
- 시계방향으로 10도 미만 회전 된 경우 0도로 되돌아 가지 않는 오류 수정
- 지도에 contentInset을 지정 할 때 cameraPosition이 업데이트 되지 않는 오류 수정

# 3.1.0

Release Date: 2019-01-21

### 새로운 기능

- 마커 아이콘과 다른 마커 간 겹침시 숨김 옵션 추가
  - `NMFMarker.isHideCollidedMarkers`
  - `NMFMarker.isForceShowIcon`
- 네이버 로고 위치 변경 기능 제공
  - `NMFMapView.logoAlign`
  - `NMFMapView.logoMargin`

### 개선

- `NMFCircleOverlay`의 테두리 퀄리티 개선
- SDK 내에서 사용하는 문자열에 다국어 대응 추가
- SDK 사용 인증시 인터넷 연결이 되지 않을 경우 인증 실패로 간주하지 않고 연결을 기다리도록 개선

### 버그 수정

- `NMFInfoWindow`의 `-openWithMarker:`를 여러 마커에 대해 호출시 크래시가 발생하는 오류 수정
- `NMFMapType`이 `NMFMapTypeSatellite`일 때 지상, 폴리라인, 폴리곤, 경로선 오버레이가 나타나지 않는 오류 수정
- 간헐적으로 일부 심벌 캐릭터가 이상한 문자로 노출되는 현상 수정
- 줌 레벨 변경시 심벌 사이즈가 부자연스럽게 커졌다 작아지는 현상 수정
- 마커 추가시 페이드 인 애니메이션이 무조건 발생하는 현상 수정
- 제스처를 모두 막은 상태에서 Pinch 제스처로 지도 이동하는 오류 수정
- 오버레이 이미지가 간헐적으로 중복되는 오류 수정
- `NMFProjection.latlngBoundsFromViewBounds`사용시 크기가 0인 `NMGLatLngBounds`를 반환하는 오류 수정

# 3.0.0

Release Date: 2018-11-12

Initial Release
