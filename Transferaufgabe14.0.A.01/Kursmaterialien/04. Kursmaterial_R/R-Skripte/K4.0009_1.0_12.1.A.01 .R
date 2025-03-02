# 1. Laden des Datensatzes
daten <- read.csv("Persönlichkeit_Treue.csv")

# 2. Deskriptive Statistiken und Häufigkeiten
summary(factor(daten$Alter, levels = c(2, 3, 4, 5, 7), labels = c("18-24", "25-34", "35-44", "45-59", "60+")))
summary(factor(daten$Geschlecht, levels = c(1, 2), labels = c("männlich", "weiblich")))
summary(factor(daten$Beziehungsstatus, levels = c(1, 2, 3, 4, 5, 6), labels = c("Single", "Feste Beziehung (gemeinsamer Haushalt)", "Feste Beziehung (getrennter Haushalt)", "Verheiratet", "Offene Beziehung/Polygam/Polyamor", "Sonstiges")))

# 3. Häufigkeiten von untreuem Verhalten
untreue_verhalten <- daten[, c("Flirten", "Hingezogen", "sexuellhingezogen", "verliebt", "Kuss", "sexuellerKontakt", "Affäre")]

# Absolute Häufigkeiten von untreuem Verhalten
abs_haeufigkeiten <- apply(untreue_verhalten, 2, table)
abs_haeufigkeiten

# Relative Häufigkeiten von untreuem Verhalten
rel_haeufigkeiten <- apply(untreue_verhalten, 2, function(x) table(x)/length(x))
rel_haeufigkeiten

# 4. Zusammenhänge zwischen Persönlichkeitsfaktoren
# Installieren und laden Sie das apaTables-Paket
if (!requireNamespace("apaTables", quietly = TRUE)) {
  install.packages("apaTables")
}
library(apaTables)

# Berechnen der APA-Korrelationsmatrix
apa_korrelationsmatrix <- apa.cor.table(
  daten[, c("Neurotizismus", "Extraversion", "Offenheit_für_Erfahrungen", "Verträglichkeit", "Gewissenhaftigkeit", "Sensation_Seeking")],
  landscape = TRUE
)

print(apa_korrelationsmatrix)

# Ausgabe der APA-Korrelationsmatrix
print(apa_korrelationsmatrix)




