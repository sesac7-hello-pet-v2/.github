#!/bin/bash

# Hello Pet v2 CI/CD 설정 자동화 스크립트
# 사용법: ./setup-ci.sh <서비스명> <ECR_리포지토리명> <포트번호>
# 예시: ./setup-ci.sh board-service sesac-hello-pet-ecr-board-service 8083

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 도움말 함수
show_help() {
    echo -e "${BLUE}🚀 Hello Pet v2 CI/CD 설정 스크립트${NC}"
    echo ""
    echo "사용법: $0 <서비스명> <ECR_리포지토리명> <포트번호>"
    echo ""
    echo "예시:"
    echo "  $0 board-service sesac-hello-pet-ecr-board-service 8083"
    echo "  $0 image-service sesac-hello-pet-ecr-image-service 8084"
    echo "  $0 auth-service sesac-hello-pet-ecr-auth-service 8085"
    echo ""
    echo "인자:"
    echo "  서비스명            - 서비스 이름 (예: board-service)"
    echo "  ECR_리포지토리명    - ECR 리포지토리 전체 이름"
    echo "  포트번호           - 서비스 포트 번호"
    echo ""
}

# 인자 확인
if [ $# -ne 3 ]; then
    echo -e "${RED}❌ 잘못된 인자 개수입니다.${NC}"
    show_help
    exit 1
fi

SERVICE_NAME="$1"
ECR_REPOSITORY="$2"
SERVICE_PORT="$3"

# 현재 스크립트 위치 확인
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_FILE="$SCRIPT_DIR/spring-boot-ecr-deploy.yml"

echo -e "${BLUE}🔧 CI/CD 설정을 시작합니다...${NC}"
echo -e "서비스명: ${GREEN}$SERVICE_NAME${NC}"
echo -e "ECR 리포지토리: ${GREEN}$ECR_REPOSITORY${NC}"
echo -e "포트번호: ${GREEN}$SERVICE_PORT${NC}"
echo ""

# 서비스 디렉토리 확인
if [ ! -d "$SERVICE_NAME" ]; then
    echo -e "${RED}❌ '$SERVICE_NAME' 디렉토리를 찾을 수 없습니다.${NC}"
    echo "현재 위치에서 실행하거나 올바른 서비스명을 입력하세요."
    exit 1
fi

# 템플릿 파일 확인
if [ ! -f "$TEMPLATE_FILE" ]; then
    echo -e "${RED}❌ 템플릿 파일을 찾을 수 없습니다: $TEMPLATE_FILE${NC}"
    exit 1
fi

# .github/workflows 디렉토리 생성
WORKFLOWS_DIR="$SERVICE_NAME/.github/workflows"
mkdir -p "$WORKFLOWS_DIR"

# 템플릿 복사 및 수정
OUTPUT_FILE="$WORKFLOWS_DIR/deploy.yml"

echo -e "${YELLOW}📝 워크플로우 파일 생성 중...${NC}"

# 템플릿을 복사하고 플레이스홀더 교체
sed -e "s/{SERVICE_NAME}/$SERVICE_NAME/g" \
    -e "s/{ECR_REPOSITORY}/$ECR_REPOSITORY/g" \
    -e "s/{PORT}/$SERVICE_PORT/g" \
    "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo -e "${GREEN}✅ 워크플로우 파일이 생성되었습니다: $OUTPUT_FILE${NC}"

# GitHub Secrets 안내
echo ""
echo -e "${YELLOW}🔐 GitHub Secrets 설정 안내${NC}"
echo "다음 단계에서 GitHub 리포지토리에 Secrets를 설정하세요:"
echo ""
echo "1. GitHub에서 $SERVICE_NAME 리포지토리로 이동"
echo "2. Settings > Secrets and variables > Actions 메뉴 선택"
echo "3. 다음 Secrets 추가:"
echo ""
echo -e "   ${BLUE}AWS_ACCESS_KEY_ID${NC}        - AWS IAM 사용자의 Access Key ID"
echo -e "   ${BLUE}AWS_SECRET_ACCESS_KEY${NC}    - AWS IAM 사용자의 Secret Access Key"
echo -e "   ${BLUE}AWS_ACCOUNT_ID${NC}           - AWS 계정 ID (12자리 숫자)"
echo ""

# 다음 단계 안내
echo -e "${YELLOW}📋 다음 단계${NC}"
echo "1. 변경사항 커밋 및 푸시:"
echo "   cd $SERVICE_NAME"
echo "   git add .github/workflows/deploy.yml"
echo "   git commit -m \"🚀 Add CI/CD workflow for $SERVICE_NAME\""
echo "   git push origin develop"
echo ""
echo "2. develop 브랜치 푸시 시 자동으로 ECR에 이미지가 업로드됩니다."
echo "3. EKS 배포 시 다음 이미지를 사용하세요:"
echo "   - 개발환경: $ECR_REPOSITORY:dev-develop"
echo "   - 운영환경: $ECR_REPOSITORY:v{YYYYMMDD}-{SHA}"
echo ""

echo -e "${GREEN}🎉 CI/CD 설정이 완료되었습니다!${NC}"