# a) + b) 
data("mtcars")
library(ggplot2)

ggplot(mtcars, aes(x = gear, y = carb)) +
  geom_point() +
  labs(title = "Streudiagramm: Gänge vs. Vergaser",
       x = "Anzahl der Gänge",
       y = "Anzahl der Vergaser")

# c)
library(DescTools)

cor.test(mtcars$gear, mtcars$carb, method = "spearman")
SpearmanRho(mtcars$gear, mtcars$carb, conf.level = 0.95)

# e) 
library(ggplot2)

ggplot(mtcars, aes(x = gear, y = mpg)) +
  geom_point() +
  labs(title = "Streudiagramm: Gänge vs. Miles per Gallon",
       x = "Anzahl der Gänge",
       y = "Miles per Gallon")

# f) 
library(DescTools)

cor.test(mtcars$gear, mtcars$mpg, method = "spearman")
SpearmanRho(mtcars$gear, mtcars$mpg, conf.level = 0.95)


