#!/bin/bash

set -e

# -----------------------------
# ヘルプ表示
# -----------------------------
usage() {
  echo "Usage: $0 -e <dev|stg|prd> -domain <domain_name>"
  exit 1
}

# -----------------------------
# 引数解析
# -----------------------------
while [[ $# -gt 0 ]]; do
  case $1 in
    -e|--env)
      ENV="$2"
      shift 2
      ;;
    -domain)
      DOMAIN="$2"
      shift 2
      ;;
    *)
      usage
      ;;
  esac
done

# -----------------------------
# 引数チェック
# -----------------------------
if [[ -z "$ENV" ]] || [[ -z "$DOMAIN" ]]; then
  usage
fi

STACK_NAME="website-${ENV}-${DOMAIN//./-}"  # ドットをハイフンに置換
TEMPLATE_FILE="template.yaml"               # CloudFormation テンプレート名

# -----------------------------
# デプロイ実行
# -----------------------------
echo "Deploying stack: $STACK_NAME"
echo "Environment: $ENV"
echo "Domain: $DOMAIN"

aws cloudformation deploy \
  --stack-name "$STACK_NAME" \
  --template-file "$TEMPLATE_FILE" \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides Env="$ENV" DomainName="$DOMAIN"

echo "Deployment finished successfully."