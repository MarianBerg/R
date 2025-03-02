# Lade Pakete und Datensatz
install.packages("nlme")
library(nlme)
data(Orthodont)

# Deskriptive Statistiken
summary(Orthodont$distance)

# Boxplot
boxplot(distance ~ age, data = Orthodont, main = "Orthodont Messwerte an verschiedenen Zeitpunkten", xlab = "Alter", ylab = "Distanz")

# Daten aufbereiten
Orthodont$Subject <- factor(Orthodont$Subject)
Orthodont_wide <- reshape(Orthodont, idvar = "Subject", timevar = "age", direction = "wide")

# Wilcoxon-Test
result <- wilcox.test(Orthodont_wide$distance.8, Orthodont_wide$distance.14, paired = TRUE, exact = FALSE, conf.int = TRUE)
result

# Lade rcompanion-Paket
library(rcompanion)

# Berechne Effektgröße r
r_effect_size <- wilcoxonPairedR(Orthodont$distance, Orthodont$age)
r_effect_size

# Prüfe Normalverteilung der Differenzen
differences <- Orthodont_wide$distance.8 - Orthodont_wide$distance.14
shapiro.test(differences)

# Erstelle QQ-Plot
qqnorm(differences, main = "QQ-Plot der Differenzen")
qqline(differences, col = "red", lwd = 2)

hist(differences, main = "Histogramm der Differenzen", xlab = "Differenzen", ylab = "Häufigkeit", breaks = "FD", col = "lightblue", border = "black", freq = FALSE)
curve(dnorm(x, mean(differences), sd(differences)), add = TRUE, col = "red", lwd = 2, from = min(differences), to = max(differences))

# t-test
t_test_result <- t.test(Orthodont_wide$distance.8, Orthodont_wide$distance.14, paired = TRUE)
t_test_result

# Berechne Cohen's d
cohen_d <- mean(differences) / sd(differences)
cohen_d

