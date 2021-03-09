x<-c(1,2,3)

# 평균
mean(x)
xbar <- mean(x)

# 최댓값
max(x)

# 최솟값
min(x)

c5 <- c("Hello", "my", "name", "is", "hye-song", "!")
paste(c5)

# 여러 문자를 하나로 병합
# python의 join과 비슷
paste(c5, collapse = " ")
paste(c5, collapse = "")

who <- paste(c5, collapse = " ")
who

# 모듈 설치
install.packages("ggplot2")

# 모듈 임포트
library(ggplot2)

# 메뉴얼 조회
?ggplot2
?qplot

# 도표
x <- c("a", "a", "b", "c")
qplot(x) # factor(categorize)

x <- c(1:10)
y <- x*x

qplot(x,y)
qplot(x,y, geom = "point")
