# Hello Pet v2 CI/CD 설정 자동화 스크립트 (PowerShell)
# 사용법: .\setup-ci.ps1 -ServiceName "board-service" -EcrRepository "sesac-hello-pet-ecr-board-service" -Port 8083

param(
    [Parameter(Mandatory=$true)]
    [string]$ServiceName,

    [Parameter(Mandatory=$true)]
    [string]$EcrRepository,

    [Parameter(Mandatory=$true)]
    [int]$Port
)

# 색상 정의
function Write-ColorText {
    param(
        [string]$Text,
        [string]$Color = "White"
    )
    Write-Host $Text -ForegroundColor $Color
}

# 도움말 함수
function Show-Help {
    Write-ColorText "🚀 Hello Pet v2 CI/CD 설정 스크립트" "Blue"
    Write-Host ""
    Write-Host "사용법: .\setup-ci.ps1 -ServiceName <서비스명> -EcrRepository <ECR_리포지토리명> -Port <포트번호>"
    Write-Host ""
    Write-Host "예시:"
    Write-Host "  .\setup-ci.ps1 -ServiceName 'board-service' -EcrRepository 'sesac-hello-pet-ecr-board-service' -Port 8083"
    Write-Host "  .\setup-ci.ps1 -ServiceName 'image-service' -EcrRepository 'sesac-hello-pet-ecr-image-service' -Port 8084"
    Write-Host ""
}

try {
    Write-ColorText "🔧 CI/CD 설정을 시작합니다..." "Blue"
    Write-Host "서비스명: " -NoNewline; Write-ColorText $ServiceName "Green"
    Write-Host "ECR 리포지토리: " -NoNewline; Write-ColorText $EcrRepository "Green"
    Write-Host "포트번호: " -NoNewline; Write-ColorText $Port "Green"
    Write-Host ""

    # 현재 스크립트 위치
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
    $TemplateFile = Join-Path $ScriptDir "spring-boot-ecr-deploy.yml"

    # 서비스 디렉토리 확인
    if (-not (Test-Path $ServiceName)) {
        Write-ColorText "❌ '$ServiceName' 디렉토리를 찾을 수 없습니다." "Red"
        Write-Host "현재 위치에서 실행하거나 올바른 서비스명을 입력하세요."
        exit 1
    }

    # 템플릿 파일 확인
    if (-not (Test-Path $TemplateFile)) {
        Write-ColorText "❌ 템플릿 파일을 찾을 수 없습니다: $TemplateFile" "Red"
        exit 1
    }

    # .github/workflows 디렉토리 생성
    $WorkflowsDir = Join-Path $ServiceName ".github\workflows"
    if (-not (Test-Path $WorkflowsDir)) {
        New-Item -ItemType Directory -Path $WorkflowsDir -Force | Out-Null
    }

    # 템플릿 복사 및 수정
    $OutputFile = Join-Path $WorkflowsDir "deploy.yml"

    Write-ColorText "📝 워크플로우 파일 생성 중..." "Yellow"

    # 템플릿 읽기 및 플레이스홀더 교체
    $Content = Get-Content $TemplateFile -Raw
    $Content = $Content -replace '\{SERVICE_NAME\}', $ServiceName
    $Content = $Content -replace '\{ECR_REPOSITORY\}', $EcrRepository
    $Content = $Content -replace '\{PORT\}', $Port

    # 파일 저장
    $Content | Out-File -FilePath $OutputFile -Encoding UTF8

    Write-ColorText "✅ 워크플로우 파일이 생성되었습니다: $OutputFile" "Green"

    # GitHub Secrets 안내
    Write-Host ""
    Write-ColorText "🔐 GitHub Secrets 설정 안내" "Yellow"
    Write-Host "다음 단계에서 GitHub 리포지토리에 Secrets를 설정하세요:"
    Write-Host ""
    Write-Host "1. GitHub에서 $ServiceName 리포지토리로 이동"
    Write-Host "2. Settings > Secrets and variables > Actions 메뉴 선택"
    Write-Host "3. 다음 Secrets 추가:"
    Write-Host ""
    Write-Host "   " -NoNewline; Write-ColorText "AWS_ACCESS_KEY_ID" "Blue" -NoNewline; Write-Host "        - AWS IAM 사용자의 Access Key ID"
    Write-Host "   " -NoNewline; Write-ColorText "AWS_SECRET_ACCESS_KEY" "Blue" -NoNewline; Write-Host "    - AWS IAM 사용자의 Secret Access Key"
    Write-Host "   " -NoNewline; Write-ColorText "AWS_ACCOUNT_ID" "Blue" -NoNewline; Write-Host "           - AWS 계정 ID (12자리 숫자)"
    Write-Host ""

    # 다음 단계 안내
    Write-ColorText "📋 다음 단계" "Yellow"
    Write-Host "1. 변경사항 커밋 및 푸시:"
    Write-Host "   cd $ServiceName"
    Write-Host "   git add .github/workflows/deploy.yml"
    Write-Host "   git commit -m '🚀 Add CI/CD workflow for $ServiceName'"
    Write-Host "   git push origin develop"
    Write-Host ""
    Write-Host "2. develop 브랜치 푸시 시 자동으로 ECR에 이미지가 업로드됩니다."
    Write-Host "3. EKS 배포 시 다음 이미지를 사용하세요:"
    Write-Host "   - 개발환경: $EcrRepository`:dev-develop"
    Write-Host "   - 운영환경: $EcrRepository`:v{YYYYMMDD}-{SHA}"
    Write-Host ""

    Write-ColorText "🎉 CI/CD 설정이 완료되었습니다!" "Green"

} catch {
    Write-ColorText "❌ 오류가 발생했습니다: $($_.Exception.Message)" "Red"
    exit 1
}