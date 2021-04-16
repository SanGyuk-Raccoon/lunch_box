rm(list = ls())
## 데이터 불러오기
data = read.csv("C:/Users/USER/Desktop/새 폴더/예제 파일/07. [산격동 너구리] ANOVA 예제.csv", header= T)

## 가정 확인하기
# 1. 독립
# 2. 척도

## Kruskal-Wallis test
model_fin = kruskal.test(time ~ group, data = data)
model_fin


## 사후분석
library(dunn.test)
dunn.test(data$time, data$group)
