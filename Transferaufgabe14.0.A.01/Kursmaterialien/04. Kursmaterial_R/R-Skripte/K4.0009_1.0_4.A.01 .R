#Arbeitsverzeichnis festlegen 
setwd("/Users/sarahkulchen/Documents/FREELANCING/03_future.self & VelpTEC/05_Kurserstellung_R/Datensätze")

#Datensätze hochladen
install.packages("readxl")
library(readxl)

spotify1 <- read_excel("Spotify music_data1.xlsx")
spotify2 <- read_excel("Spotify music_data2.xlsx")

#Datensätze zusammenführen 
spotify_gesamt <- merge(spotify1, spotify2, by = "track_number")

View(spotify_gesamt) 
summary(spotify_gesamt)

#Erstellung von Teildatensätzen 
install.packages("dplyr")
library(dplyr)

music1 <- subset(spotify_gesamt, select = c(track_number, acousticness, instrumentalness, liveness, loudness, speechiness))
music2 <- subset(spotify_gesamt, artist == "Britney Spears" |
                   artist == "Katy Perry")
music3<- subset(spotify_gesamt, danceability > 0.6)
music4 <- subset(spotify_gesamt, (artist == "WALK THE MOON"),
                 select = c(track_number, danceability, duration_ms, liveness, loudness))
music4$Multiplied <- music4$liveness*music4$loudness

# Exportieren als CSV-Datei
write.csv(spotify_gesamt, "spotify_gesamt.csv")

# Exportieren als TXT-Datei
write.table(spotify_gesamt, "spotify_gesamt.txt", dec = ",", sep = "\t")

# Installieren und Laden des openxlsx-Pakets
install.packages("openxlsx")
library(openxlsx)

# Exportieren als XLS-Datei
write.xlsx(spotify_gesamt, file = "spotify_gesamt.xlsx", overwrite = TRUE, asTable = TRUE, sheetName = "Spotify Daten")

#Fehelende Werte ausschließen 
missing_values <- colSums(is.na(spotify_gesamt))
print(missing_values)

spotify_gesamt.t_test <- na.omit(subset (spotify_gesamt, select = c(artist,
                                                energy)))

