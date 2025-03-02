# Aufgabe a) 
# Laden des Datensatzes
data(ChickWeight, package = "datasets")

# Erste sechs Zeilen anzeigen
head(ChickWeight)

# Zusammenfassung der Daten
summary(ChickWeight)

# Median des Küken-Gewichts berechnen
median_chickweight <- median(ChickWeight$weight)
median_chickweight

# Aufgabe b) 
# Boxplot erstellen
boxplot(ChickWeight$weight, main = "Boxplot of Chick Weight", ylab = "Weight (g)")

# Aufgabe c) 
# Filtern des Datensatzes auf Futtertyp 1
chick_diet1 <- ChickWeight[ChickWeight$Diet == 1, ]

# Aufgabe d) 
# Konvertieren des Gewichts in ordinalskalierte Variable
chick_diet1$ordinal_weight <- cut(chick_diet1$weight, 
                                  breaks = c(-Inf, 50, 100, 150, Inf), 
                                  labels = c("1", "2", "3", "4"), 
                                  ordered_result = TRUE)

# Konvertieren Sie die ordinalen Gewichtskategorien in numerische Werte
chick_diet1$ordinal_weight_numeric <- as.numeric(as.character(chick_diet1$ordinal_weight))

# Anzeigen der ersten Zeilen des aktualisierten Datensatzes
head(chick_diet1)


# Aufgabe e) 

# Durchführen des Einstichproben-Wilcoxon-Tests
test_result <- wilcox.test(chick_diet1$ordinal_weight_numeric, mu = 2)

# Testergebnis anzeigen
test_result

# Einseitiger t-test
test_result2 <- wilcox.test(chick_diet1$ordinal_weight_numeric, mu = 2, alternative = "greater")
test_result2

# Aufgabe f) 
# Effektstärke 
install.packages("rcompanion")
library(rcompanion)
wilcoxonOneSampleR(x = chick_diet1$ordinal_weight_numeric, mu  = 2)



