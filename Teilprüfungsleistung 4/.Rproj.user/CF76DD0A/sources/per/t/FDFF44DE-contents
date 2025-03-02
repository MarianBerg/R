library(nlme)
library(tidyverse)
library(ggplot2)


#Der Orthodent-Datensatz enthält Daten über die Veränderung einer kieferorthopädischen 
#Messung im Laufe der Zeit für mehrere junge Probanden. 
#Forscher der University of North Carolina Dental School verfolgten das Wachstum 
#von 27 Kindern (16 Männer, 11 Frauen) vom Alter von 8 bis 14 Jahren. 
#Alle zwei Jahre maßen sie den Abstand zwischen der Hypophyse und der Pterygomaxillarspalte, 
#zwei Punkten, die auf Röntgenaufnahmen der Kopfseite leicht zu erkennen sind.
#
#a) Deskriptive Analyse der Daten
#
#Verwende den Orthodont-Datensatz aus dem nlme-Paket und führe eine deskriptive 
#Analyse der Daten durch. Berechne den Mittelwert und die Standardabweichung der 
#Wiederholungen je Zeitpunkt und erstelle Boxplots zur Visualisierung der Verteilung. 
#Interpretiere und erkläre die Ergebnisse. 

data <- as_tibble(Orthodont)

results <- data %>% 
  group_by(age) %>%
  summarize(means_distance = mean(distance), sd_distance = sd(distance))

results

data %>% ggplot() +
  geom_boxplot(aes(x = as_factor(age), y = distance))

#Der Mittelwert wird mit zunehmendem Alter groesser was zu erwarten ist, da die Kinder
#wachsen.




#b) Überprüfung der Voraussetzungen
#
#Überprüfe die Voraussetzungen für eine ANOVA mit Messwiederholungen. 
#Dazu gehören das Fehlen von Ausreißern, die Normalverteilung innerhalb jedes
#Messzeitpunkts und die Sphärizität. 
#Interpretiere die Ergebnisse. 

library(rstatix)

data %>% group_by(age) %>%
  identify_outliers(distance)
#Es existieren zwar outlier, keiner von ihnen wird aber als extrem eingeordnet.


#Es erfolgt Pruefung auf Normalverteilung innerhalb jedes Messzeitpunktes.

library(ggpubr)
data %>% ggqqplot("distance", facet.by = "age")
#Von kleineren outliern abgesehen, scheint die Forderung der Normalverteilung, 
#innerhalb der Messzeitpunkte erfuellt zu sein.


#Spherizitaet:
rep_anova <- anova_test(data = data, dv = distance, wid = Subject,
                       within = age, effect.size = "pes")

rep_anova$`Mauchly's Test for Sphericity`
#Die Nullhypothese der Spaerizitaet kann mit 0.233 > 0.05 nicht abgelehnt werden
#und wird damit als erfuellt angesehen.


#c) Durchführung der ANOVA mit Messwiederholungen
#
#Führe eine ANOVA mit Messwiederholungen durch und interpretiere die Ergebnisse. 
#Prüfe, ob Unterschiede zwischen den Messzeitpunkten bestehen und führe gegebenenfalls Post-hoc-Tests durch. 
#Interpretiere die Ergebnisse. 

get_anova_table(rep_anova)
#Anhand des p-Wertes von 2.99e-15, muss die Nullhypothese, dass kein Unterschied zwischen
#Messzeitpunkten besteht verworfen werden. Damit bestehen Unterschiede und Post-hoc-Tests sind angebracht.


data %>%
  pairwise_t_test(distance~age, paired = TRUE,
                  p.adjust.method = "bonferroni") %>%
  as.data.frame()
#Anhand der adjustierten p-Werte ist ersichtlich das abgesehen von den Gruppen 8 und 10,
#zwischen den Gruppen signifikante Unterschiede bestehen da p < 0.05.


#Untersuchung der Effektstaerke:
data %>%
  cohens_d(distance~age, paired = TRUE) %>%
  as.data.frame()
#Abermals abgesehen vom insignifikanten Effekt zwischen den Messzeitpunkten 8 und 10,
#und dem moderaten Effekt zwischen 10 und 12, sind alle anderen Effekte als stark eingeordnet.
#Damit laesst sich wohl sagen das Alter einen erheblichen Einfluss auf die Kiefergroesse von
#Kindern hat.


