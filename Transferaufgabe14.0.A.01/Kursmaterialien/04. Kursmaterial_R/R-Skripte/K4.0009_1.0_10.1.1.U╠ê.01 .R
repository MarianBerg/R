# Lade das 'datasets'-Paket und den 'sleep'-Datensatz
library(datasets)
data(sleep)

# Teile den Datensatz nach Gruppen auf
time1 <- sleep$extra[sleep$group == 1]
time2 <- sleep$extra[sleep$group == 2]

# Berechne die Mittelwert und Standardabweichung für die beiden Messzeitpunkte
mean(time1)
sd(time1)
mean(time2)
sd(time2)

# Berechne die Differenzen
sleep$difference <- time1 - time2

# Erstelle einen QQ-Plot zur Überprüfung der Normalverteilung der Differenzen
library(ggplot2)
ggplot(sleep, aes(sample = difference)) + geom_qq() + geom_qq_line() + labs(title = "QQ-Plot der Differenzen")

# Führe den t-Test für abhängige Stichproben durch
t_test <- t.test(time1, time2, paired = TRUE)
t_test

#Effektstärke 
library(lsr)
cohen_d <- cohensD(time1, time2, method = "paired")
cohen_d
