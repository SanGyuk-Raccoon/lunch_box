## 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/예제 파일/13. [산격동 너구리] 상관 분석 예제.csv", header = T)

## 선형성 가정
pairs(data)

## 정규성 가정
apply(data, 2, shapiro.test)

## 피어슨 상관 분석
library(psych)
corr.test(data,
          use = 'complete',
          method = 'pearson',
          adjust = 'none')

## 세부 결과
res = corr.test(data,
                use = 'complete',
                method = 'pearson',
                adjust = 'none')
res$r
res$p
