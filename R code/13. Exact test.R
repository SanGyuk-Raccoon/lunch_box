rm(list = ls())


## 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/예제 파일/10. [산격동 너구리] Fisher exact 예제.csv", header = T)


## 빈도표
tab = table(data)
tab

## 카이제곱 검정
res = chisq.test(tab)

## 기대 빈도
res$expected

## 카이제곱 검정 결과
res

## 피셔의 정확 검정
fisher.test(tab)


