# 1 
# B0은 편향(절편)을 나타내고, B1은 가중치를 나타낸다.

# 2
sport <- read.csv("sporting_event_ranking.csv")
reg1 <- lm(ranking~price, data=sport)
summary(reg1)

# 3
# price가 $20일 때 p값이 0.05 이하로, ranking과 밀접한 관계를 보인다.
# 그 외 $45, $70, $95도 t의 절댓값이 2보다 크게 높지 않고, 
# p값은 0.05보다 큰것으로 보아 ranking과 거의 연관이 없다.
# B0은 분석의 기준이라고 할 수 있으며,  여기선 Price$20이 된다.


# 4
my.model <- {ranking ~ price+seating+boxvip+frontrow+promotion}
reg2 <- lm(my.model, data=sport)
training_test <- c(rep(1, length=trunc((2/3)*nrow(sport))), 
                   rep(2, length=nrow(sport)-trunc((2/3)*nrow(sport))))
set.seed(1234)
sport$traning_test <- sample(training_test)
sport$traning_test <- factor(sport$traning_test, levels=c(1,2), labels=c("Train", "Test"))
sport.train <- subset(sport, traning_test == "Train")
sport.test <- subset(sport, traning_test == "Test")

train.model.fit <- lm(my.model, data=sport.train)
sport.test$predict_ranking <- predict(train.model.fit, newdata=sport.test)
sport.test$predict_ranking

sport.test$ranking
sport.test$predict_ranking
View(sport.test)

View(reg2)

# 5
# 


# 6
library(arules)
rules <- apriori(sport, parameter=list(support=0.001, conf=0.05))
inspect(rules)


# Part II
# 1
