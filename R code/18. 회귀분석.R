#######첫 번째 포스팅#########################################################
####### 기본적인 회귀분석 #####
## 데이터 불러오기
data = read.csv("G:/잡동사니/산격동 너구리/[수정]/예제 파일/14. [산격동 너구리] 회귀 분석 예제.csv", header = T)

## 산점도
pairs(data)

## 회귀분석
model1 = lm(sales ~ ., data = data)

## 잔차 그래프 그래기
par(mfrow = c(2,2)) # 2행, 2열로 그래프 표현
                    # 한번에 그래프 4개를 볼 수 있음
plot(model1)

## 회귀분석 결과
summary(model1)


#####두 번째 포스팅###########################################################
#####step wise ######
## 변수 선택
model1_selection = step(model1, direction = 'both',
                        scope = list(lower = ~ 1))

summary(model1_selection)
plot(model1_selection)


#####log Transformation #####
model2 = lm(log(sales) ~ ., data = data)
plot(model2)

summary(model2)

model2_selection = step(model2, direction = 'both',
                        scope = list(lower = ~ 1))

summary(model2_selection)
plot(model2_selection)


######################################################################

## 2차항 + 상호작용항
model3 = lm(sales ~ .^2 +
             I(youtube^2) +
             I(facebook^2) +
             I(newspaper^2)
           , data = data)

summary(model3)

plot(model3)

model3_selection = step(model3, direction = 'both',
                        scope = list(lower = ~1))

summary(model3_selection)
plot(model3_selection)
##########
## 최종
model4 = lm(sales ~ I(youtube^2) +
                    youtube + facebook + youtube*facebook
                    , data = data)
plot(model4)

summary(model4)


