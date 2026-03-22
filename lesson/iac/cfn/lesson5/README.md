# タイトル

## 概要

- どういうサイトか
- 何ができるのか
- アピールポイント
を記載する。

## 公開リンク

- https://XXXXXX

## ディレクトリ構成

```
ルートディレクトリ/
    ├─ .docs/   # その他ドキュメント群
    ├─ app/   # アプリケーションのソースコード
    ├─ bin/   # 実行用スクリプト・補助ツール
    └─ cfn/   # CloudFormationテンプレート
```

## アーキテクチャ

- [アーキテクチャ図](.docs/architecture.drawio.png) 

## 使用技術

- Javascript
  - TypeScript
  - Nextjs
  - Aws Sdk
- AWS
    - ECS(or Lambda)
    - RDS（or DynamoDB）
    - VPC
    - ALB
    - ACM
    - Route53
    - Lambda
    - EventBridge Scheduler
- Docker/docker-compose
- Github Actions
- Shellscript
- MySQL 5.7


## CloudFormation デプロイ手順

### 前提
- AWS CLIの認証情報が設定済み（`aws configure`）
- WSL (Ubuntu) 環境
- ※ドメインの取得・ホストゾーンの登録はRoute53で事前手動登録する。

### 利用方法
```bash
sh bin/deploy.sh -e <dev|stg|prd>
```

### 利用例
```bash
sh bin/deploy.sh -e dev
```

- 成功とログに表示されれば、完了