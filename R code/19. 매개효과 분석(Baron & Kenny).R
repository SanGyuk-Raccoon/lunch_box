# 데이터 불러오기
data = read.csv("G:/잡동사니/산격동 너구리/[수정]/예제 파일/15. [산격동 너구리] 매개 효과 예제.csv", header = T)

model1 = lm(M~X, data = data)
summary(model1)

model2 = lm(Y~X, data = data) 
summary(model2)

model3 = lm(Y~X+M, data = data) 
summary(model3)
