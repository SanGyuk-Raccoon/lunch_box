rm(list = ls())
## 1. 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/04. [산격동 너구리] 윌콕슨 부호 순위 검정(일표본) 예제.csv", header = T)
data

## 2. 윌콕슨 부호 순위 검정
wilcox.test(data$weight, mu = 100) 
# p-value = 0.1641 > 0.05 
