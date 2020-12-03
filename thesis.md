---
header-includes:
    - \title{LaTeX を用いた修論$\cdot$卒論の執筆}
    - \etitle{Usage of The LaTeX Style File for KUEE}
    - \author{岸 直輝}
    - \eauthor{Jiro Denki}
    - \professor{電気 太郎 教授}
    # - \course{京都大学大学院情報学研究科}
    # - \department{知能情報学専攻}
    - \date{令和2年4月14日}
include-before:
    - \begin{eabstract}This document briefly explains the usage of the\end{eabstract}
    - \def\lstlistingname{ソースコード}
documentclass: kuee
classoption: sotsuron
bibliography:
    - thesis.bib
---

#  はじめに
\label{chap:intro}


この文書は，京都大学電気電子工学科の修論 $\cdot$ 卒論作成用 \LaTeX
クラスファイルの利用方法についての説明書です．

修論$\cdot$卒論の正確なフォーマットの指定は，事務室から配布される手引
を参照してください．

これはdiffのexampleのための文章です。
`scripts/generate-diff.sh thesis.tex` を実行することで、diffが視覚的に分かるpdfを作成できます。

\cite{GuideBook}

adfa [@GuideBook, pp]


# 修論$\cdot$卒論クラスファイルの利用方法

## インストール

配布キットには，表 \ref{tab:kit} のファイルが含まれています．
\begin{table}
  \caption{配布キットのファイル一覧}\label{tab:kit}
  \begin{center}
    \begin{tabular}{ll}
      \verb+kuee.cls+ & 修論$\cdot$卒論用 \LaTeX2e{} クラスファイル       \\
      \verb+kueethesis.bst+ & 修論$\cdot$卒論用 文献スタイルファイル \\
      \verb+sample.tex+ & 使用の手引(このドキュメント)を作るファイル        \\
      \verb+sample.bib+ & 使用の手引の参考文献を収めたファイル              \\
    \end{tabular}
  \end{center}
\end{table}

このクラスファイルを使用するため， kuee.cls と kueethesis.bst を，環境変数 TEXINPUTS で指定されたディレ
クトリ，または修論$\cdot$卒論の原稿と同じディレクトリにコピーして下さい．

配布キットの文字コードは Unicode になっています．利用環境に応じて，適
切に文字コードを変換してください．

## ドキュメントスタイル

ドキュメントスタイルは，オプションとして指定します．修論の場合は
shuuron，卒論の場合は sotsuron を用います．例えば，卒論の場合は次のように指定して下さい．
\begin{quote}
  \begin{verbatim}
\documentclass[sotsuron]{kuee}
\end{verbatim}
\end{quote}
指定を省略すると，修論用のスタイルが選択されます．


## 文字数，行数の設定

1行の文字数と1ページの行数を指定する場合は，\verb+\begin{document}+ よ
り先に次のように指定します．これは，デフォルトと同じ1行36文字，1ページ
32行の設定例です．
\begin{quote}
  \begin{verbatim}
\charsinline{36}
\linesinpage{32}
\end{verbatim}
\end{quote}
ただし，\TeX のページ分割のためにすべてのページが必ずしも設定通りの行
数にはなりません．ASCII \TeX では句読点のカーニングの伸縮のため，すべ
ての行が必ずしも設定通りの文字数にはなりません．なお，1行の文字数はNTT
\TeX では最大38文字，ASCII \TeX では最大37文字で，これを越えると隣合
う文字同士が重なってしまいます．

## 表紙

表紙は \verb+\maketitle+ コマンドによって出力されます\footnote{表紙ペー
  ジのページ番号は0ですが，出力されません．}．

表紙を出力するコマンド \verb+\maketitle+ よりも先に，タイトル(日本語お
よび英語)，著者氏名(日本語および英語)などを次のように指定する必要があ
ります．
\begin{quote}
  \begin{verbatim}
