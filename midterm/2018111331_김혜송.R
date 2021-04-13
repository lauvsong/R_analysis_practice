# 1-1
ratings <- read.csv("TeachingRatings.csv")
with(ratings, plot(beauty, course_eval))

# 1-2
model <- {course_eval ~ beauty}
reg <- lm(model, data=ratings)
reg
# 외모가 출중할수록 강의평가점수가 높아지는는 경향을 띈다.

# 1-3
0.133*mean(ratings$beauty) + 3.998

# 1-4
model2 <- {course_eval ~ beauty+intro+onecredit+female+minority+nnenglish}
lm(model2, data=ratings)