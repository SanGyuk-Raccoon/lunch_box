

## 데이터 불러오기
data = read.csv("F:/산격동 너구리/[수정]/예제 파일/08. [산격동 너구리] Cronbach's Alpha 예제.csv", header = T)

library(psych)
## Cronbach's alpha
# a1~a5
alpha(data[,1:5])
# b1~b5
alpha(data[,6:10])
