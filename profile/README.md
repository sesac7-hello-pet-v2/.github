# HelloPet 🐾
<img width="1216" height="1294" alt="localhost_3000_ (1)" src="https://github.com/user-attachments/assets/44e5bc38-9f28-4d87-a79f-32d6b5c17ee4" />
반려동물과 반려인을 이어주는 따뜻한 연결고리를 만들고 싶어 시작한 프로젝트예요.

매년 10만 마리가 넘는 동물들이 보호소에 들어오지만, 충분한 입양이 이루어지지 않아 많은 아이들이 안락사되는 현실이 이어지고 있어요.

Hello PET은 이 안타까운 현실을 조금이라도 바꾸고 싶다는 마음에서 시작됐어요.

우리의 목표는 단순해요.

예비 반려인분들이 보호 중인 동물의 정보를 쉽게 확인하고, 입양 절차를 간편하게 안내받아 신청할 수 있도록 해서 더 많은 동물들이 따뜻한 가족을 만날 수 있게 돕는 거예요.

저희를 통해 소중한 인연이 만들어진다면 정말 기쁠 것 같아요.
여러분도 새로운 가족과의 특별한 만남, 함께 시작해보시는 건 어떨까요?

<br />
<br />

---

## 🎯 프로젝트 개요
### 배경

연간 약 11만 마리의 유기동물 발생 (2024년 기준)<br />
입양률 25%, 자연사/안락사 비율 45%<br />
입양 정보 접근성 부족 문제 해결 필요<br />

### 목적
모놀리식 아키텍처의 한계를 극복하고 확장 가능하고 안정적인 클라우드 기반 MSA 시스템 구축<br />

### 프로젝트 기간
2025.09.23 - 2025.10.27 (35일)<br />

<br />
<br />


---

## 👥 팀원

| <img src="https://github.com/ryukyungwoo.png" width="100"/> | <img src="https://github.com/xeimun.png" width="100"/> | <img src="https://github.com/namung08.png" width="100"/> |
|:---:|:---:|:---:|
| **[경우](https://github.com/ryukyungwoo)** | **[민주](https://github.com/xeimun)** | **[상준](https://github.com/namung08)** |
| DevOps 엔지니어 & PM | Backend 엔지니어 | Backend 엔지니어 |
| IaC를 활용한 인프라 구축<br/>모니터링 및 CI/CD 구축 | 입양 플랫폼 핵심 서비스 API 설계 및 구현<br/>상태 로직 고도화로 입양 프로세스 안정화 | 게시판 서비스 고도화<br/>E2E 테스트 자동화 |

<br />
<br />


---

## 🛠 기술 스택

### Frontend
![Next.js](https://img.shields.io/badge/Next.js-000000?style=flat-square&logo=next.js&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)

### Backend
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=flat-square&logo=spring-boot&logoColor=white)
![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=openjdk&logoColor=white)

### Database
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white)

### Infrastructure
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)
![AWS EKS](https://img.shields.io/badge/AWS_EKS-FF9900?style=flat-square&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![Vagrant](https://img.shields.io/badge/Vagrant-1868F2?style=flat-square&logo=vagrant&logoColor=white)

### CI/CD & GitOps
![ArgoCD](https://img.shields.io/badge/ArgoCD-EF7B4D?style=flat-square&logo=argo&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=github-actions&logoColor=white)
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
<br />


---

## ✨ 주요 기능
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
<br />


---

## 🏗 서비스 구성

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
<br />


---


## 서비스 아키텍처

AWS EKS Architecture

Multi-AZ 고가용성 구성
HPA + Cluster Autoscaler 자동 스케일링
ArgoCD GitOps 기반 자동 배포
Grafana Stack Full Observability
   
### cicd 파이프라인

### 모니터링

### cicd 과정

<br />
<br />


---

## 중요 비즈니스 로직(입양 프로세스)

<br />
<br />


---

## 📊 테스트 결과
### 부하 테스트 (K6)

✅ 기본 상태 확인: 30초, 10명, 성공률 100%<br />
✅ 스트레스 테스트: 15분, 300명, 219,768 요청, 성공률 100%<br />
✅ 장기 안정성: 34분, 50명, 47,380 요청, 성공률 100%<br />
<br />

### 보안 테스트 (OWASP ZAP)

High Risk: 0<br />
Medium Risk: 2<br />
Low Risk: 4<br />
<br />

### E2E 테스트 (Playwright)

총 7개 테스트 시나리오 통과<br />
평균 실행 시간: 22.4초<br />

<br />
<br />


---

## 🎯 프로젝트 목표 달성
| 목표 | 목표치 | 달성 결과 | 상태 |
|------|--------|-----------|:----:|
| 가용성 | 99.9% | 99.9% 달성 | ✅ |
| 배포 빈도 | 일 3회 이상 | GitOps 자동화 | ✅ |
| 비용 최적화 | - | 월 $71.70 절감 | ✅ |
| 독립 확장성 | - | MSA 9개 서비스 | ✅ |

### 성능 지표

부하 테스트: 300 동시 사용자, 219,768 요청 성공률 100%<br />
페이지 성능: Google PageSpeed 99점, LCP 0.97초<br />
배포 시간: 평균 1분 39초<br />

<br />
<br />


---

## 📈 개선 과제

 SAGA 패턴 도입 (분산 트랜잭션 관리)<br />
 Redis 캐싱 레이어 추가<br />
 Service Mesh (Istio) 검토<br />
 Keda/Karpenter 도입 검토<br />
 메시지 큐 (SQS/Kafka) 도입<br />

<br />
<br />


 ---


