# aizu-thesis-markdown

会津大学の学部卒論をマークダウンで書くための一式

## Requirements

- Docker

## Getting Started

1. 必要なDockerイメージをダウンロードする

```shell script
docker pull plass/mdtopdf:include-font
```
2. 必要な文章フォーマットをダウンロードする

```shell script
echo "get /usr/local/texlive/texmf-local/tex/aizu/U-AizuGT.cls" | sftp [学籍番号]@sshgate.u-aizu.ac.jp
```

3. 実行

```shell script
scripts/topdf.sh thesis.md
```

### 変更があるたびに自動でコンパイルしたい場合

```shell script
scripts/w-topdf.sh thesis.md
```

## 一つ前のcommitとの差分をpdfで出力する

```shell script
scripts/generate-diff.sh thesis.tex
```

## Github Actions を path させたい場合
1. リポジトリを private にする
1. `.gitignore` から `U-AizuGT.cls` という記述を消す
1. `U-AizuGT.cls` を add&push する

※文章フォーマットファイルの `U-AizuGT.cls` は再配布禁止になっているため、リポジトリにあげることができません。 必ず private リポジトリにしましょう。

## 注意 
Markdown の詳細などはフォーク元である [p1ass/kuee-thesis-markdown](https://github.com/p1ass/kuee-thesis-markdown) を参考にしてください。


### Error
<details>
  <summary>`! LaTeX Error: Font family `JY1+gt' unknown.` というエラーがでる</summary>
  
  ```shell script
  ! LaTeX Error: Font family `JY1+gt' unknown.

See the LaTeX manual or LaTeX Companion for explanation.
Type  H <return>  for immediate help.
 ...

l.80 }

  ```
  このエラーは和文のイタリック表示に使うものですが、バージョンが古いため怒られています。
  このエラーが出た場合は、 `U-AizuGT.cls` の `magic word` に書かれたカラムのの `JY1` を `JY2` に変更してください。
  
</details>

## 注意

## Licence

- `bibliographystyle` は [`ieicetr`](https://www.ieice.org/ftp/) を採用しました。
- [template.tex](/template.tex) は [Aizu-Graduation-Thesis-Template](https://github.com/v97ug/Aizu-Graduation-Thesis-Template) を参考にしました。

## Special Thanks
[@p1ass](https://github.com/p1ass) くん手伝ってくれてありがとう！
