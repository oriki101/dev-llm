# dev-llm

このリポジトリは、LLM（大規模言語モデル）のチューニングに使用するDockerイメージを作成する目的で作られました。環境構築の難しさに直面している方々が、LLMのチューニングを容易に始められるようにすることを目指しています。

## 1. 準備

LLMの環境を構築するためには、まずDockerが必要です。Dockerのセットアップ方法については、[NVIDIA Dockerの現状について](https://medium.com/nvidiajapan/nvidia-docker-%E3%81%A3%E3%81%A6%E4%BB%8A%E3%81%A9%E3%81%86%E3%81%AA%E3%81%A3%E3%81%A6%E3%82%8B%E3%81%AE-20-09-%E7%89%88-558fae883f44)を参照してください。

## 2. イメージのビルド

Docker環境を準備したら、次にLLM用のDockerイメージをビルドします。以下の手順に従ってください。

```bash
git clone https://github.com/oriki101/dev-llm.git # このリポジトリをクローン
cd dev-llm/docker
./build.sh # イメージをビルド
```

実行権限がない場合は、`chmod` コマンドを使用して適切な権限を付与してください。このプロセスには時間がかかる可能性があります。

## 3. Dockerイメージの使用

Dockerイメージからコンテナを立てるには、以下のコマンドを実行します。

```bash
docker compose up
```

### JupyterLabへのアクセス

上記のコマンドを実行するとJupyterLabが起動します。ローカルPCで実行している場合は、ブラウザで `localhost:8888` にアクセスしてください。リモートPCで環境を起動している場合は、そのPCのIPアドレスに続いて `:8888` をブラウザに入力してアクセスしてください。
