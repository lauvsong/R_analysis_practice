# 2-1
law <- read.csv("law.csv")
law$code <- with(data=law, ifelse((region_code=="Advanced Economies"),1,
                                  ifelse((region_code=="East Asia and the Pacific"),2,
                                         ifelse((region_code=="Europe and Central Asia"),3,
                                                ifelse((region_code=="Latin America and the Caribbean"),4,
                                                       ifelse((region_code=="Middle East and North Africa"),5,
                                                              ifelse((region_code=="South Asia"),6,7)))))))
law$code

# 2-2
law$region <- factor(law$code, levels=1:7, labels=c("Advanced", "East Asia", "Europe", "America", "MENA", "South Asia", "Africa"))
law$region

# 2-3
High <- subset(law, gdp>1)
Low <- subset(law, gdp<1)
mean(High$gdp)
mean(Low$gdp)
