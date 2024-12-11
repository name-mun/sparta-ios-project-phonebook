# iOS 연락처 어플
![Simulator Screen Recording - iPhone 16 Pro - 2024-12-11 at 19 07 31](https://github.com/user-attachments/assets/74712d35-d98d-48dd-8ee4-90a4d748b19c)

## 목차
1. [프로젝트 소개](#star-프로젝트-소개)
2. [개발 기간](#calendar-개발기간)
3. [기술스택](#hammer_and_wrench-기술스택)
5. [주요기능](#sparkles-주요기능)
6. [개발 환경](#computer-개발-환경)
7. [설치 및 실행 방법](#inbox_tray-설치-및-실행-방법)
8. [트러블 슈팅](#bug-트러블-슈팅)
<br><br>

## :star: 프로젝트 소개
이 프로젝트는 내일배움캠프 7-8주차 과제로, 네트워크와 데이터 처리를 활용하기 위해 제작한 **간단한 연락처 어플**입니다. 사용자가 입력한 연락처를 저장, 수정, 조회할 수 있습니다. 
<br><br>
## :calendar: 개발기간
- 2024.12.6.(금) ~ 2024.12.12(목)
<br><br>
## :hammer_and_wrench: 기술스택

### :building_construction: 아키텍처
- MVC

### :art: UI Framworks
- UIKit
- AutoLayout
<br><br>

## :sparkles: 주요기능
- **연락처 생성**: 사용자가 입력한 값을 기반으로 `CoreData`에 새 연락처를 저장합니다. 
- **연락처 수정**: `id`를 사용해 특정 연락처를 검색한 뒤, 수정된 값을 저장합니다. 
- **연락처 로드**: `CoreData`에 저장된 모든 연락처를 불러와 화면에 표시합니다.
- **랜덤 이미지 로드**: `포켓몬 API`를 사용해 랜덤 이미지를 가져옵니다.
<br><br>

## :computer: 개발 환경
- **Xcode**: 16.1
- **iOS Deployment Target**: iOS 18.1
- **iOS Tested Version**: iOS 18.1 (시뮬레이터 및 실제 기기)
<br><br>
## :inbox_tray: 설치 및 실행 방법
1. 이 저장소를 클론합니다.
```bash
git clone https://github.com/name-mun/sparta-ios-project-phonebook.git
```
2. 프로젝트 디렉토리로 이동합니다.
```bash
cd sparta-ios-project-phonebook

```
3. Xcode에서 `sparta-ios-project-phonebook.xcodeproj` 파일을 엽니다.

4. Xcode에서 빌드 후 실행합니다.
- 실행 대상에서 **iPhone Simulator** 선택
- **Cmd + R**로 실행
<br><br>
## :bug: 트러블 슈팅
👉 [네비게이션바 트러블 슈팅](https://name-mun.tistory.com/53)

👉 [코어데이터 생성 트러블 슈팅](https://name-mun.tistory.com/49)

