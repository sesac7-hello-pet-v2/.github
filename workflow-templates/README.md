# 🚀 CI/CD 워크플로우 템플릿 가이드

이 폴더에는 Hello Pet v2 프로젝트의 마이크로서비스들을 위한 GitHub Actions 워크플로우 템플릿이 있습니다.

## 📋 사용 방법

### 1. Spring Boot 서비스 CI/CD 설정

**board_service**, **image-service** 등의 Spring Boot 서비스에 CI/CD를 설정하려면:

1. **템플릿 복사**
   ```bash
   cp .github/workflow-templates/spring-boot-ecr-deploy.yml {서비스명}/.github/workflows/deploy.yml
   ```

2. **템플릿 수정**
   파일에서 다음 부분을 서비스에 맞게 수정:
   ```yaml
   ECR_REPOSITORY: sesac-hello-pet-ecr-{서비스명}  # 예: sesac-hello-pet-ecr-board-service
   SERVICE_NAME: {서비스명}                        # 예: board-service
   SERVICE_PORT: {포트번호}                        # 예: 8083
   ```

3. **GitHub Secrets 설정**
   각 서비스 repository의 Settings > Secrets and variables > Actions에서 다음을 추가:
   - `AWS_ACCESS_KEY_ID`: AWS IAM 사용자의 Access Key ID
   - `AWS_SECRET_ACCESS_KEY`: AWS IAM 사용자의 Secret Access Key
   - `AWS_ACCOUNT_ID`: AWS 계정 ID (12자리 숫자)

### 2. 예시: board_service 설정

```yaml
env:
  ECR_REPOSITORY: sesac-hello-pet-ecr-board-service
  SERVICE_NAME: board-service
  SERVICE_PORT: 8083
```

### 3. 예시: image-service 설정

```yaml
env:
  ECR_REPOSITORY: sesac-hello-pet-ecr-image-service
  SERVICE_NAME: image-service
  SERVICE_PORT: 8084
```

## 🏷️ 태그 전략

### 개발환경 (develop 브랜치)
- **태그**: `dev-develop`
- **용도**: 개발환경 EKS 배포
- **트리거**: develop 브랜치 push

### 운영환경 (release 브랜치)
- **태그**: `v{YYYYMMDD}-{SHA}`
- **예시**: `v20241017-a1b2c3d4e5f6...`
- **용도**: 운영환경 EKS 배포
- **트리거**: release 브랜치 push

### 개인 개발 (dev/* 브랜치)
- **태그**: `dev-{브랜치명}`
- **예시**: `dev-feature-login`, `dev-john`
- **용도**: 개인 테스트 환경

### QA 환경 (qa/* 브랜치)
- **태그**: `qa-{브랜치명}`
- **예시**: `qa-sprint-1`, `qa-integration`
- **용도**: QA 테스트 환경

## 🐳 EKS 배포용 이미지

### 개발환경 배포
```yaml
containers:
- name: board-service
  image: {AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/sesac-hello-pet-ecr-board-service:dev-develop
```

### 운영환경 배포
```yaml
containers:
- name: board-service
  image: {AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/sesac-hello-pet-ecr-board-service:v20241017-{SHA}
```

## ⚙️ Terraform ECR 정책 호환성

이 템플릿은 프로젝트의 Terraform ECR 설정과 호환됩니다:
- **ECR Repository 이름**: `sesac-hello-pet-ecr-{서비스명}` 형식
- **Tag Immutability**: `IMMUTABLE_WITH_EXCLUSION` 정책 준수
- **덮어쓰기 가능한 태그**: `latest*`, `dev-*`, `qa-*` 패턴

## 🔧 문제 해결

### AWS 권한 오류
IAM 사용자에게 다음 권한이 필요합니다:
- `AmazonEC2ContainerRegistryFullAccess`
- 또는 최소 권한: ECR 레포지토리 생성, 이미지 푸시

### Docker 빌드 실패
- JAR 파일 복사 오류: Dockerfile에서 plain JAR 파일 제외 확인
- Java 버전: JDK 17 사용 확인

### 브랜치 전략
- **develop**: 개발환경 자동 배포
- **release**: 운영환경 배포 (수동 승인 권장)
- **PR**: 빌드 검증만, 배포용 태그 생성 안함

## 📚 추가 정보

- [GitHub Actions 공식 문서](https://docs.github.com/en/actions)
- [AWS ECR 가이드](https://docs.aws.amazon.com/ecr/)
- [Terraform ECR 설정](../aws-terraform/ecr.tf)