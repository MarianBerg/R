library(psych)

attidude <- data("attitude")

View(head(attitude))
summary(attidude)

cronbach_alpha <- alpha(attitude)
cronbach_alpha

correlation <- cor(attitude)
print(correlation)

attitude$scale <- rowMeans(subset(attitude, select = c(rating, complaints, privileges, learning, raises, critical, advance)), na.rm = TRUE)
print(attitude)
