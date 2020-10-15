# NAVER Map iOS SDK Demo

## How To Run

### SDK 최신 버전(3.10.0) 업데이트

1. CocoaPods 인스톨이 필요합니다.
```
sudo gem install cocoapods
```
2. **대용량 파일을 받기 위해 [git-lfs](https://git-lfs.github.com) 설치가 필요합니다.**
   - git-lfs 를 설치하지 않으면 바이너리 대신 설정 파일만 받아오게 되어 컴파일 시 오류가 납니다. git-lfs 를 통해 정상적으로 다운받은 프레임워크의 용량은 대략 190MB 내외입니다.
```
brew install git-lfs
```
3. **git-lfs 설치 후 반드시 초기화 해주어야 합니다.**
```
git-lfs install
```
4. SDK 를 최신 버전으로 업데이트 합니다.
```
pod install --repo-update
```
  - 만약 최신 버전으로 업데이트가 안되면, Podfile 을 열어서 버전을 명시해 주고(`pod 'NMapsMap','3.10.0'`), 위의 명령을 다시 실행합니다.

### 클라이언트 ID 지정

- 네이버 지도 SDK를 사용하기 위해서는 네이버 클라우드 플랫폼에서 클라이언트 ID를 발급받고, 발급받은 ID를 SDK에 지정해야 합니다.
- 클라이언트 ID 발급
  1. [네이버 클라우드 플랫폼](https://www.ncloud.com)에 로그인한 후 [콘솔](https://console.ncloud.com)에 들어갑니다.
  2. **Products & Services**에서 **AI-Application Service** 하위의 **AI·NAVER API**를 선택합니다.
  3. **Application 등록**을 선택하고 **Maps** 하위의 **Mobile Dynamic Map**을 체크합니다.
  4. iOS Bundle ID에 `com.naver.maps.map.demo`을 추가하고 등록합니다.
  5. 등록한 애플리케이션의 인증 정보를 선택해 Client ID를 확인합니다.
- 클라이언트 ID 지정
  - `info.plist`의 `NMFClientId`에 발급받은 클라이언트 ID를 입력합니다.
- 자세한 내용은 [시작하기](https://navermaps.github.io/ios-map-sdk/guide/1.html)를 참고하십시오.

## Reference

- [개발 가이드](https://navermaps.github.io/ios-map-sdk/)
- [API 레퍼런스](https://navermaps.github.io/ios-map-sdk/reference/)
- [Changelog](https://github.com/navermaps/ios-map-sdk/blob/master/CHANGELOG.md)

## License

Copyright (c) 2018 NAVER Corp.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
