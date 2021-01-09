rm(list = ls())

## Correlation analysis, 상관 분석
# 두 변수의 관계

### 주로 쓰는 3가지
## Pearson : 선형 관계 (모수)
## Spearman : 단조 관계 (비모수)
## kendall tau : 단조 관계 (비모수)

# Pearson 가정
# 두 변수는 연속형 변수여야 한다.
# 두 변수는 정규성을 따라야 한다. 
# 두 변수는 선형관계가 있어야 한다.

# 이상치가 결과에 영향을 줄 수 있다.

# Spearman 가정
# 두 변수는 적어도 순서형 변수 -> 등수를 매길 수 있냐/없냐
# 두 변수는 단조 관계가 있다.(monotone)

# kendall tau 가정
# 두 변수는 적어도 순서형 변수 
# 두 변수는 단조 관계가 있다.

# 보통, 소표본이고, 동점이 많을 때 Kendall tau를 사용...

## 선형 = 직선. Monotone(단조)??
library(ggplot2)
x = seq(0, 10, by = 0.1)
y1 = 6*x
y2 = x^2
y3 = (x-5)^3/5 +25
ggplot() +
  geom_line(aes(x = x, y = y1)) +
  geom_line(aes(x = x, y = y2), col = 'red') +
  geom_line(aes(x = x, y = y3), col = 'blue')

## 가설
# 귀무가설 : 변수 A와 B는 (선형) 상관 관계가 없다.
# 대립가설 : 변수 A와 B는 (선형) 상관 관계가 있다. 

# Example
# 신장과 체중은 관계가 있을까?
DATA = read.csv("F:/산격동 너구리/예제/hn18_all.csv", header = T)
data = DATA[, c("HE_wt", "HE_ht")]
head(data)

# 일단 Pearson -> Spearman, kendall tau

# 정규성 검정
shapiro.test(data$HE_wt)

ks.test(data$HE_ht, 'pnorm', mean= mean(data$HE_ht, na.rm= T), sd = sd(data$HE_ht, na.rm = T))
ks.test(data$HE_wt, 'pnorm', mean= mean(data$HE_wt, na.rm= T), sd = sd(data$HE_wt, na.rm = T))

# 산점도 확인
ggplot(data = data) +
  geom_point(aes(x = HE_ht, y = HE_wt))

# Cor
cor.test(data$HE_wt, data$HE_ht, method = "pearson")
cor.test(data$HE_wt, data$HE_ht, method = "spearman")
cor.test(data$HE_wt, data$HE_ht, method = "kendall")
# 잠깐, 결측치를 제거안했는데??
# 결과 비교를 해보면 cor.test 함수는 결측치를 자동으로 제거

# 일일이 하나하나씩 해야돼...?
# cor 함수는??
cor(data)

## psych 라이브러리 사용
library(psych)
corr.test(data, use = 'complete', adjust = "none", method = "spearman")

### 번외) pearson 상관 계수에서 자주 착각하는 것

# 어느 것의 상관 계수가 더 클까?
x = seq(0, 10, by = 0.1)
y1 = 1*x
y2 = 3*x

ggplot() +
  geom_point(aes(x = x, y = y1)) +
  geom_point(aes(x = x, y = y2), col = 'red')
# 둘 다 완벽한 직선형태, 기울기가 다름
cor.test(x, y1)
cor.test(x, y2)

# 어느 것의 상관 계수가 더 클까?
x = seq(0, 10, by = 0.1)
x2 = seq(20, 30, by = 0.1)
e1 = rnorm(length(x))
e2 = rnorm(length(x), sd = 5) 

y1 = 2*x + e1
y2 = 2*x2 + e2

ggplot() +
  geom_point(aes(x = x, y = y1)) +
  geom_point(aes(x = x, y = y2), col = 'red')
# 기울기는 같고, 검정색이 더 모여있음
cor.test(x, y1)
cor.test(x, y2)

## pearson 상관계수는

# 기울기는 +, -만 결정하는 거고....

# 산점도 형태가 얼마나 직선에 가까운지?? 절댓값이 1에 가까워짐

# 를 판단한다고 보는게 더 정확하다.