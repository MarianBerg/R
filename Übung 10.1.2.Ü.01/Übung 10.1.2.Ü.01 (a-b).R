library(nlme)
library(tidyverse)
library(ggplot2)


#Der Orthodent-Datensatz enthält Daten über die Veränderung einer kieferorthopädischen Messung im Laufe der Zeit 
#für mehrere junge Probanden. Forscher der University of North Carolina Dental School verfolgten das Wachstum 
#von 27 Kindern (16 Männer, 11 Frauen) vom Alter von 8 bis 14 Jahren. 
#Alle zwei Jahre maßen sie den Abstand zwischen der Hypophyse und der Pterygomaxillarspalte, 
#zwei Punkten, die auf Röntgenaufnahmen der Kopfseite leicht zu erkennen sind.

#a) Lade den Datensatz Orthodent aus dem nlme-Paket und berechne die deskriptiven 
#Statistiken für die Messwerte an den verschiedenen Zeitpunkten. 
#Erstelle zudem einen Boxplot der Messwerte an den verschiedenen Zeitpunkten. 
#Erkläre dein Vorgehen und interpretiere die Ergebnisse. 

data <- as_tibble(Orthodont)

grouped_by_age <- data %>% group_by(age)

grouped_by_age %>% ggplot() +
  geom_boxplot(aes(x = as_factor(age), y = distance))


#b) Führe den Wilcoxon-Test für abhängige Stichproben durch, um festzustellen, 
#ob sich die Messwerte an den Zeitpunkten 8 Jahre und 14 Jahre signifikant unterscheiden.
#Erkläre dein Vorgehen und interpretiere die Ergebnisse.


age_8 <- data %>% filter(age == 8) %>%
  pull(distance)

age_14 <- data %>% filter(age == 14) %>%
  pull(distance)

result <- wilcox.test(age_8, age_14, paired = TRUE, exact = FALSE, conf.int = TRUE)

result
