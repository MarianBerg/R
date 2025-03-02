library(tidyverse)
library(ggplot2)


summary(USArrests)

data <- as_tibble(USArrests)


ggplot(data, aes(x = Assault)) +
  geom_histogram(binwidth = 1)

ggplot(data, aes(x = Rape)) +
  geom_histogram(binwidth = 1)


ggplot(data, aes(sample = Rape)) +
  stat_qq()+
  stat_qq_line()


#e)
library(apaTables)

table <- apa.cor.table(data)

t.test(data$Assault, mu = 6.5, alternative = "greater")


#f)
library(lsr)

cohensD(USArrests$Murder, mu = 6.5)


plot(USArrests$Murder, USArrests$Assault, xlab = "Anzahl der Morde", ylab = "Anzahl der Angriffe")

regression_model <- lm(Assault ~ Murder, data = USArrests)

abline(regression_model, col = "red")


cat("Regressionsergebnisse:\n")

summary(regression_model)
