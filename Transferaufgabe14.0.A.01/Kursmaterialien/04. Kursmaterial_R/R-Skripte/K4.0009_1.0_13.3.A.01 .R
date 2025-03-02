data(ToothGrowth)
str(ToothGrowth)

plot(ToothGrowth$dose, ToothGrowth$len,
     main = "Streudiagramm von Länge der Zahnwachstumsrate und Dosis von Vitamin C",
     xlab = "Dosis in Vitamin C",
     ylab = "Länge der Zahnwachstumsrate")

correlation_test <- cor.test(ToothGrowth$len, ToothGrowth$dose, method = "kendall")
correlation_test

library(DescTools)
kendall_tau_b <- KendallTauB(ToothGrowth$len, ToothGrowth$dose, conf.level = 0.95)
kendall_tau_b
