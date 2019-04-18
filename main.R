# R markdown sample program
# Created date: 2019/3/11
# Author: mariko ohtsuka

# 初回のみrmarkdown, knitrパッケージのインストールが必要です。
# install.packages("rmarkdown")
# install.packages("knitr")
# rmarkdown, knitrパッケージの機能を使えるようにします。
library(rmarkdown)
library(knitr)
# echo=Tにすると出力ファイルにソースコードを出力します。
# comment=NAのNAを書き換えると結果の行頭にその文字が入ります。（例：comment="*"）
knitr::opts_chunk$set(echo=F, comment=NA)
# body.Rの実行結果をoutput_dirで指定したフォルダのoutput_fileに出力します。
render("/Users/admin/Documents/GitHub/R_markdown_sample/body.R",
       output_format=word_document(),
       output_dir="/Users/admin/Documents/GitHub/R_markdown_sample/output",
       output_file="output.docx")
