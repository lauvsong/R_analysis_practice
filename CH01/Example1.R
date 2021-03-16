library(dplyr)
law <- read.csv("law.csv")
View(law)

# filter: 조건에 맞는 필드 선택
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
View(group3)
View(group4)

mean(group1$gdp)
mean(group2$gdp)
mean(group3$gdp)
mean(group4$gdp)

mean(group1$education)
mean(group2$education)
mean(group3$education)
mean(group4$education)


# select: 필드 선택
y <- select(law, gdp)
y <- select(law, country, gdp)


# 원치 않는 필드 drop
new.df <- select(law, -rule_of_law, -control_of_corruption)
View(new.df)


# arrange: 정렬
arrange(law, gdp)
arrange(law, region, gdp)
arrange(law, desc(rule_of_law)) # 내림차순

new.df <- select(law, rule_of_law, control_of_corruption, region)


# mutate: 필드 생성
mutate(new.df, x=rule_of_law+control_of_corruption)
new.df <- mutate(new.df, y=ifelse(region==1, "advanced", "else"))
View(new.df)


# summary: 요약 통계
summary(new.df)
summarise(law, mean(gdp))
summarise(law, ybar=mean(gdp))

temp <- summarise(law, mean(gdp))
str(temp)

law %>% summarise(mean(gdp))
law %>% summarise(ybar=mean(gdp))

law %>% group_by(region) %>% summarise(mean(gdp))

law %>%
  group_by(region) %>%
  summarise(m1=mean(gdp),
            m2=mean(education),
            m3=mean(rule_of_law),
            m4=mean(control_of_corruption))


# join 연산
X<- data.frame(id=c(1,2,3), no.orders=c(5,10,4),
                value.orders=c(500,240,40))
Y <- data.frame(id=c(1,2,3), age=c(25,30,40),
                gender=c("F", "M", "F"))
Z <- data.frame(id=c(5,6,7), age=c(19,34,46), 
                gender=c("M", "F", "F"))

inner_join(X,Y,by="id")
left_join(X,Y,by="id")
right_join(X,Y,by="id")
full_join(X,Y,by="id")
