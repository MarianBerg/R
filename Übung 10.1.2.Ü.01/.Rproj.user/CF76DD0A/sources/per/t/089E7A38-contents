library(rcompanion)

#c) Berechne die Effektgröße r für den Wilcoxon-Test. 
#Erkläre dein Vorgehen und interpretiere das Ergebnis.

r_effect_size <- wilcoxonPairedR(Orthodont$distance, Orthodont$age)

r_effect_size

#Verwende die Funktionen wilcox.test() und wilcoxonPairedR() aus dem rcompanion-Paket, 
#um den Wilcoxon-Test und die Effektgröße zu berechnen.
data <- as_tibble(Orthodont)


age_8 <- data %>% filter(age == 8) %>%
  pull(distance)

age_14 <- data %>% filter(age == 14) %>%
  pull(distance)

differences <- age_8 - age_14

shapiro.test(differences)

#d) Prüfe, ob es noch ein anderes Verfahren gibt, das sich eventuell besser eignet. 
#Prüfe ob die Voraussetzungen erfüllt sind. 

qqnorm(differences, main = "QQ-Plot der Differenzen")

qqline(differences, col = "red", lwd = 2)

hist(differences, main = "Histogramm der Differenzen", xlab = "Differenzen", ylab = "Häufigkeit", breaks = "FD", col = "lightblue", border = "black", freq = FALSE)

curve(dnorm(x, mean(differences), sd(differences)), add = TRUE, col = "red", lwd = 2, from = min(differences), to = max(differences))
