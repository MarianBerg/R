# Aufgabe a) 
# Laden des Datensatzes
data(HairEyeColor, package = "datasets")

# Erste sechs Zeilen anzeigen
head(HairEyeColor)

# Zusammenfassung der Daten
summary(HairEyeColor)

# Berechnung der absoluten Häufigkeiten der Haarfarben
hair_freq <- margin.table(HairEyeColor, margin = 1)
hair_freq

# Aufgabe c) 
# Beobachtete Häufigkeiten
obs <- hair_freq

# Erwartete Häufigkeiten (Gleichverteilung)
exp <- c(1/4,1/4,1/4,1/4)

# Durchführung des Chi2-Anpassungstests
test_result <- chisq.test(obs, p = exp)
test_result

# Aufgabe d) 
# Neue hypothetische Verteilung (angenommene Proportionen)
new_exp <- c(0.2, 0.5, 0.1, 0.2)

# Durchführung des Chi2-Anpassungstests mit der neuen Verteilung
new_test_result <- chisq.test(obs, p = new_exp)
new_test_result
