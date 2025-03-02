# Laden des Datensatzes "wine"
install.packages("rattle")
data(wine, package = "rattle")

# Deskriptive Statistik 
str(wine)
summary(wine)

# Voraussetzungen prüfen 
install.packages("rms")
library(rms)

m <- ols(Type ~ Alcohol + Magnesium + Color, data = wine)
vif(m)

# ordinal logistische Regression
omodel <- orm(Type ~ Alcohol + Magnesium + Color, data = wine, x = TRUE, y = TRUE)
omodel

# Odds-Ratio
round(exp(coef(omodel)),3)
