## 데이터 불러오기
data = read.csv("F:/산격동 너구리/[수정]/예제 파일/13. [산격동 너구리] 상관 분석 예제.csv", header = T)

## 단조 관계 가정
pairs(data)


## 스피어만 상관 분석
library(psych)
corr.test(data,
          use = 'complete',
          method = 'spearman',
          adjust = 'none')

# 세부 결과
res = corr.test(data,
                use = 'complete',
                method = 'spearman',
                adjust = 'none')
res$r
res$p

## 켄달 타우
corr.test(data,
          use = 'complete',
          method = 'kendall',
          adjust = 'none')

# 세부 결과
res = corr.test(data,
               use = 'complete',
               method = 'kendall',
               adjust = 'none')

res$r
res$p


corr.test()