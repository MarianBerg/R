# Übung a)
# Schritt 1: Lade den Datensatz HairEyeColor und konvertiere ihn in einen Dataframe
data(HairEyeColor)
hair_eye_data <- as.data.frame(HairEyeColor)
View(hair_eye_data)

# Schritt 2.1: Erstelle Dummy-Variablen für Haarfarben
hair_eye_data$Black_Hair <- ifelse(hair_eye_data$Hair == "Black", 1, 0)
hair_eye_data$Brown_Hair <- ifelse(hair_eye_data$Hair == "Brown", 1, 0)
hair_eye_data$Red_Hair <- ifelse(hair_eye_data$Hair == "Red", 1, 0)
hair_eye_data$Blonde_Hair <- ifelse(hair_eye_data$Hair == "Blond", 1, 0)

# Schritt 2.2: Erstelle Dummy-Variablen für Augenfarben
hair_eye_data$Blue_Eyes <- ifelse(hair_eye_data$Eye == "Blue", 1, 0)
hair_eye_data$Brown_Eyes <- ifelse(hair_eye_data$Eye == "Brown", 1, 0)
hair_eye_data$Green_Eyes <- ifelse(hair_eye_data$Eye == "Green", 1, 0)
hair_eye_data$Hazel_Eyes <- ifelse(hair_eye_data$Eye == "Hazel", 1, 0)

# Schritt 2.3: Erstelle Dummy-Variablen für Geschlecht
hair_eye_data$Male <- ifelse(hair_eye_data$Sex == "Male", 1, 0)
hair_eye_data$Female <- ifelse(hair_eye_data$Sex == "Female", 1, 0)

# Schritt 3: Erstelle eine Kreuztabelle, um die Häufigkeiten der Kombinationen von Haarfarbe, Augenfarbe und Geschlecht zu untersuchen
crosstab <- xtabs(Freq ~ Hair + Eye + Sex, data = hair_eye_data)
print(crosstab)


# Übung b) 
# Schritt 1: Untersuchung des Datensatz "attitude"
data(attitude)
head(attitude)
summary(attitude)

#	Schritt 2: Überprüfung der internen Konsistenz
install.packages("psych")
library(psych)

cronbach_alpha <- alpha(attitude)
cronbach_alpha

# Schritt 3: Identifikation und Inverscodierung von Items
# Berechnen der Korrelationsmatrix
correlations <- cor(attitude)
print(correlations)

# Schritt 4: 4.	Skalenbildung: 
attitude$scale <- rowMeans(subset(attitude, select = c(rating, complaints, privileges, learning, raises, critical, advance)), na.rm = TRUE)




