install.packages("arules")
library(arules)

data(Groceries)
inspect(Groceries)

dim(Groceries)
dim(Groceries)[1]
dim(Groceries)[2]

class(Groceries)
my.data <- paste("1,2", "1", "2,3", sep="\n")
my.data

write(my.data, file="my.basket")
trans <- read.transactions("my.basket", format="basket", sep=",")
inspect(trans)

my.data <- data.frame(id=c(1,1,2,2,2,3), items=c("a","b","a","b","c","b"))
my.data

my.split <- split(my.data$items, my.data$id)
my.trans <- as(my.split, "transactions")
inspect(my.trans)

# 상대도수 그림
itemFrequencyPlot(Groceries)
itemFrequencyPlot(Groceries, support=0.01)
itemFrequencyPlot(Groceries, support=0.05)

itemInfo(Groceries)
inspect(Groceries)

itemInfo(Groceries)[[1]] # 괄호를 두개 쓰면 vector가 됨
itemInfo(Groceries)[1]

class(itemInfo(Groceries)[1])
class(itemInfo(Groceries)[[1]])

levels(itemInfo(Groceries)[["level2"]])

groceries <- aggregate(Groceries, itemInfo(Groceries)[["level2"]])
dim(groceries)

itemFrequencyPlot(groceries)
itemFrequencyPlot(groceries, support=0.025)
itemFrequencyPlot(groceries, support=0.05)

first.rules <- apriori(groceries, parameter = list(support=0.001, conf=0.05))
second.rules <- apriori(groceries, parameter = list(support=0.025, conf=0.05))

sort(second.rules, by="lift")
ordered.rules <- sort(second.rules, by="lift")
inspect(ordered.rules)


plot(second.rules) # transaction 데이터는 내장함수 plot으로 표현 불가
install.packages("arulesViz")
library(arulesViz)
plot(second.rules)
plot(second.rules, method="grouped")

subset(second.rules, rhs %pin% "vegetables")
vegie.rules <- subset(second.rules, rhs %pin% "vegetables")

inspect(vegie.rules)
sort(vegie.rules, by="lift")
top.vegie.rules <- head(sort(vegie.rules, by="lift"), 10)
inspect(top.vegie.rules)
plot(top.vegie.rules, method="graph")

movies = read.csv(file = "movie_tagline_data_parsed.csv", stringsAsFactors = FALSE) 
years.list <- 1974:2013
years.list
seq(along=years.list)
working.year.data.frame <- subset(movies, year==2013)
View(working.year.data.frame)