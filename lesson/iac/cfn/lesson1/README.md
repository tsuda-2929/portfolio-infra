# ポートフォリオのサンプル1です

## 概要

- どういうサイトか
  - 自己紹介サイト
  - 診断アプリ
  - ノベルゲーム
  - テトリス
- 何ができるのか
  - 自己学習の成果物を一覧できる
- アピールポイント
  - 静的コンテンツの配信するインフラ構築可能
  - IaCも対応可能

## 公開リンク

- 自己紹介サイト
  - https://XXXXXX
- 診断アプリ
  - https://XXXXXX
- ノベルゲーム
  - https://XXXXXX
- テトリス
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

![アーキテクチャ図](.docs/architecture.svg) 

## 使用技術

- html/css
- javascript
- AWS
    - S3
    - Cloudfront
    - ACM
    - Route53
- Github Actions
- Shellscript


## CloudFormation デプロイ手順

### 前提
- AWS CLIの認証情報が設定済み（`aws configure`）
- WSL (Ubuntu) 環境
- ※ドメインの取得・ホストゾーンの登録はRoute53で事前手動登録する。

### 利用方法
```bash
sh bin/deploy.sh -e <dev|stg|prd> -domain <domain_name>
```

### 利用例
```bash
sh bin/deploy.sh -e dev test.com
```

- 成功とログに表示されれば、完了
