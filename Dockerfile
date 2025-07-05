# Node.js 20以降を使用（Gemini CLIの要件）
FROM node:20-alpine

# 作業ディレクトリを設定
WORKDIR /workspace

# システムパッケージのアップデート
RUN apk update && apk add --no-cache \
    git \
    bash \
    curl \
    ca-certificates \
    && rm -rf /var/cache/apk/*

# 日本語環境の設定
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# Gemini CLIをグローバルインストール（rootユーザーで実行）
RUN npm install -g @google/gemini-cli

# nodeユーザーでの実行環境を準備
USER node

# .configディレクトリの作成
RUN mkdir -p /home/node/.config

# 作業ディレクトリに戻る
WORKDIR /workspace

# デフォルトコマンドをbashに設定
CMD ["/bin/bash"]