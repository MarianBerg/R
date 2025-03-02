data(airquality)

# Pakete installieren und laden
install.packages("corrplot")
install.packages("dplyr")
library(corrplot)
library(dplyr)

# Datensatz vorbereiten
data(airquality)
df.korrelation <- airquality %>% select(Ozone, Solar.R, Wind, Temp)

# Korrelationsmatrix berechnen
matrix.korrelation <- cor(df.korrelation, use = "complete.obs", method = "pearson")
matrix.korrelation

# Korrelationsdiagramm erstellen
corrplot(matrix.korrelation, method = "circle", cl.pos = "b", type = "upper", tl.col = "black")

