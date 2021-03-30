library(car)
library(lattice)
library(readxl)

dodgers <- read.csv("dodgers.csv")
View(dodgers)
print(str(dodgers))
str(dodgers)

factor(dodgers$month)
typeof(dodgers$month)
class(dodgers$month)
factor(dodgers$bobblehead)

ifelse(dodgers$day_of_week=="Monday",1,0)
ifelse(dodgers$day_of_week=="Monday",1,0)

with(data=dodgers, ifelse(day_of_week))

# cat -> num
dodgers$ordered_day_of_week <- with(data=dodgers,
    ifelse ((day_of_week == "Monday"),1,
    ifelse ((day_of_week == "Tuesday"),2,
    ifelse ((day_of_week == "Wednesday"),3,
    ifelse ((day_of_week == "Thursday"),4,
    ifelse ((day_of_week == "Friday"),5,
    ifelse ((day_of_week == "Saturday"),6,7)))))))

# num -> cat
# factor : numeric에서 character로 변환 가능
dodgers$ordered_day_of_week <- factor(dodgers$ordered_day_of_week, levels=1:7,labels=c("Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"))
View(dodgers)

# names : 변수의 이름들
names(dodgers)

library(ggplot2)

# 주별 분포
# plot : boxplot 그리기
with(data=dodgers, plot(ordered_day_of_week, attend/1000, 
    xlab="Day of week", ylab="Attendance (thousands"),
    col="violet", las=1
     )

# table : 특성 간 관계
table(dodgers$bobblehead, dodgers$ordered_day_of_week)


dodgers$ordered_month <- with(data=dodgers,
    ifelse ((month == "APR"),4,
    ifelse ((month == "MAY"),5,
    ifelse ((month == "JUN"),6,
    ifelse ((month == "JUL"),7,
    ifelse ((month == "AUG"),8,
    ifelse ((month == "SEP"),9,10)))))))
dodgers$ordered_month <- factor(dodgers$ordered_month, levels=4:10, labels = c("April", "May", "June", "July", "Aug", "Sept", "Oct"))

# 월별 분포
plot(dodgers$ordered_month, dodgers$attend/1000)


xyplot(attend ~ temp, data=dodgers)
xyplot(attend ~ temp | skies, data=dodgers)
xyplot(attend ~ temp | skies + day_night, data=dodgers)
xyplot(attend ~ temp | skies + day_night, data=dodgers, groups=fireworks)
xyplot(attend ~ temp | skies + day_night, data=dodgers, groups=bobblehead)


# formula 생성
my.model <- {attend ~ ordered_month + ordered_day_of_week + bobblehead}
class(my.model)


# 회귀 분석
# Intercept : 빠진 변수의 평균 관중 수 (alpha)
# 빠진 변수가 baseline
lm(attend~ordered_month, data = dodgers)
lm(attend~ordered_day_of_week, data = dodgers)
lm(attend~bobblehead, data=dodgers)
summary(lm(formula=attend~bobblehead, data=dodgers))
