# 3-1
library(arules)
data(Adult)
itemFrequencyPlot(Adult, support=0.1)

# 3-2
rules <- apriori(Adult, parameter=list(support=0.01, conf=0.6))
inspect(rules)

# 3-3
rules.large <- subset(rules, rhs %pin% "income=large")
inspect(rules.large)

# 3-4
top.rules.large <- head(sort(rules.large, by="lift"),20)
inspect(top.rules.large)