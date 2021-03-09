# dplyr 설치
install.packages("dplyr")

library(dplyr)

x1 <- c(1,2,3)
x2 <- c(4,5,6)

my.df <- data.frame(x1,x2)
my.df

# 변수명 변경
rename(my.df, y1=x1)
my.df <- rename(my.df, y1=x1)
my.df
