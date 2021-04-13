x<-1
x<-
  
  # 벡터 정의
  v1 <- c(1,2,5,7,8)
v1 <- c(1,2,5)
v1 <- c(1,2,5,7,8)
v2 <- c(1:5)

# python 의 range와 같음
v3 <- seq(1,5)
v4 <- seq(1,10)
v4 <- seq(1,10,by=2)
v5 <- seq(1,10,by=3)

# 각 element에 scalar가 모두 더해짐
v1 + 2

# 벡터와 벡터 1:1 덧셈
v1 + v2

c1<- "a"
c2 <- "text"
c3 <- "Hello Seoul women's university!"
c4 <- c("a", "b", "c")
c5 <- c("Hello", "my", "name", "is", "hye-song", "!")


library(readxl)
gdp <- read_excel("gdp.xlsx")
gdp <- read.csv("gdp.csv")

View(gdp)

str(gdp)
gdp$country

dim(gdp)
summary(gdp)
summary(gdp$y2018)

library(dplyr)
x1 <- c(1,2,3)
x2 <- c(4,5,6)

my.df <- data.frame(x1,x2)
my.df

rename(my.df, y1=x1)
my.df
my.df <- rename(my.df, y1=x1)
my.df

gdp$avg <- (gdp$y2017 + gdp$y2018) / 2
gdp
View(gdp)

qplot(ifelse(gdp$avg >= 50000, "y", "n"))

library(ggplot2)

gdp$rich <- ifelse(gdp$avg >= 50000, "y", "n")
qplot(gdp$rich)

table(gdp$rich)



law <- read.csv("law.csv")
View(law)

rich <- filter(law, gdp>1)
str(rich)

adv <- filter(law, region==1)
str(adv)

filter(law, rule_of_law > 1 & control_of_corruption > 1)
filter(law, rule_of_law > 1 & control_of_corruption <= 1)
filter(law, region==1 | region==2)

group1 <- filter(law, rule_of_law < -1)
group1 <- filter(law, rule_of_law >= -1 & rule_of_law < 0)
group1 <- filter(law, rule_of_law < -1)
group2 <- filter(law, rule_of_law >= -1 & rule_of_law < 0)
group3 <- filter(law, rule_of_law >= 0 & rule_of_law < 1)
group4 <- filter(law, rule_of_law >= 1)

View(group1)
View(group2)

mean(group1$gdp)
mean(group1$education)
summary(group1)

y <- select(law, gdp)
y <- select(law, country, gdp)

new.df <- select(law, -rule_of_law, -control_of_corruption)

arrange(law, gdp)
arrange(law, region, gdp)
arrange(law, desc(rule_of_law))

new.df <- select(law, rule_of_law, control_of_corruption, region)

mutate(new.df, x=rule_of_law+control_of_corruption)
new.df <- mutate(new.df, y=ifelse(region==1, "advanced", "false"))

summary(new.df)
summarise(law, mean(gdp))
summarise(law, ybar=mean(gdp))

temp <- summarise(law, mean(gdp))
str(temp)

law %>% summarise(mean(gdp))
law %>% summarise(mean(gdp))

str(law)
law %>% group_by(region) %>% summarise(mean(gdp))

law %>% group_by(region ) %>% 
  summarise(m1=mean(gdp),
            m2=mean(education),
            m3=mean(rule_of_law),
            m4=mean(control_of_corruption))

X <- data.frame(id=c(1,2,3), no.orders=c(5,10,4),
                value.orders=c(500,240,40))

Y <- data.frame(id=c(1,2,3), age=c(25,30,40),
                gender=c("F", "M", "F"))
Z <- data.frame(id=c(5,6,7), age=c(19,34,46), 
                gender=c("M", "F", "F"))

factor(X)

X
Y

inner_join(X,Y,by="id")
left_join(X,Y,by="id")
right_join(X,Y,by="id")
full_join(X,Y,by="id")

