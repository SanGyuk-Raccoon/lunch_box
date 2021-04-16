rm(list = ls())
## 데이터 불러오기
data = read.csv("C:/Users/USER/Desktop/새 폴더/예제 파일/07. [산격동 너구리] ANOVA 예제.csv", header= T)
data

## 가정 확인하기
# 1) 정규성 가정
model_anova = aov(time ~ group, data = data)
res = model_anova$residuals
shapiro.test(res)

# 2) 등분산성 가정
library(lawstat)
levene.test(data$time, data$group, location = "mean") # p-value = 0.801 > 0.05

# 3) 독립성 가정
#

## Welch's ANOVA
model_fin = oneway.test(time ~ group, data = data, var.equal = F)
model_fin

## 사후분석
# devtools::install_github("matherion/userfriendlyscience", dependencies=TRUE)
# install.packages("userfriendlyscience")
library(userfriendlyscience)
posthocTGH(data$time, data$group, method = "games-howell", conf.level = 0.95)

