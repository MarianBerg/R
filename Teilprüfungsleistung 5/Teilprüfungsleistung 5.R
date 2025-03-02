#Aufgabe: Kendall-Tau r
library(tidyverse)

#a) Lade den Datensatz "ToothGrowth" aus R. 
#Dieser Datensatz enthält Informationen über die Zahnwachstumsrate von Meerschweinchen, 
#die verschiedenen Dosen von Vitamin C erhalten haben. Untersuche die Struktur des Datensatzes mit der Funktion "str()".

data <- as_tibble(ToothGrowth)
str(data)

#b) Erstelle ein Streudiagramm der Variablen "len" (Länge der Zahnwachstumsrate) und "dose" (Dosis von Vitamin C). 
#Beachte dabei eventuelle Hebelwirkungen.

ggplot(data, aes(x = dose, y = len)) +
  geom_point(size = 3) +
  labs(x = "Dosis", y = "Länge" )

#Es scheint eine Korrelation zwischen den groessen zu geben. Hebelwirkungen sind aufgrund der auf nur 3 Werten bei der Dosis stark 
#vertreten. Daher ist ein robustes Korrelationsmass wie Kendall-Tau zu empfehlen.


#c) Berechne den Kendall-Tau-Korrelationskoeffizienten (Variante b) zwischen den Variablen "len" und "dose" 
#mit der Funktion "cor.test()". Führe auch einen Hypothesentest durch, um zu überprüfen, 
#ob die Korrelation statistisch signifikant ist.

cor.test(data$len, data$dose, method = "kendall")
#Es gilt p-value = 7.896e-12, damit ist er weitaus kleiner als 0.05 und damit wird die Nullhypothese abgelehnt 
#und eine statistische signifikante Korrelation von tau = 0.6959839 liegt vor.



#d) Berechne das 95%-Konfidenzintervall für den Kendall-Tau-Korrelationskoeffizienten 
#mit der Funktion "KendallTauB()" aus dem DescTools-Paket. Interpretiere die Ergebnisse. 
library(DescTools)

KendallTauB(data$len, data$dose, conf.level = 0.95)

#Es liegt also eine statistisch signifikante Korrelation von 0.6959839 in einem Konfidenzintervall von 95% in [0.62 0.77] vor. Die Korrelation
#liegt also mit einer wahrscheinlichkeit von 95% zwischen 0.62 und 0.77. 
