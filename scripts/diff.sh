#! /bin/bash

filename=$1
filename_without_ext=${filename%.*}

# スクリプト終了時に呼び出される関数
function on_exit() {
  local exit_code=$1
  find | grep -E "${filename_without_ext}.(aux|bbl|blg|dvi|fdb_latexmk|fff|fls|out|synctex.gz|toc)" | xargs rm -f
  exit $exit_code
}
 
## ハンドラー関数を登録する
trap 'on_exit $?' EXIT

latexdiff-vc -e utf8 --git --flatten --force -d diff -r HEAD~1 ${filename_without_ext}.tex
latexmk -output-directory=diff ${filename_without_ext}.tex
