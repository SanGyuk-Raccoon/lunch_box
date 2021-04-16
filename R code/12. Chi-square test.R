rm(list = ls())

## 데이터 불러오기
data = read.csv("F:/산격동 너구리/[수정]/예제 파일/09. [산격동 너구리] Chi Square 예제.csv", header = T)

## 빈도표
tab = table(data)
tab

## 카이제곱 검정
res = chisq.test(tab)

## 기대 빈도
res$expected

## 카이제곱 검정 결과
res

mosaicplot(res$expected)
mosaicplot(res$observed)




##########
## 참고 ##


## library


#### chi-square test
## 2개의 범주형 변수 간에 관계가 있는지?

## Assumption
# 변수의 범주는 상호배타적이어야 한다.
# 관측치는 서로 독립적이어야 한다. -> 멕니마 테스트
# 기대빈도가 5미만인 셀이 전체 셀의 20%미만이어야 한다.

## 가설
# 귀무가설 : 변수 1과 변수 2는 서로 독립적이다.
# 대립가설 : 변수 1과 변수 2는 서로 독립적이지 않다.(= 관련이 있다.)


###############################
## expected value
exp_tab_fun = function(TABLE) {
  r = nrow(TABLE)
  c = ncol(TABLE)
  exp_tab = matrix(nrow = r, ncol = c)
  for ( i in 1:r) {
    for ( j in 1:c) {
      exp_tab[i, j] = sum(TABLE[, j]) * sum(TABLE[i, ]) / sum(TABLE[, ])
    }
  }
  return(exp_tab)
}

##
exp_tab_fun(tab)
## example1
test = matrix(c(122, 203,
                167, 118,
                528, 178,
                673, 212), nrow = 4, byrow= T)
test


exp_tab_fun(test)

res = chisq.test(test)

res$expected
