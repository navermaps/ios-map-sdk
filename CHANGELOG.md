# 3.13.0

Release Date: 2021-06-11

### 새로운 기능

- 실내 지도 뷰를 나타내도록 요청하는 메서드 추가
  - `NMFMapView.requestIndoorView`

# 3.12.0

Release Date: 2021-06-02

### 새로운 기능

- 스냅숏 촬영시 지도 컨트롤을 제외시키는 옵션 추가
  - `NMFNaverMapView.takeSnapshotWithShowControls:complete`

### 개선

- 카메라의 화각 상향
- 카메라의 최대 틸트 63도로 상향
  - `NMF_MAXIMUM_TILT`

### 버그 수정

- `symbolScale` 및 / `symbolPerspectiveRatio` 변경시 심벌이 즉시 재배치되지 않는 현상 수정
- 도로명 심벌이 카메라 이동시마다 좌우로 반복해 반전되는 현상 수정
- `NMFLocationOverlay.subIcon` 지정 후 `NMFMapView.positionMode` 변경 시 서브 아이콘이 사라지는 현상 수정
- 내비 지도에서 일부 심벌이 나타나지 않는 현상 수정
- 카메라 애니매이션 중 탭해서 멈추는 경우 `NMFMapViewCameraDelegate.mapViewCameraIdle` 호출 안되는 현상 수정

# 3.11.0

Release Date: 2021-02-17

### 새로운 기능

- 마커 캡션이 `isHideCollidedCaptions`이 `true`인 다른 마커와 겹치더라도 항상 노출되도록 하는 옵션 추가
  - `NMFMarker.isForceShowCaption`

### 개선

- 심벌 겹침 처리 로직 개선

### 버그 수정

- `NMFMapView.positionMode` 변경 시 서브 아이콘 사라지는 현상 수정

# 3.10.2

Release Date: 2021-01-05

### 버그 수정

- `symbolPerspectiveRatio`가 반대로 동작하는 오류 수정
- 투 핑거 제스처시 카메라가 움직이지 않아도 카메라 이벤트가 발생하는 오류 수정

# 3.10.1

Release Date: 2020-11-25

### 버그 수정

- 코드로 맵뷰 생성하는 데모에서 줌 컨트롤 작동 안 되는 현상 수정
- iOS 14 이상에서 백그라운드로 나갔을 때 크래시 발생하는 현상 수정

# 3.10.0

Release Date: 2020-10-14

### 새로운 기능

- 콘텐츠 패딩을 포함한 영역을 반환하는 `NMFMapView.coveringBounds` / `NMFMapView.coveringRegion` 추가

### 개선

- 성능 및 안정성 개선

### 버그 수정

- 카메라를 움직일 때 줌 레벨을 변경하지 않더라도 미세하게 변경되는 현상 수정
- `isHideCollidedSymbols`가 `true`인 마커와 심벌이 겹칠 때 간혹 심벌이 나타나는 현상 수정

# 3.9.1

Release Date: 2020-08-21

### 개선

- 지도에 나타나는 심벌의 밀도 개선

### 버그 수정

- `NMFNaverMapView.mapView.positionMode` 에 `disabled` 가 아닌 값 지정하면, 종료 시 지도 객체가 소멸되지 않는 현상 수정

# 3.9.0

Release Date: 2020-07-21

### 새로운 기능

- 마커 보조 캡션의 최소/최대 줌 레벨을 주 캡션과 별도로 지정할 수 있도록 속성 제공
  - `NMFMarker.subCaptionMinZoom` / `NMFMarker.subCaptionMaxZoom`

### 개선

- `NMFInfoWindow.dataSource` weak 속성 제거

### 버그 수정

- 전화 걸기 창 나왔을 때 회전 시 지도가 일부만 그려지는 현상 수정
- 지적편집도 활성화시 지도를 틸트하지 않아도 3D 건물이 보이는 현상 수정
- 스크롤 제스처를 비활성화해도 일부 제스처에 의해 카메라의 위치가 변경되는 현상 수정
- `NMFMapView.positionMode` 지정 시 `NMFMapView` 객체가 소멸되지 않는 현상 수정

# 3.8.0

Release Date: 2020-04-10

### 새로운 기능

