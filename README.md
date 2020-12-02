# kuee-thesis-markdown

京大工学部電気電子工学科の卒論をマークダウンで書くための一式

## Requirements

- Docker

## Getting Started

1. 必要なDockerイメージをダウンロードする

```shell script
docker pull plass/mdtopdf:latest
```

2. 実行

```shell script
scripts/topdf.sh thesis.md
```

### 変更があるたびに自動でコンパイルしたい場合

```shell script
scripts/w-topdf.sh thesis.md
```


## Licence


[特別研究報告書の手引き](https://www.s-ee.t.kyoto-u.ac.jp/ja/student/thesis_format) からダウンロードできる卒論TexスタイルファイルH30を利用しています。
