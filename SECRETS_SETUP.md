# 🔐 GitHub Secrets 설정 가이드

조직 레포지토리에서 E2E 테스트 자동화를 위한 Secrets 설정 방법입니다.

## 🏢 조직 레벨 설정

### 1. 조직 Settings 접근
- GitHub 조직 → Settings → Secrets and variables → Actions

### 2. 필요한 Secrets

#### 🔑 ORG_PROFILE_TOKEN (선택사항)
조직 프로필 자동 업데이트용 (조직 .github 레포가 있는 경우)

**생성 방법:**
1. GitHub → Settings → Developer settings → Personal access tokens → Fine-grained tokens
2. "Generate new token" 클릭
3. **권한 설정:**
   - Repository access: Selected repositories → 조직의 `.github` 레포 선택
   - Repository permissions:
     - Contents: Write
     - Metadata: Read
     - Pull requests: Write

**설정 위치:**
- 조직 Settings → Secrets and variables → Actions → New organization secret
- Name: `ORG_PROFILE_TOKEN`
- Value: 생성한 토큰

## 📍 레포지토리 레벨 설정

### 1. 레포지토리 Settings 접근
- hello-pet-v2 레포 → Settings → Secrets and variables → Actions

### 2. 기본적으로 필요 없는 Secrets
현재 워크플로우는 **기본 GITHUB_TOKEN만 사용**하므로 추가 Secrets 불필요

### 3. 선택적 Secrets

#### 🔔 SLACK_WEBHOOK (선택사항)
테스트 실패 시 Slack 알림용

**설정 방법:**
1. Slack 워크스페이스 → Apps → Incoming Webhooks 추가
2. 채널 선택 후 Webhook URL 복사
3. 레포 Settings → Secrets → New repository secret
   - Name: `SLACK_WEBHOOK`
   - Value: Webhook URL

#### 📧 DISCORD_WEBHOOK (선택사항)
테스트 실패 시 Discord 알림용

## 🎯 권한 설정 체크리스트

### GitHub Pages 권한
- [x] Repository → Settings → Pages → Source: "GitHub Actions"
- [x] Repository → Settings → Actions → General → Workflow permissions: "Read and write permissions"

### Actions 권한
- [x] 조직 Settings → Actions → General → "Allow all actions and reusable workflows"
- [x] 또는 "Allow select actions and reusable workflows" + 필요한 액션 허용

## 🚀 워크플로우 수정 가이드

### 조직명 변경
다음 파일들에서 `{ORG_NAME}`을 실제 조직명으로 변경:

#### 1. `.github/workflows/update-org-profile.yml`
```yaml
if: github.repository == 'sesac7-hello-pet-v2/hello-pet-v2'
repository: 'sesac7-hello-pet-v2/.github'
```

#### 2. `.github/ORGANIZATION_PROFILE.md`
```markdown
[![E2E Tests](https://github.com/sesac7-hello-pet-v2/hello-pet-v2/actions/workflows/e2e-test.yml/badge.svg)]
[E2E 테스트 리포트 보기](https://sesac7-hello-pet-v2.github.io/hello-pet-v2/)
```

## 🔧 트러블슈팅

### 일반적인 문제들

#### 1. "Resource not accessible by integration" 오류
**해결책:**
- Repository Settings → Actions → General → Workflow permissions 확인
- "Read and write permissions" 선택

#### 2. GitHub Pages 배포 실패
**해결책:**
- Repository Settings → Pages → Source가 "GitHub Actions"인지 확인
- 조직에서 Pages가 활성화되어 있는지 확인

#### 3. 조직 프로필 업데이트 실패
**해결책:**
- `ORG_PROFILE_TOKEN` 권한 확인
- 조직의 `.github` 레포지토리 존재 여부 확인

#### 4. 토큰 권한 오류
**해결책:**
- Fine-grained token 대신 Classic token 사용
- 조직 승인이 필요한 경우 조직 관리자에게 요청

## 📋 최소 설정으로 시작

**기본 E2E 테스트만 원하는 경우:**
1. Repository Settings → Pages → Source: "GitHub Actions"
2. Repository Settings → Actions → Workflow permissions: "Read and write"

**조직 프로필 연동까지 원하는 경우:**
1. 위 기본 설정 +
2. 조직 `.github` 레포지토리 생성
3. `ORG_PROFILE_TOKEN` 생성 및 설정
4. 워크플로우 파일에서 조직명 변경

이렇게 하면 조직 overview에서 E2E 테스트 상태를 실시간으로 확인할 수 있습니다! 🎉