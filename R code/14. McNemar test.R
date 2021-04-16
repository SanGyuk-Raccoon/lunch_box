rm(list = ls())


## 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/예제 파일/11. [산격동 너구리] Mcnemar test 예제.csv", header = T)


## 빈도표
tab = table(data)
tab

## 맥니마 검정
mcnemar.test(tab, correct = F)