\title{\LaTeX を用いた修論$\cdot$卒論の執筆}
\etitle{Usage of The \LaTeX{} Style File for KUEE}
\author{電気 次郎}
\eauthor{Jiro Denki}
\professor{電気 太郎 教授}
\date{平成13年12月18日}
\end{verbatim}
\end{quote}
なお，英語タイトルおよび英語著者氏名は，表紙ではなく，英文要旨を出力す
る時に用いられます．

上記の例のように，研究科(学部)と専攻(学科)の指定を省略すると，修論作成
時には，工学研究科 電気工学専攻が指定されたと見なされます．卒論作成時に
は，工学部 電気電子工学科が指定されたと見なされます．

研究科(学部)を指定する場合は \verb+\course+ コマンドを，専攻(学科)を指
定する場合は \verb+\department+ コマンドを，以下のように使用してくださ
い．
\begin{quote}
  \begin{verbatim}
\course{京都大学大学院情報学研究科}
\department{知能情報学専攻}
\end{verbatim}
\end{quote}


## 英文要旨
英文要旨は，\verb+eabstract+ 環境を用いて記述します．


## 目次
目次は \verb+\tableofcontents+ コマンドによって出力されます\footnote
{目次ページのページ番号は，ローマ数字で出力されます．}．謝辞，参考文献，
付録なども目次に掲載されます．


## 本文
本文は通常の\LaTeX のテキストとして記述します\footnote{本文ページのペー
  ジ番号は1から始まり，アラビア数字で出力されます．}．
いくつかの点でj-report/jreport/reportスタイルとの違いがあります．

## 章題
章題は次のように出力されます．
<!-- % (英文用では章番号の部分が{\LARGE\bfseries Chapter~3}のようになります)． -->

<!-- \chapterhead{3}{修論・卒論クラスにおける章題} -->

章題が1行に収まり切らない場合には次のように改行されて出力されます．

<!-- \chapterhead{3}{修論・卒論クラスにおける1行に収まり切らないような長い章題} -->

### 脚注

脚注は章ごとにカウントされ，マークは$^{*}$, $^{**}$, $^{***}$,
$^{\dagger}$, $^{\dagger\dagger}$, $^{\dagger\dagger\dagger}$,
$^{\ddagger}$, \ldots のようになります．

### 図表

通常の \LaTeX を利用する場合と同様，本文中の適当な場所に記述して下さい．
全ての図表は，\TeX によって自動的に論文の末尾に移動されます．例えば，
図 \ref{fig:example} は，この段落の直後で定義されていますが，実際の整
形結果では論文末尾に移動しているはずです．

\begin{figure}
  \begin{center}
    \unitlength=1mm
    \begin{picture}(100,100)(-50,-50)
      \put(0,-50){\vector(0,1){100}}
      \put(-50,0){\vector(1,0){100}}
      \put(0,0){\makebox(0,0)[rt]{$o$}}
      \put(50,0){\makebox(0,0)[lt]{$x$}}
      \put(0,50){\makebox(0,0)[rb]{$y$}}
      \put(0,0){\vector(2,1){30}}
      \put(30,15){\makebox(0,0)[lt]{$\vec{a}$}}
      \put(0,0){\vector(1,2){15}}
      \put(15,30){\makebox(0,0)[lt]{$\vec{b}$}}
      \thicklines
      \put(0,0){\vector(1,1){45}}
      \put(45,45){\makebox(0,0)[lt]{$\vec{a}+\vec{b}$}}
    \end{picture}
  \end{center}
  \caption{figure 環境の例}
  \label{fig:example}
 \end{figure} <!--% この図は最後に出力される -->

大量の図表を張り付けると，以下のようなエラーが発生することがあります．
\begin{quote}
  \begin{verbatim}
! LaTeX Error: Too many unprocessed floats.
\end{verbatim}
\end{quote}
\LaTeX が図表を組み版する時は，前後の文章の量を見ながらオプションで指
定された条件に合う場所が出てくるまでメモリーに図表を保存しています。上
記エラーは，図表が数ページにわたって連続して現われ，メモリーが不足する
と発生します．このエラーが発生した時は，適当な位置に
\verb+\clearfigurepage+ コマンドを挿入してください．このコマンドは，図
表ページを指定された個所で強制的に分割し，組版処理を行うように指示しま
す．

