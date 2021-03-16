library(readxl)
gdp <- read_excel("gdp.xlsx")
(gdp$y2017+gdp$y2018) / 2

gdp$avg <- (gdp$y2017+gdp$y2018) / 2
View(gdp)

avg <- (gdp$y2017+gdp$y2018) / 2

ifelse(gdp$avg >= 50000, 1, 0)
ifelse(gdp$avg >= 50000, "y", "n")

gdp$rich <- ifelse(gdp$avg >= 50000, "y", "n")
gdp

View(gdp)

library(ggplot2)
qplot(gdp$rich)

table(gdp$rich)
