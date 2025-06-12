# eGovFramework WebSocket 채팅 서비스

이 프로젝트는 eGovFramework를 기반으로 한 WebSocket을 이용한 실시간 채팅 서비스입니다.

## 기술 스택

- Java 8
- Spring Framework 5.3.20
- eGovFramework 4.1.0
- WebSocket
- Maven
- Tomcat 8.5 이상

## 필수 요구사항

1. JDK 8 설치
2. Maven 설치
3. Tomcat 8.5 이상 설치

## 이클립스에서 Run on Server로 실행 (전자정부 프레임워크 환경)

1. **이클립스에서 프로젝트 임포트**
   - 이클립스를 실행하고, `File > Import > Existing Maven Projects` 선택
   - 프로젝트 폴더를 지정하여 임포트

2. **Tomcat 서버 등록**
   - `Servers` 뷰에서 `New > Server` 선택
   - Tomcat 8.5 이상 서버를 선택하고 경로 지정

3. **Run on Server 실행**
   - 프로젝트를 선택하고 우클릭
   - `Run As > Run on Server` 메뉴 클릭
   - 등록한 Tomcat 서버 선택 후 완료

4. **접속**
   - 자동으로 브라우저가 실행되거나,
   - 수동으로 `http://localhost:8080` 접속

## 프로젝트 구조
```
src/
├── main/
    ├── java/        # Java 소스 코드
    ├── resources/   # 설정 파일
    └── webapp/      # 웹 리소스
```

## 주요 기능
- 실시간 WebSocket 기반 채팅
- 다중 사용자 지원
- 메시지 전송 및 수신

## 문제 해결
1. 포트 충돌 발생 시
   - Tomcat의 `conf/server.xml`에서 포트 번호 변경
   - 기본 포트: 8080

2. 빌드 오류 발생 시
   - Maven 캐시 삭제: `mvn clean`
   - 의존성 다시 다운로드: `mvn dependency:purge-local-repository`

## 라이선스
이 프로젝트는 eGovFramework 라이선스를 따릅니다.
