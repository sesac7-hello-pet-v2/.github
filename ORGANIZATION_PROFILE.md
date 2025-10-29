# 🐾 Hello Pet v2 - Organization Profile Template

조직의 `.github` 레포지토리 README.md에 추가할 수 있는 템플릿입니다.

## E2E 테스트 현황

### 📊 실시간 테스트 결과
[![E2E Tests](https://github.com/sesac7-hello-pet-v2/hello-pet-v2/actions/workflows/e2e-test.yml/badge.svg)](https://github.com/sesac7-hello-pet-v2/hello-pet-v2/actions/workflows/e2e-test.yml)

**🔗 [E2E 테스트 리포트 보기](https://sesac7-hello-pet-v2.github.io/hello-pet-v2/)**

### 테스트 커버리지
- ✅ 기본 네비게이션 테스트 (Phase 1)
- 🔄 사용자 인증 테스트 (Phase 2 - 예정)
- 🔄 피드 기능 테스트 (Phase 3 - 예정)
- 🔄 댓글 시스템 테스트 (Phase 4 - 예정)
- 🔄 관리자 기능 테스트 (Phase 5 - 예정)

### 테스트 환경
- **프레임워크**: Playwright
- **브라우저**: Chromium (헤드리스)
- **실행 주기**: main 브랜치 push 시 자동
- **배포**: GitHub Pages 자동 배포

---

## 📋 사용법

1. **조직의 `.github` 레포지토리 생성** (없는 경우)
2. **README.md에 위 내용 추가**
3. **{ORG_NAME}을 실제 조직명으로 변경**

## 🎯 추가 배지 옵션

### 테스트 상태 배지
```markdown
![E2E Tests](https://github.com/sesac7-hello-pet-v2/hello-pet-v2/actions/workflows/e2e-test.yml/badge.svg)
```

### 배포 상태 배지
```markdown
![GitHub Pages](https://github.com/sesac7-hello-pet-v2/hello-pet-v2/deployments/activity_log?environment=github-pages)
```

### 커스텀 배지 (shields.io)
```markdown
![Test Coverage](https://img.shields.io/badge/E2E%20Tests-Automated-brightgreen)
![Status](https://img.shields.io/badge/Status-Active-blue)
```