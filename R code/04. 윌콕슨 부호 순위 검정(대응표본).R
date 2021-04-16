rm(list = ls())
## 1. 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/05. [산격동 너구리] 윌콕슨 부호 순위 검정(대응표본) 예제.csv", header = T)
data

## 2. 윌콕슨 부호 순위 검정
# 1번 방법
wilcox.test(data$before, 
            data$after,
            paired = T) 
# 2번 방법
data$diff = data$before - data$after
wilcox.test(data$diff, mu = 0)
# p-value = 0.1641 > 0.05 
