rm(list = ls())
## 데이터 불러오기
data = read.csv("C:/Users/USER/Desktop/새 폴더/예제 파일/07. [산격동 너구리] ANOVA 예제.csv", header= T)
data

## 가정 확인하기
# 1) 정규성 가정
shapiro.test(subset(data, group == 'A')$time)
shapiro.test(data[data$group == 'B', 'time'])
shapiro.test(data[data$group == 'C', ]$time)

# 2) 등분산성 가정
library(lawstat)
levene.test(data$time, data$group, location = "mean") # p-value = 0.801 > 0.05

# 3) 독립성 가정
#

## ANOVA
model_fin = aov(time ~ group, data = data)
summary(model_fin)

## 사후 분석
# scheffe 방법
library(agricolae)
scheffe.test(model_fin, "group", alpha = 0.05, console = T)