anscombe <- data.frame(
  x1 = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
  x2 = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
  x3 = c(10, 8, 13, 9, 11, 14, 6, 4, 12, 7, 5),
  x4 = c(8, 8, 8, 8, 8, 8, 8, 19, 8, 8, 8),
  y1 = c(8.04, 6.95,  7.58, 8.81, 8.33, 9.96, 7.24, 4.26,10.84, 4.82, 5.68),
  y2 = c(9.14, 8.14,  8.74, 8.77, 9.26, 8.1, 6.13, 3.1,  9.13, 7.26, 4.74),
  y3 = c(7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73),
  y4 = c(6.58, 5.76,  7.71, 8.84, 8.47, 7.04, 5.25, 12.5, 5.56, 7.91, 6.89))


plot(anscombe$x1, anscombe$y1)
qplot(anscombe$x1, anscombe$y1)

lm(y1~x1, data=anscombe)
reg1 <- lm(y1~x1, data=anscombe)
View(reg1)
summary(reg1)

with(anscombe, qplot(x1, y1))
with(anscombe, plot(x1, y1))
with(anscombe, summary(lm(y1~x1)))
with(anscombe, print(summary(lm(y1~x1))))

with(anscombe, print(lm(y1~x1)))
with(anscombe, print(lm(y2~x2)))
with(anscombe, print(lm(y3~x3)))
with(anscombe, print(lm(y4~x4)))

with(anscombe, qplot(x2, y2))
with(anscombe, qplot(x3, y3))
with(anscombe, qplot(x4, y4))

pdf(file="C:/MyR/fig more anscombe.pdf", width=8.5, height=8.5)
dev.off()

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

with(data=dodgers, ifelse(day_of_week))

dodgers$ordered_day_of_week <- with(data=dodgers,
                                    ifelse ((day_of_week == "Monday"),1,
                                            ifelse ((day_of_week == "Tuesday"),2,
                                                    ifelse ((day_of_week == "Wednesday"),3,
                                                            ifelse ((day_of_week == "Thursday"),4,
                                                                    ifelse ((day_of_week == "Friday"),5,
                                                                            ifelse ((day_of_week == "Saturday"),6,7)))))))

dodgers$ordered_day_of_week <- factor(dodgers$ordered_day_of_week, levels=1:7, labels=c("Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"))

names(dodgers)
str(dodgers)

with(data=dodgers, plot(ordered_day_of_week, attend/1000,
                        xlab="Day of week", ylab="Attendance (thousands)",
                        col="violet", las=1))

table(dodgers$bobblehead, dodgers$ordered_day_of_week)

dodgers$ordered_month <- with(data=dodgers,
                              ifelse ((month == "APR"),4,
                                      ifelse ((month == "MAY"),5,
                                              ifelse ((month == "JUN"),6,
                                                      ifelse ((month == "JUL"),7,
                                                              ifelse ((month == "AUG"),8,
                                                                      ifelse ((month == "SEP"),9,10)))))))
dodgers$ordered_month <- factor(dodgers$ordered_month, levels=4:10, labels = c("April", "May", "June", "July", "Aug", "Sept", "Oct"))

plot(dodgers$ordered_month, dodgers$attend/1000)

xyplot(attend ~ temp, data=dodgers)
xyplot(attend ~ temp | skies, data=dodgers)
xyplot(attend ~ temp | skies + day_night, data=dodgers)
xyplot(attend ~ temp | skies + day_night, data=dodgers, groups=fireworks)
xyplot(attend ~ temp | skies + day_night, data=dodgers, groups=bobblehead)

my.model <- {attend ~ ordered_month + ordered_day_of_week + bobblehead}
class(my.model)
typeof(my.model)

# 회귀 분석
# Intercept : 빠진 변수의 평균 관중 수 (alpha)
# 빠진 변수가 baseline

lm(attend~ordered_month, data = dodgers)
lm(attend~ordered_day_of_week, data = dodgers)
lm(attend~bobblehead, data=dodgers)

