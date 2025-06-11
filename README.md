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

## 프로젝트 설정 및 실행 방법

### 1. 프로젝트 클론
```bash
git clone [repository-url]
cd ex-Websocket
```

### 2. Maven 빌드
```bash
mvn clean install
```

### 3. Tomcat 설정
1. Tomcat 8.5 이상 버전을 다운로드하여 설치
2. Tomcat의 `conf/server.xml`에서 포트 설정 확인 (기본 8080)
3. Tomcat의 `webapps` 디렉토리에 빌드된 WAR 파일 복사
   - `target/ex-Websocket.war` 파일을 Tomcat의 `webapps` 디렉토리로 복사

### 4. 서버 실행
1. Tomcat의 `bin` 디렉토리에서 다음 명령어 실행:
   - Windows: `startup.bat`
   - Linux/Mac: `./startup.sh`

### 5. 접속
- 웹 브라우저에서 `http://localhost:8080` 접속

## 프로젝트 구조
```
src/
├── main/
│   ├── java/        # Java 소스 코드
│   ├── resources/   # 설정 파일
│   └── webapp/      # 웹 리소스
└── test/            # 테스트 코드
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
