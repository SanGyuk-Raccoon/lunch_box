rm(list = ls())
## 1. 데이터 불러오기
data = read.csv("C:/Users/USER/Desktop/새 폴더/예제 파일/02. [산격동 너구리] 독립표본 T 검정 예제.csv", header= T)

## 2. 가정 확인하기
# 2-1) 정규성 가정
# 대구지역 그룹 정규성 확인
shapiro.test(data[ data$group == "Deagu" , ]$height )
# 대구지역 그룹 정규성 확인
shapiro.test(data[ data$group == "Seoul" , ]$height )

# 2-2) 등분산성 가정
install.packages("lawstat") # install.packages : 라이브러리를 컴퓨터에 설치
library(lawstat) # library : 설치된 라이브러리 실행
# 따라서, install.packages는 동일한 컴퓨터에 한번만 사용해주시면 됩니다.

levene.test(data$height, data$group, location = 'mean') 
# 등분산성 검정은 종류가 다양합니다. 다른 포스팅에서 따로 정리하겠습니다.

# p-value = 0.1742 > 0.05 이므로 두 그룹의 분산은 동일하다고 볼 수 있습니다.

# 2-3) 독립성 가정
  

## Welch's T 검정
# 1번 방법
t.test(data = data, # 사용할 데이터셋 입력
       height ~ group, # 종속 변수 ~ 그룹 변수
       var.equal = FALSE) # 두 그룹의 분산이 동일한지? (T/F)

# 2번 방법
t.test(data[ data$group == "Deagu" , ]$height, # 그룹 1의 종속변수
       data[ data$group == "Seoul" , ]$height, # 그룹 2의 종속변수 
       var.equal = F) # # 두 그룹의 분산이 동일한지? (T/F)
