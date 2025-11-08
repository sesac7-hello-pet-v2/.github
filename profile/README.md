
---
## 🐶 프로젝트 소개

### 배경
- 매년 약 10만 마리의 유기동물이 발생하지만, 입양률은 25%에 불과
- 낮은 입양 정보 접근성으로 인해 보호소의 운영 부담 및 안락사율 증가


### 목적
- 보호소의 운영 부담을 줄이고, 입양 문화를 확산하기 위한 서비스 구축
- 안정적 운영과 향후 확장을 고려한 클라우드 기반 MSA 시스템 구현


### 기간
- 2025.09.23 ~ 2025.10.27 (35일)

<br />

### 실제 메인페이지
<img width="1216" height="1294" alt="localhost_3000_ (1)" src="https://github.com/user-attachments/assets/44e5bc38-9f28-4d87-a79f-32d6b5c17ee4" />

<br />


---

## 🐶 개발자

| <img src="https://github.com/ryukyungwoo.png" width="100"/> | <img src="https://github.com/xeimun.png" width="100"/> | <img src="https://github.com/namung08.png" width="100"/> |
|:---:|:---:|:---:|
| **[경우](https://github.com/ryukyungwoo)** | **[민주](https://github.com/xeimun)** | **[상준](https://github.com/namung08)** |
| DevOps 엔지니어 & PM | Backend 엔지니어 | Backend 엔지니어 |
| IaC를 활용한 인프라 구축<br/>모니터링 및 CI/CD 구축 | 입양 플랫폼 핵심 서비스 API 설계 및 구현<br/>상태 로직 고도화로 입양 프로세스 안정화 | 게시판 서비스 고도화<br/>E2E 테스트 자동화 |

<br />

---

## 🐶 기술 스택

### Frontend
![Next.js](https://img.shields.io/badge/Next.js-000000?style=flat-square&logo=next.js&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat-square&logo=tailwindcss&logoColor=white)
![Zustand](https://img.shields.io/badge/Zustand-443E38?style=flat-square&logo=react&logoColor=white)

### Backend
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=flat-square&logo=spring-boot&logoColor=white)
![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=openjdk&logoColor=white)

### Database
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)

### Infrastructure
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-FF9900?style=flat-square&logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![Vagrant](https://img.shields.io/badge/Vagrant-1868F2?style=flat-square&logo=vagrant&logoColor=white)
![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat-square&logo=ansible&logoColor=white)

### CI/CD
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=github-actions&logoColor=white)
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=flat-square&logo=argo&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)

### Observability
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white)
![Loki](https://img.shields.io/badge/Loki-F7B500?style=flat-square&logo=grafana&logoColor=white)
![Tempo](https://img.shields.io/badge/Tempo-FF6C37?style=flat-square&logo=grafana&logoColor=white)

### Testing
![K6](https://img.shields.io/badge/K6-7D64FF?style=flat-square&logo=k6&logoColor=white)
![Playwright](https://img.shields.io/badge/Playwright-2EAD33?style=flat-square&logo=playwright&logoColor=white)
![OWASP ZAP](https://img.shields.io/badge/OWASP_ZAP-000000?style=flat-square&logo=owasp&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=flat-square&logo=postman&logoColor=white)

<br />

---

## 🐶 서비스 구성

| 서비스명 | 책임 |
|---------|------|
| Frontend | UI/UX, SSR |
| API Gateway | 라우팅, 인증 검증 |
| Auth Service | 인증/인가, JWT |
| User Service | 사용자 관리 |
| Board Service | 게시판 CRUD |
| Image Service | 이미지 처리 |
| Announcement Service | 입양 동물 공고 |
| Application Service | 입양 신청 |
| Pet Service | 입양동물 정보 |

<br />

---

## 🐶 주요 기능
### 🏠 보호소
유기동물 등록 및 관리<br />
입양 공고 생성 및 관리<br />
입양 신청서 검토 및 승인/거부<br />
<br />

### 🙋 입양희망자
입양 가능 동물 검색 및 조회<br />
입양 신청서 제출<br />
신청 현황 확인<br />
<br />

### 💬 커뮤니티
게시판 기능 (자유게시판, 후기 등)<br />
이미지 업로드 및 관리<br />
<br />

### 🔄 상태 관리 시스템
Pet: AVAILABLE → ANNOUNCED → ADOPTED<br />
Announcement: OPEN → CLOSED → COMPLETED<br />
Application: SUBMITTED → UNDER_REVIEW → APPROVED/REJECTED<br />

<br />

---
## 🐶 주요 비즈니스 로직
(입양 프로세스 다이어그램 추가 예정)

<br />

---

## 🐶 인프라 아키텍처
<p align="center">
<img width="1621" height="941" alt="image" src="https://github.com/user-attachments/assets/ee335a3e-f925-45d0-b250-df2e65eea724" />
</p>

<br />

---
   
## 🐶 CI/CD 파이프라인
<p align="center">
<img width="583" height="511" alt="image" src="https://github.com/user-attachments/assets/e537265e-8517-4096-8ef5-ed7754e5cf62" />
</p>

<br />

---

## 🐶 모니터링
(모니터링 관련 작업 내용 또는 이미지 추가 예정)

<br />

---


## 🐶 테스트 결과
### 부하 테스트 (K6)
- 기본 상태 확인: 30초, 10명, 성공률 100%<br />
- 스트레스 테스트: 15분, 300명, 219,768 요청, 성공률 100%<br />
- 장기 안정성: 34분, 50명, 47,380 요청, 성공률 100%<br />
<br />

### 보안 테스트 (OWASP ZAP)
- High Risk: 0<br />
- Medium Risk: 2<br />
- Low Risk: 4<br />
<br />

### E2E 테스트 (Playwright)
- 총 7개 테스트 시나리오 통과<br />
- 평균 실행 시간: 22.4초<br />

### 성능 지표
- 부하 테스트: 300 동시 사용자, 219,768 요청 성공률 100%<br />
- 페이지 성능: Google PageSpeed 99점, LCP 0.97초<br />
- 배포 시간: 평균 1분 39초<br />

<br />

---

## 🐶 확장 계획

| 기술 | 도입 목적 |
|------|----------|
| **SAGA 패턴** | MSA 환경에서 분산 트랜잭션 관리 및 비동기 이벤트 기반 처리 구현 |
| **메시지 큐 (Kafka/SQS)** | 비동기 이벤트 처리 및 입양 신청자 점수 자동 집계·순위 산정 시스템 구축 |
| **AI 매칭 엔진** | 사용자-반려동물 간 맞춤형 매칭 추천 시스템 구현 |

<br />