- 지도 컨트롤을 커스텀하게 배치할 수 있도록 기본 컨트롤을 API로 제공
- 지도 옵션이 변경되면 이벤트를 받을 수 있도록 `NMFMapViewOptionDelegate` 추가
- `NMFMapViewDelegate`를 대체하는 `NMFMapViewTouchDelegate` 및 `NMFMapViewCameraDelegate` 추가
- `NMFNaverMapView.positionMode`를 대체하는 `NMFMapView.positionMode` 추가

### 개선

- 마커간 우선순위가 동일할 경우 아이콘이 먼저 자리를 잡은 후 캡션이 자리를 잡도록 개선
- 마커 캡션의 오프셋에 음수를 지정할 수 있도록 개선
- 위치 서비스 사용 권한이 `Always`일 때도 위치 추적 모드를 사용할 수 있도록 개선

### 버그 수정

- `NMFMarker.subCaptionRequestedWidth`를 변경해도 보조 캡션의 너비가 즉시 변경되지 않는 현상 수정
- `NMFCircleOverlay`를 기본 생성자로 생성하면 크래시가 발생하는 오류 수정
- `NMGLatLngBounds`가 클 때 `NMFUtils.getFittableZoomLevelWith:insets:mapView` 및 `NMFCameraUpdate.cameraUpdateWithFitBounds`에 오차가 발생하는 오류 수정
- 앱이 다크 모드일 때 `NMFInfoWindow`의 텍스트가 나타나지 않는 현상 수정
- 인터넷이 오프라인일 때 캐시가 되어있더라도 심벌이 나타나지 않는 현상 수정
- 인터넷이 오프라인에서 온라인으로 전환되더라도 지도가 로딩되지 않는 현상 수정

# 3.7.0

Release Date: 2020-01-29

### 새로운 기능

- 지도의 줌 레벨과 오버레이의 최소/최대 줌 레벨이 동일할 때 오버레이를 보일지 여부를 지정하는 기능 추가
  - `NMFOverlay.isMinZoomInclusive` / `NMFOverlay.isMaxZoomInclusive`
- 특정 영역이 화면에 온전히 보이는 최대 줌 레벨을 반환하는 유틸리티 메서드 추가
  - `NMFCameraUtils.getFittableZoomLevelWith`

### 개선

- 경로선 진척률을 음수로 지정할 수 있도록 개선
  - `NMFPath.progress` / `NMFMultipartPath.progress`

### 버그 수정

- 카메라의 영역을 제한하고 영역 바깥쪽에서 제스처로 지도를 스크롤하면 카메라가 잘못된 위치로 이동하는 현상 수정 
- 코드로 `NMFNaverMapView` 생성 시 최초 로딩이 안되는 현상 수정
- 두 개 이상의 맵뷰 생성 시 첫 번째 맵뷰 제외하고 최초 로딩이 안되는 현상 수정

# 3.6.1

Release Date: 2019-12-11

### 버그 수정

- 정보 창을 마커에 열 경우 간헐적으로 지도와 마커 간의 싱크가 맞지 않는 현상 수정
- 경로선이 간헐적으로 심벌 위에 나타나는 현상 수정
- 일부 도로 번호가 비뚤게 나타나는 현상 수정

# 3.6.0

Release Date: 2019-10-04

### 새로운 기능

- 마커 캡션의 최소/최대 줌 레벨을 아이콘과 별도로 지정할 수 있는 기능 추가
  - `NMFMarker.captionMaxZoom`, `captionMinZoom`
- 마커 캡션이 다른 요소와 겹칠 경우 동적으로 다른 곳에 배치하는 옵션 추가
  - `NMFMarker.captionAligns`
  - `NMFAlign` 열거형 대신 `NMFAlignType` 클래스 속성 사용
- 마커가 충돌되어 사라지더라도 자신의 영역을 유지하도록 하는 옵션 추가
  - `NMFMarker.occupySpaceOnCollision`
- 경로선과 겹치는 마커, 캡션, 지도 심벌을 숨기는 기능 추가
  - `NMFPath.isHideCollidedSymbols` / `isHideCollidedMarkers` / `isHideCollidedCaptions`
  - `NMFMultipartPath.isHideCollidedSymbols` / `isHideCollidedMarkers` / `isHideCollidedCaptions`
- 카메라 이동 트랜지션 취소 시 원인을 전달할 수 있도록 `reason` 파라메터 추가
  - `NMFMapView.cancelTransitions(NSInteger)`

### 개선

- `NMFGroundOverlay`, `NMFInfoWindow`에서 더 큰 이미지를 사용할 수 있도록 지원
- 메모리 사용량 개선

