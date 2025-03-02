# Datensatz laden
data(mtcars)

# Kreuztabelle erstellen
ct <- table(mtcars$am, mtcars$cyl)
print(ct)

# Pearson-Korrelation berechnen
correlation <- cor(mtcars$mpg, mtcars$hp, method = "pearson")
print(correlation)

