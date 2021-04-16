rm(list = ls())
## 1. 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/03. [산격동 너구리] 대응표본 T 검정 예제.csv", header = T)
data
## 2. 가정 확인
#   2-1) 정규성 가정
#    전/후 차이 구하기
data$diff = data$after - data$before # diff라는 새로운 변수 생성

#   정규성 확인
shapiro.test(data$diff)

## 3. 대응 표본 T 검정
# 1번 방법
t.test(data$before, # 비교할 값 1
       data$after, # 비교할 값 2
       paired = T) # 대응표본인지? (T/F)

# 2번 방법
t.test(data$diff) # 값의 차이에 대한 일표본 T검정과 같음 