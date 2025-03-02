#Aufgabe a) 
# Lade das "datasets"-Paket
library(datasets)

# Aufgabe 1. 
# Erstelle ein Liniendiagramm, das den UK-Gasverbrauch über die Zeit darstellt
plot(UKgas, type = "l", xlab = "Zeit", ylab = "UK Gasverbrauch")

# Aufgabe 2. 
# Passe die Achsenbeschriftungen und das Diagramm an, um die Lesbarkeit zu verbessern
plot(UKgas, type = "l", xlab = "Zeit", ylab = "UK Gasverbrauch",
     main = "UK Gasverbrauch über die Zeit",
     col = "blue", lwd = 2)

# Aufgabe 3.
# Fügen Sie dem Diagramm eine Legende hinzu
legend("topright", legend = "UK Gasverbrauch", col = "blue", lty = 1, lwd = 2)


#Aufgabe b) 
# Berechne den gleitenden Jahresdurchschnitt für Unfalltodesfälle
moving_average <- filter(USAccDeaths, rep(1/12, 12), sides = 1)

# Aufgabe 1.
# Erstelle ein Liniendiagramm für Unfalltodesfälle und gleitenden Jahresdurchschnitt
plot(USAccDeaths, type = "l", xlab = "Zeit", ylab = "Anzahl der Unfalltodesfälle",
     main = "Unfalltodesfälle und gleitender Jahresdurchschnitt", col = "blue", lwd = 2, ylim = c(7000, 12000))
lines(moving_average, col = "darkred", lty = 2, lwd = 2)

# Aufgabe 2.
# Passe die Achsenbeschriftungen und das Diagramm an, um die Lesbarkeit zu verbessern
axis(1, at = seq(1, length(USAccDeaths), 12), labels = 1973:1978)
grid(nx = NULL, ny = NULL, col = "gray", lty = "dotted")

# Aufgabe 3. 
# Füge dem Diagramm eine Legende hinzu
legend("topright", legend = c("Unfalltodesfälle", "Gleitender Jahresdurchschnitt"),
       col = c("blue", "darkred"), lty = c(1, 2), lwd = 2)
