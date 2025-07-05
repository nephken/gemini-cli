# Gemini CLI Docker セットアップガイド

このプロジェクトは、Gemini CLIをDockerコンテナで簡単に使用できるようにするものです。

## 前提条件

- Docker
- Docker Compose
- （オプション）Gemini APIキー

**注意**: Gemini CLIはNode.js 20以降が必要です。このDockerfileではNode.js 20を使用します。

## ディレクトリ構成

```
gemini-cli-docker/
├── compose.yaml
├── Dockerfile
├── README.md
├── .env.example
├── workspace/        # 作業ディレクトリ（プロジェクトファイル）
└── config/          # Gemini CLIの設定ファイル
```

## セットアップ手順

### 1. プロジェクトの準備

```bash
# プロジェクトディレクトリの作成
mkdir gemini-cli-docker
cd gemini-cli-docker

# 必要なディレクトリを作成
mkdir workspace config
```

### 2. 環境変数の設定（オプション）

APIキーを使用する場合は、`.env`ファイルを作成してAPIキーを設定してください。

```bash
# .envファイルの作成
echo "GEMINI_API_KEY=your_api_key_here" > .env
```

### 3. コンテナの起動

```bash
# コンテナをビルドして起動
docker-compose up -d --build

# コンテナに接続
docker-compose exec gemini-cli bash
```

### 4. Gemini CLIの使用

コンテナ内で以下のコマンドを実行してGemini CLIを開始します：

```bash
# Gemini CLIの起動
gemini

# または直接実行（インストール不要の場合）
npx https://github.com/google-gemini/gemini-cli
```

## 使用方法

### 基本的な使用方法

1. **テーマの選択**: 初回起動時に好みのテーマを選択
2. **サインイン**: GoogleアカウントでログインまたはAPIキーを使用
3. **プロンプト入力**: 質問や指示を入力

### ファイルの参照

```bash
# ファイルを参照するには@を使用
@
# （ファイル選択ダイアログが表示されます）
```

### 利用可能なコマンド

```bash
# ヘルプとコマンドリストを表示
/
```

## 例: 使用例

### コード生成
```
五目並べを遊べるプログラムをHTMLで作成してください
```

### コード解析
```
このコードの概要を説明して
```

### デバッグ支援
```
このエラーの原因は何？
```

## トラブルシューティング

### 権限エラーが発生する場合

```bash
# nodeユーザーでコンテナを起動
docker-compose exec --user node gemini-cli bash
```

### 設定のリセット

```bash
# 設定ディレクトリをクリア
rm -rf config/*
```

### コンテナの再起動

```bash
# コンテナを停止して再起動
docker-compose down
docker-compose up -d --build
```

## 注意事項

- 初回起動時にはブラウザ認証が必要な場合があります
- 無料版では1分あたり60リクエスト、1日あたり1,000リクエストの制限があります
- 接続が不安定な場合、自動的にgemini-2.5-flashモデルにフォールバックします

## 関連リンク

- [Gemini CLI GitHub](https://github.com/google-gemini/gemini-cli)
- [Google AI Studio](https://aistudio.google.com/apikey)
- [Gemini API Documentation](https://docs.google.com/)