# t가 대략 2보다 크면 or P가 0.05보다 작으면
# 기울기가 0, 절편 0인 가설을 기각! (유의미하다는 뜻뜻)
summary(lm(formula=attend~bobblehead, data=dodgers))

nrow(dodgers)
ncol(dodgers)

trunc(9.8)
trunc(10.2)

rep(1, length=5)
rep(1, times=5)
rep(c(1,2), length=5)
rep(c(1,2), times=5)

training_test <- c(rep(1, length=54), rep(2, length=27))
training_test

sample(1:50, 6)

set.seed(1234)
sample(c(1:10))
sample(training_test)

dodgers$training_test <- sample(training_test)
dodgers$training_test <- factor(dodgers$training_test, 
                                levels=c(1,2), labels=c("TRAIN","TEST"))

str(dodgers)
dodgers.train <- subset(dodgers, training_test=="TRAIN")
str(dodgers.train)
View(dodgers.train)
dodgers.test <- subset(dodgers, training_test == "TEST")

nrow(dodgers.test)
nrow(dodgers.train)

train.model.fit <- lm(my.model, data=dodgers.train)

summary(train.model.fit)
predict(train.model.fit)
View(dodgers.train)

predict(train.model.fit, newdata=dodgers.test)
View(dodgers.test)
dodgers.test$predict_attend <- predict(train.model.fit, newdata=dodgers.test)

dodgers.test$attend
dodgers.test$predict_attend

cor(dodgers.test$attend, dodgers.test$predict_attend)
str(dodgers.test)
str(dodgers.train)

dodgers.plotting.frame <- rbind(dodgers.train,dodgers.test)
with(dodgers.plotting.frame, qplot(predict_attend, attend))

xyplot(attend~predict_attend, data=dodgers.plotting.frame)
xyplot(attend~predict_attend | training_test, data=dodgers.plotting.frame)
xyplot(attend~predict_attend | training_test, groups=bobblehead, data=dodgers.plotting.frame)


library(arules)
?arules

data(Groceries)
inspect(Groceries)

dim(Groceries)
dim(Groceries[1])
dim(Groceries[2])

class(Groceries)
my.data <- paste("1,2", "1", "2,3", sep="\n")
my.data

write(my.data, file="my.basket")
trans <- read.transactions("my.basket", format="basket", sep=",")
trans
inspect(trans)

my.data <- data.frame(id=c(1,1,2,2,2,3), items=c("a","b","a","b","c","b"))
my.data

my.split <- split(my.data$items, my.data$id)
my.trans <- as(my.split, "transactions")
inspect(my.trans)

itemFrequencyPlot(Groceries)
itemFrequencyPlot(Groceries, support=0.01)
itemFrequencyPlot(Groceries, support=0.05)

itemInfo(Groceries)
inspect(Groceries)

itemInfo(Groceries)[[1]]

levels(itemInfo(Groceries)[["level2"]])
groceries <- aggregate(Groceries, itemInfo(Groceries)[["level2"]])
itemInfo(groceries)

itemFrequencyPlot(groceries)
itemFrequencyPlot(groceries, support=0.025)
itemFrequencyPlot(groceries, support=0.05)

# 상관법칙 계산
first.rules <- apriori(groceries, parameter=list(support=0.001, conf=0.05))
second.rules <- apriori(groceries, parameter = list(support=0.025, conf=0.05))

sort(second.rules, by="lift")
ordered.rules <- sort(second.rules, by="lift")
inspect(ordered.rules)

plot(second.rules)
library(arulesViz)
plot(second.rules)
plot(second.rules, method="grouped")

itemInfo(second.rules)
inspect(second.rules)

vegie.rules <- subset(second.rules, rhs %pin% "vegetables")

inspect(vegie.rules)
sort(vegie.rules, by="lift")
top.vegie.rules <- head(sort(vegie.rules, by="lift"),10)
inspect(top.vegie.rules)
plot(top.vegie.rules,method="graph")
