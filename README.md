# NAVER Map iOS SDK Demo

## How To Run

### CocoaPods 구성

- CocoaPods 인스톨이 필요합니다.
- # **<span style="color:red">대용량 파일을 받기 위해 [git-lfs](https://git-lfs.github.com) 설치가 필요합니다.</span>**
- git-lfs를 설치하지 않으면 바이너리대신 설정파일만 받아오게 되어 [컴파일시 오류](https://github.com/navermaps/ios-map-sdk/issues/1)가 납니다. 정상적으로 다운받은 프레임워크의 용량은 대략 190MB 내외입니다.

```
sudo gem install cocoapods // cocoapods 설치
brew install git-lfs       // homebrew 사용시 git-lfs 설치
git-lfs install            // git-lfs 이니셜라이즈
pod install --repo-update
```

### 클라이언트 ID 지정

- 네이버 지도 SDK를 사용하기 위해서는 네이버 클라우드 플랫폼에서 클라이언트 ID를 발급받고, 발급받은 ID를 SDK에 지정해야 합니다.
- 클라이언트 ID 발급
  1. [네이버 클라우드 플랫폼](https://www.ncloud.com) 콘솔의 **AI·Application Service > AI·NAVER API > Application**에서 애플리케이션을 등록합니다.
  2. **AI·Application Service > AI·NAVER API > Application**에서 등록한 애플리케이션을 선택해 Client ID값을 확인합니다.
  3. **AI·Application Service > AI·NAVER API > Application**의 **변경** 화면에서 **Maps**가 선택되어 있는지 확인합니다.
- 클라이언트 ID 지정
  - `info.plist`의 `NMFClientId`에 네이버 클라우드 플랫폼에서 발급받은 클라이언트 ID를 입력합니다.
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
