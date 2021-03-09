econ <- c(90,80,60,70)
biz <- c(50,60,100,20)

# 데이터 프레임 생성
data.frame(econ, biz)
data.frame(econ=c(90,80,60,70), biz=c(50,60,100,20))

library(readxl)

# 워킹 디렉토리 설정
setwd("C:/Users/pjh93/Desktop/김혜송/빅데이터/CH00")

gdp <- read_excel("gdp.xlsx")
gdp <- read.csv("gdp.csv")

# 시각화
View(gdp)

# 구조
str(gdp)
gdp$country

# 차원 조회 & 변환
dim(gdp)
dim(gdp) <- c(2,3)


# 요약 통계
summary(gdp)
summary(gdp$y2018)
