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
library(ggplot2)
qplot(anscombe$x1, anscombe$y1)

# linear regression
# lm(종속변수 ~ 설명변수, ..
lm(y1~x1, data=anscombe)
reg1 <- lm(y1~x1, data=anscombe)
View(reg1)
summary(reg1)

# with : python의 map과 비슷
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

# pdf 저장
pdf(file="C:/MyR/fig more anscombe.pdf", width=8.5, height=8.5)
# graph output....
dev.off()