#' ---
#' title: "Rマークダウンサンプル"
#' author: "ohtsuka"
#' date: "2019/4/4"
#' ---
#' # R Markdownの見本です
#' 「#' 」の後にマークダウン形式の文書を記述します。
#'
#' 「#' 」だけの行を入れると改行します。
#'
#' ## フランスのIlle-et-Vilaineにおける（o）食道癌の症例対照研究からのデータ
#'
#' [esoph](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/esoph.html)
#'
#' **上記のURLに記載されている内容を元に色々やってみます。**
#'
# #だけのコメントは出力されません
# kable関数…データフレームをマークアップ言語形式の表に変換する
kable(esoph, format="markdown")
#' ## esoph フォーマット
#' ### agegp
kable(data.frame(水準=labels(levels(esoph$agegp)), 年齢層=levels(esoph$agegp)), format="markdown")
#' ### alcgp
kable(data.frame(水準=labels(levels(esoph$alcgp)), アルコール消費量=levels(esoph$alcgp)), format="markdown")
#' ### tobgp
kable(data.frame(水準=labels(levels(esoph$tobgp)), タバコ消費量=levels(esoph$tobgp)), format="markdown")
#' ### ncases
#' ケース数
#'
#' ### ncontrols
#' コントロール数
#'
#' ## summary
# 「#+ 」の後にチャンクオプションを記載します。
#+ echo=T
summary(esoph)
#+ echo=T
#' ## アルコール、タバコおよび相互作用の影響、年齢調整
model1 <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp * alcgp,
              data = esoph, family = binomial())
anova(model1)
#' ## アルコールとタバコの線形効果
#+ echo=T
model2 <- glm(cbind(ncases, ncontrols) ~ agegp + unclass(tobgp)
              + unclass(alcgp),
              data = esoph, family = binomial())
summary(model2)
#' ## モザイクプロットのデータを並べ替える
ttt <- table(esoph$agegp, esoph$alcgp, esoph$tobgp)
o <- with(esoph, order(tobgp, alcgp, agegp))
ttt[ttt == 1] <- esoph$ncases[o]
tt1 <- table(esoph$agegp, esoph$alcgp, esoph$tobgp)
tt1[tt1 == 1] <- esoph$ncontrols[o]
tt <- array(c(ttt, tt1), c(dim(ttt),2),
            c(dimnames(ttt), list(c("Cancer", "control"))))
mosaicplot(tt, main = "esoph data set", color = TRUE)
