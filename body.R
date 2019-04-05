#' ---
#' title: タイトルをここに書きます
#' author: 作成者名をここに書きます
#' ---
# ' body.R
# ' Created date: 2019/3/11
# ' author: mariko ohtsuka
input_csv <- read.csv("/Users/admin/Documents/GitHub/R_markdown_sample/input/input.csv", as.is=T, fileEncoding="utf-8",
                      stringsAsFactors=F)
# SEX=0:男性、1:女性として性別を集計
input_csv$SEX_str <- ifelse(input_csv$SEX == 0, "男性", "女性")
sex_table <- aggregate(input_csv$SEX_str, by=list(input_csv$SEX_str), length, drop=F)
# sex_tableに列名をつける
colnames(sex_table) <- c("性別", "人数")

header1_string <- "見出し1です"
header2_string <- 100
#' # `r header1_string`
#' ## n=`r header2_string`
#' ### 性別の見出し3です
kable(sex_table, format = "markdown")
# データセットを性別で分ける
df_m <- subset(input_csv, SEX==0)
df_f <- subset(input_csv, SEX==1)
# 性別毎にBMIのsummaryを出し、データフレームを結合する
df_bmi <- cbind(summary(df_m$BMI), summary(df_f$BMI))
# df_bmiに列名をつける
colnames(df_bmi) <- c("男性", "女性")
kable(df_bmi, format = "markdown")
