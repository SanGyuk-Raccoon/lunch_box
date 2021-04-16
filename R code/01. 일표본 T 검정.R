rm(list = ls())
## 1. 데이터 불러오기
# 데이터 파일 경로는 수정해주세요. 
data = read.csv("C:/Users/USER/Desktop/새 폴더/예제 파일/[산격동 너구리] 일표본 T 검정 예제.csv", header= T)

## 2. 가정 확인하기
# 1) 표본의 평균이 정규성을 가져야 한다.
# 1-1) 데이터가 30개 이상이면 중심극한정리에 의해 가정 만족

# 1-2) 데이터가 10~29개라면, 정규성 검정을 통해 확인
shapiro.test(data$height)


## 3. 일표본 T 검정
t.test(data$height, mu = 150)
