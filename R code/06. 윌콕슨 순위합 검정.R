rm(list = ls())
## 데이터 불러오기
data = read.csv("G:/산격동 너구리/[수정]/06. [산격동 너구리] 윌콕슨 순위합 검정 예제.csv", header = T)
data

## 가정 확인
# A의 정규성 -> CLT
# B의 정규성
shapiro.test(data[data$company=="B", "weight"])

## 윌콕슨 순위합 검정
# 1번 방법
wilcox.test(data[data$company=="A", "weight"], # 그룹 1의 종속 변수
            data[data$company=="B", "weight"]) # 그룹 2의 종속 변수 

# 2번 방법
wilcox.test(data = data, # 사용할 데이터셋
            weight ~ company) # 종속변수 ~ 그룹 변수

median(data[data$company=="A", "weight"])
median(data[data$company=="B", "weight"])
