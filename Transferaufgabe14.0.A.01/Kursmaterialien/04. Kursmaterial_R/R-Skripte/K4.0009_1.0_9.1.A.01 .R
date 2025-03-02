# Aufgabe a) 
data(USArrests)
summary(USArrests)

# Aufgabe b) 
hist(USArrests$UrbanPop)
hist(USArrests$Assault)
hist(USArrests$Murder)
hist(USArrests$Rape)

qqnorm(USArrests$UrbanPop)
qqline(USArrests$UrbanPop)

qqnorm(USArrests$Assault)
qqline(USArrests$Assault)

qqnorm(USArrests$Murder)
qqline(USArrests$Murder)

qqnorm(USArrests$Rape)
qqline(USArrests$Rape)

# Aufgabe c) 
install.packages("apaTables")
library(apaTables)

apa.cor.table(USArrests,
              table.number = 1)

# Aufgabe d) 
t_result <- t.test(USArrests$Murder, mu = 6.5, alternative = c("greater"))
cat("Ergebnis des t-Tests für Murder:\n")
print(t_result)

# Aufgabe e) 
install.packages("lsr")
library(lsr)
cohensD(USArrests$Murder, mu = 6.5)

# Aufgabe f) 
plot(USArrests$Murder, USArrests$Assault, xlab = "Anzahl der Morde", ylab = "Anzahl der Angriffe")
regression_model <- lm(Assault ~ Murder, data = USArrests)
abline(regression_model, col = "red")

cat("Regressionsergebnisse:\n")
summary(regression_model)
