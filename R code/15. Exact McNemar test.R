rm(list = ls())


## 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/예제 파일/12. [산격동 너구리] exact Mcnemar test 예제.csv", header = T)


## 빈도표
tab = table(data)
tab

## 정확 맥니마 검정
library(exact2x2)
mcnemar.exact(tab)

mcnemar.test(tab, correct = F)






