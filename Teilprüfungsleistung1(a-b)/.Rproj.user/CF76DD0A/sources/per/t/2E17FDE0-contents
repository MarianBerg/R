#Aufgabe: Datenmanagement in R
#
#a) Es liegen zwei Datensätze mit Informationen über Spotify Songs vor. Der erste Datensatz „Spotify music_data1.xls“ enthält Informationen zu den Songtiteln und den Künstlern. Der zweite Datensatz „Spotify music_data2.xls“ enthält Informationen zu den Charaktereigenschaften der Songs. Importiere beide Datensätze mithilfe eines Codes in R und speichere sie in einem Data Frame mit dem Namen „spotify1“ und „spotify2“. 
#
#Praxistipp
#
#
#Stelle sicher, dass das richtige Arbeitsverzeichnis angeben ist, damit R den Datensatz korrekt laden kann.
#
#
#
#
#
#
#b) Füge die Datensätze mit dem richtigen Befehl zum Datensatz "spotify_gesamt" zusammen.
#

install.packages("readxl")
library(readxl)
install.packages("tidyverse")
library(tidyverse)



#setwd("G:/Programming/Projekte/Fortbildung/R/Teilprüfungsleistung1(a-b)")
#a) Daten laden 

spotify1 <- read_excel("Spotify music_data1.xlsx")
summary(spotify1)

spotify2 <- read_excel("Spotify music_data2.xlsx")
summary(spotify2)

#b) und c) Daten zusammenfuehren: Die beiden Dataframes haben die selbe Anzahl an Zeilen,
#aber ungleiche Spalten, abgesehen von "track_number" daher ist ein zusammenfuehren
#der Spalten anhand von "track_number" mit der merge() funktion hier sinnvoll.
spotify_gesamt <- merge(spotify1, spotify2, by = "track_number")
summary(spotify_gesamt)

#d) Als nächstes sollen verschiedene Teildatensätze erstellt werden: 

  
#Erstelle einen Datensatz, der die Track-Nummer enthält sowie folgende Eigenschaften:
#acousticness, instrumentalness, liveness, loudness, speechiness. Nenne diesen Datensatz music1.

music1 <- spotify_gesamt %>%
  select(track_number, acousticness, instrumentalness, liveness, loudness, speechiness)
summary(music1)

#Erstelle einen Datensatz, der nur Songs von Britney Spears oder Katy Perry beinhaltet. 
#Nenne diesen Datensatz music2.
music2 <- spotify_gesamt %>%
  filter(artist == "Britney Spears" | artist == "Katy Perry")
summary(music2)

#Erstelle einen Datensatz, der nur Songs enthält, 
#die eine größere danceability haben als 0,6. Nenne diesen Datensatz music3. 
music3 <- spotify_gesamt %>% 
  filter(danceability > 0.6)
summary(music3)

#Lasse dir nun einen Datensatz ausgeben, 
#der die Track-Nummer, die danceability, duration_ms, liveness und loudness 
#der Band WALK THE MOON anzeigt. Nenne diesen Datensatz music4. 
music4 <- spotify_gesamt %>%
  filter(artist == "WALK THE MOON") %>% 
  select(track_number,danceability, duration_ms, liveness, loudness)



#Nun soll dem Datensatz music4 noch eine Variable hinzugefügt werden: 
#Die Variablen liveness und loudness sollen miteinander multipliziert werden.
music4 <- music4 %>%
  mutate(live_times_loudness = liveness * loudness)
summary(music4)


#e) In dem Datensatz „spotify_gesamt“ sollen fehlende Werte identifiziert und 
#ausgeschlossen werden. 
#Dabei soll nur ein Subset der relevanten Variablen erstellt werden, 
#um die Analyse nicht durch fehlende Werte in nicht relevanten Variablen zu beeinträchtigen.

#Identifiziere die Anzahl fehlender Werte in jeder Variable des Datensatzes spotify_gesamt.
count_missing_values <- spotify_gesamt %>%
  summarize_all(~sum(is.na(.)))
print(count_missing_values) 
#Scheint nur ein Artist eintrag zu fehlen, die entsprechende Zeile wird entfernt.

spotify_gesamt <- spotify_gesamt %>%
  drop_na()


#f) Der vorhandene Datensatz "spotify_gesamt" soll nun in drei verschiedene Dateiformate 
#exportiert werden: CSV, TXT und XLS. 

#Exportieren Sie den Datensatz "spotify_gesamt" in eine CSV-Datei und nennen Sie die Datei "spotify_gesamt.csv".
write_csv(spotify_gesamt, "spotify_gesamt.csv")

#Exportieren Sie den Datensatz "spotify_gesamt" in eine TXT-Datei. Nennen Sie die Datei "spotify_gesamt.txt".
write_delim(spotify_gesamt, "spotify_gesamt.txt", delim = "\t")

#Exportieren Sie den Datensatz "spotify_gesamt" in eine XLS-Datei und nennen Sie die Datei "spotify_gesamt.xlsx".
library(writexl)
write_xlsx(spotify_gesamt, "spotify_gesamt.xlsx")