<!-- % なお，この図表の定義場所に関する点が，\LaTeX{}209 用に配布されていた従
% 来の {\ttfamily kueethesis.sty} から最も大きく異なっています．従来版で
% は，\verb+\figureandtable+ と \verb+\figureandtableof+ の2つのコマンド
% を利用して，手作業で論文末尾に図表を記述する必要がありました．互換性を
% 保つため，これらのコマンドは一応定義されていますが，出力に矛盾を生じる
% 可能性がありますので，決して使用しないで下さい．研究室の先輩の原稿など
% を参考にして作業している場合は，特に注意して下さい． -->


## 謝辞
謝辞は，\verb+acknowledgements+ 環境を用いて記述します．

## 相互参照
\label{cross_reference}
相互参照は，通常の\LaTeX{}文書と同様に，\verb+\label+ コマンドと
\verb+\ref+ コマンドを用いて行います．例えば，章番号を参照する場合には，
以下のように \verb+\chapter+ コマンドの直後に \verb+\label+ コマンドを
配置してラベルを宣言します．
\begin{quote}
  \begin{verbatim}
\chapter{はじめに}
\label{chap:intro}
\end{verbatim}
\end{quote}
その上で，参照したい箇所に，\verb+\ref+ コマンドを以下のように配置しま
す．
\begin{quote}
  \begin{verbatim}
\ref{chap:intro}章では，本利用説明書の位置づけについて述べています．
\end{verbatim}
\end{quote}
\verb+\ref{chap:intro}+ は実際の章番号に置換されて，以下のように組版されます．
\begin{quote}
  \ref{chap:intro}章では，本利用説明書の位置づけについて述べています．
\end{quote}
詳しくは，本利用説明書内の利用例および，
\LaTeX2e{}美文書作成入門\cite{GuideBook}の第10章などを参照してください．


## 参考文献
参考文献は \verb+thebibliography+ 環境を用いて直接記述するか，
BibTeX システムを用いて作成することができます\footnote{(J)BibTeX
  の使い方については \LaTeX ブック\cite{LaTeX}の付録Bなどを参照．}．



## 付録

付録は \verb+\appendix+ コマンドの後に記述します\footnote{付録ページの
  ページ番号は本文から継続し，アラビア数字で出力されます．}．付録の各項
目は \verb+\chapter+ コマンドによって分割して記述します．付録がただ1項
目からなる場合にも項目の始めに \verb+\chapter+ コマンドを用いて項目名
を指定して下さい．


# おわりに
\label{chap:conclusion}

\LaTeX{}209用スタイルファイルの利用説明書\cite{OldTebiki}には，次のよ
うに書かれていました．
\begin{quote}
  京大電気系学科の修論$\cdot$卒論に\LaTeX が使われ出して4年目になりま
  す．最初のころはPC98上のアスキー日本語Micro-\TeX を使ってちんたらやっ
  ていたものですが，最近ではUnixマシンおよびUnix上のNTT \TeX, ASCII
  \TeX が広く普及し，修論・卒論を\LaTeX で書こうという人はかなり多く
  なっているものと思います．
\end{quote}
すなわち，30年の長きにわたって，\LaTeX{}が修論$\cdot$卒論の作成に用い
られていることになります．これは，\LaTeX{}の論理マークアップという考え
方が，論文作成と親和性が高いことの証明であると，著者は考えます．例えば，
論文作成時には，論旨を明確化するために，章や節を単位として順序を頻繁に
変更する必要が生じます．相互参照(\ref{cross_reference}節)を正しく活用
していれば，どのように順序を変更しても常に正しく番号が付番されるので，
納得がいくまで順序を考えることができます．

このクラスファイルを活用し，皆さんがより良い修論$\cdot$卒論を執筆され
ることを願っています．



