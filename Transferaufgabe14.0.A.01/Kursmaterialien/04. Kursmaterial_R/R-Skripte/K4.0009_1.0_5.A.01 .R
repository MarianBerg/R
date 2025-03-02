# Laden des Datensatzes 
data("mtcars")

# Aufgabe a)
# 1) Absolute, relative und kumulierte relative Häufigkeiten für cyl
abs_haef_cyl <- table(mtcars$cyl)
abs_haef_cyl

rel_haef_cyl <- round(prop.table(abs_haef_cyl) * 100, 2)
rel_haef_cyl

kum_rel_haef_cyl <- round(cumsum(prop.table(abs_haef_cyl) * 100), 2)
kum_rel_haef_cyl

# 2) Absolute, relative und kumulierte relative Häufigkeiten für am
absabs_haef_am <- table(mtcars$am)
absabs_haef_am

rel_haef_am <- round(prop.table(abs_haef_am) * 100, 2)
rel_haef_am

kum_rel_haef_am <- round(cumsum(prop.table(abs_haef_am) * 100), 2)
kum_rel_haef_am

# 3) Absolute, relative und kumulierte relative Häufigkeiten für vs
abs_haef_vs <- table(mtcars$vs)
abs_haef_vs

rel_haef_vs <- round(prop.table(abs_haef_vs) * 100, 2)
rel_haef_vs

kum_rel_haef_vs <- round(cumsum(prop.table(abs_haef_vs) * 100), 2)
kum_rel_haef_vs

# 4) Übersichtstabellen
uebersicht_tabelle_cyl <- cbind(abs_haef_cyl, rel_haef_cyl, kum_rel_haef_cyl)
uebersicht_tabelle_cyl

uebersicht_tabelle_am <- cbind(abs_haef_am, rel_haef_am, kum_rel_haef_am)
uebersicht_tabelle_am

uebersicht_tabelle_vs <- cbind(abs_haef_vs, rel_haef_vs, kum_rel_haef_vs)
uebersicht_tabelle_vs

#Aufgabe b) 
library(datasets)
data(mtcars)

# Mittelwert
mean_mpg <- mean(mtcars$mpg)
cat("Mittelwert: ", mean_mpg, "\n")

# Median
median_mpg <- median(mtcars$mpg)
cat("Median: ", median_mpg, "\n")

# Modus
mode_mpg <- as.numeric(names(sort(-table(mtcars$mpg)))[1])
cat("Modus: ", mode_mpg, "\n")

# Quantile
quantiles_mpg <- quantile(mtcars$mpg)
cat("Quantile: \n")
print(quantiles_mpg)

#Aufgabe c) 
# Standardabweichung
standardabweichung <- sd(mtcars$mpg)
print(standardabweichung)

# Varianz
varianz <- var(mtcars$mpg)
print(varianz)

# Variationskoeffizient
variationskoeffizient <- sd(mtcars$mpg) / mean(mtcars$mpg)
print(variationskoeffizient)

# Spannweite
spannweite <- diff(range(mtcars$mpg))
print(spannweite)

# Interquartilsrange
interquartilsabstand <- IQR(mtcars$mpg)
print(interquartilsabstand)


# Aufgabe d) 
# Installieren und Laden des psych-Pakets
install.packages("psych")
library(psych)

# Berechnung der Schiefe und Kurtosis für die Variablen "mpg" und "hp"
descriptive_stats <- describe(mtcars[, c("mpg", "hp")])

# Ergebnisse anzeigen
print(descriptive_stats[, c("skew", "kurtosis")])