### 버그 수정

- `NMFPolylineOverlay`의 `capType`, `joinType`이 적용되지 않는 오류 수정
- `NMFPolylineOverlay`에 일부 크랙이 발생하는 현상 수정
- `extent`를 지정하고 지도를 빠르게 패닝하면 지도가 잘못된 방향으로 이동하는 현상 수정
- 마커가 충돌되어 사라지는 중에 충돌하지 않는 곳으로 위치를 변경하면 하면 페이드인이 일어나는 현상 수정
- 지도 회전시 일부 심벌이 번쩍이는 현상 수정
- 지도 뷰의 높이가 작을 때 경로선 패턴이 나타나지 않는 현상 수정
- 높이가 너비보다 큰 이미지를 경로선 패턴으로 사용하면 패턴이 부자연스럽게 나타나는 현상 수정

# 3.5.0

Release Date: 2019-08-12

### 새로운 기능

- 배경 지도를 그리지 않는 지도 유형 추가
  - `NMFMapTypeNone`
- 밝은/어두운 기본 배경색을 각각 상수로 제공
  - `NMFDefaultBackgroundLightColor`, `NMFDefaultBackgroundDarkColor`

### 개선

- `NMFPolygonOverlay`의 외곽선 퀄리티 개선
- 성능 및 데이터 사용량 개선

### 버그 수정

- `NMFPolygonOverlay`사용중 `NMGPolygon`객체의 `interiorRings`가 존재할 경우 일부 영역이 비정상적으로 렌더링되는 오류 수정
- 경로의 길이가 매우 긴 경우 `- NMFGeometryUtils.progressWithLatLngs`, `- NMFGeometryUtils.progressWithLineStrings`의 오차가 큰 오류 수정
- 일부 지도 심벌이 경로선 아래에 나타나는 현상 수정
- 남/북극을 초과하는 영역에 배경색이 적용되지 않는 현상 수정
- 일부 아랍 문자가 노출되지 않는 현상 수정

# 3.4.0

Release Date: 2019-06-07

### 새로운 기능

- Path 및 Polygon 오버레이에서 속성 및 생성자 추가
  - `NMFPath.pathWithLineString`
  - `NMFMultipartPath.multipartPath`
  - `NMFPolygonOverlay.polygonOverlayWith`
- Projection, InfoWindow 데모 추가

### 개선

- Path 및 Polygon 오버레이의 속성 및 메서드 변경
  - `NMFPath.points` -> `NMFPath.path`
  - `NMFPath.pathWithPoints` 매개변수로 `NMGLatLng` 배열 받음
  - `NMFMultipartPath.coordParts` -> `NMFMultipartPath.lineParts`
  - `NMFMultipartPath.multipartPathWithCoordParts` -> `NMFMultipartPath.multipartPathWith`
  - `NMFPolygonOverlay.updatePolygon` -> `NMFPolygonOverlay.polygon`
- 실내지도 층 컨트롤 연결층 텍스트 추가
- 앱 사용중에만 위치 권한을 받도록 수정

### 버그 수정

- 마커 캡션에 일부 잘못된 이모지가 노출되는 오류 수정
- 메모리가 부족할 때 일부 지도 심벌 텍스트가 노출되지 않는 현상 수정

# 3.3.0

Release Date: 2019-04-08

### 새로운 기능

- 유형이 다른 오버레이간의 겹침 우선순위를 지정하는 기능 추가
  - `NMFOverlay.globalZIndex`
- 마커 아이콘에 색상을 덧입히는 기능 추가
  - `NMFMarker.iconTintColor`
- 현재 화면을 커버하는 타일 ID를 가져오는 기능 추가
  - `NMFTileCoverHelper`

### 개선

- 심벌 렌더링 성능 개선
- bitcode 적용
- 내위치 버튼을 사용하지 않아도 positionMode 가 동작하도록 개선

### 버그 수정

- 빌딩 레이어 그룹(`NMF_LAYER_GROUP_BUILDING`)이 기본적으로 비활성화되어 있는 오류 수정
- 특정 심벌 피킹시 간혹 크래시가 발생하는 오류 수정
- 지도 SDK 사용시 `LocalizedString`이 동작하지않는 오류 수정

# 3.2.1

Release Date: 2019-02-22

### 개선

- 지도 로딩 속도 및 데이터 사용량 개선

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