<!-- %====================================================================== -->
<!-- %		謝辞 -->
<!-- %====================================================================== -->
\begin{acknowledgements}
  オリジナルの \LaTeX{}209 用スタイルファイル kueethesis.sty の配布キットを作成された，傳康晴さんに感謝します．


  図表を論文の末尾に移動する方法について, endfloat.sty を
  参考にさせて頂きました．筆者の James Darrell McCauley さんに感謝しま
  す．また，改造方法について \TeX{} FAQ 掲示板でアドバイスをくださった
  misc さんに感謝します．

  このクラスファイルの初期の版から現在の版に至るまで，各年度の長尾研究
  室(現$\cdot$言語メディア研究室)をはじめ多くの研究室の人たちから，数々
  の貴重なコメントを頂きました．関係者各位に感謝します．
\end{acknowledgements}



<!-- %====================================================================== -->
<!-- %		参考文献 -->
<!-- %====================================================================== -->
\bibliographystyle{kueethesis}
\bibliography{thesis}



<!-- %====================================================================== -->
<!-- %		付録 -->
<!-- %====================================================================== -->
\appendix
\chapter{改版履歴}\label{chap:history}
\begin{description}
  \item[1991年] 傳康晴\footnote{工学研究科\ 電子工学専攻 長尾研(当時)．
          現在，千葉大学．}が，\LaTeX{}209 用修論$\cdot$卒論スタイ
        ルファイル kueethesis.sty と文献用スタイルファ
        イル kueethesis.bst を作成\cite{OldTebiki}．
  \item[2001年] 土屋雅稔\footnote{情報学研究科 知能情報学専攻 言語メディ
        ア研(当時)．現在，豊橋技術科学大学．tsuchiya@tut.jp}が，\LaTeX2e{} 用修論$\cdot$卒論クラスファ
        イル kuee.cls を作成\cite{Tebiki2004}．
        \newcounter{tsuaffil}
        \setcounter{tsuaffil}{\value{footnote}}
  \item[2017年] 土谷亮\footnote{情報学研究科 通信情報システム専攻 小野
        寺研．現在，滋賀県立大学．tsuchiya.a@e.usp.ac.jp} が，参考文献の形式を改良．
  \item[2018年] 土屋雅稔\footnotemark[\value{tsuaffil}]{}が，英文要旨
        に対応するためのコマンドを追加．
\end{description}


\chapter{レイアウト・パラメータ}\label{chap:layout}
デフォルトで利用される本文ページ，図・表ページのレイアウト・パラメータ
はそれぞれ表 \ref{tab:text},\ref{tab:fig} のようになっています．

\begin{table}
  \caption{本文ページのデフォルト・レイアウト}\label{tab:text}
  \begin{center}
    \begin{tabular}{|l|r|}
      \hline
      \verb+\textwidth+ & 424pt \\ \hline
      \verb+\textheight+ & 604pt \\ \hline
      \verb+\oddsidemargin+ & 0.5cm \\ \hline
      \verb+\evensidemargin+ & 0.5cm \\ \hline
      \verb+\topmargin+ & 0pt   \\ \hline
      \verb+\headheight+ & 12pt  \\ \hline
      \verb+\headsep+ & 25pt  \\ \hline
      \verb+\footskip+ & 30pt  \\ \hline
    \end{tabular}
  \end{center}
\end{table}

\begin{table}
  \caption{図・表ページのデフォルト・レイアウト}\label{tab:fig}
  \begin{center}
    \begin{tabular}{|l|r|}
      \hline
      \verb+\textwidth+ & 424pt + 1cm  \\ \hline
      \verb+\textheight+ & 604pt + 67pt \\ \hline
      \verb+\oddsidemargin+ & 0pt          \\ \hline
      \verb+\evensidemargin+ & 0pt          \\ \hline
      \verb+\topmargin+ & 0pt          \\ \hline
      \verb+\headheight+ & 0pt          \\ \hline
      \verb+\headsep+ & 0pt          \\ \hline
      \verb+\footskip+ & 0pt          \\ \hline
    \end{tabular}
  \end{center}
\end{table}

