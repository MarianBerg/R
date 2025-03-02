library(tidyverse)
library(ggplot2)

#Erstelle und interpretiere verschiedene Diagramme in R 
#basierend auf dem in R verfügbaren Datensatz "airquality".

#a) Erstelle ein Streudiagramm (Scatterplot) für die Temperatur (Temp) gegenüber der Ozonkonzentration (Ozone) und färben Sie die Punkte nach dem Monat (Month). Interpretieren Sie das Ergebnis.

View(airquality)
data <- as.data.frame(airquality)

ggplot(data, aes(x = Temp, y = Ozone, color = Month)) +
  geom_point()

#Es scheint einen naehrungsweise linearen Zusammenhang zwischen Temperatur und
#Ozonwerten zu geben. Desweiteren scheinen die Monate 7 und 8 einen steigenderen
#Einfluss auf die Ozonwerte zu haben, wenn es auch einige Ausreisser gibt.



#b) Erstelle ein Balkendiagramm für die durchschnittliche Ozonkonzentration (Ozone) 
#für jeden Monat. Interpretieren Sie das Ergebnis.
ozone_average_per_month <- data %>% 
  group_by(Month) %>%
  summarize(Average_ozone = mean(Ozone, na.rm = TRUE))


ggplot(ozone_average_per_month, aes(x = factor(Month), y = Average_ozone)) +
  geom_bar(stat = "identity") +
  coord_flip()+
  labs(title = "Monatliche Ozonkonzentration",
       x = "Monat",
       y = "Durchschnittliche Ozonkonzentration") +
  theme(plot.title = element_text(hjust = 0.5))
#Die Monate 7 und 8 scheinen die hoechste Ozonkonzentration zu haben.




#c) Erstelle einen Boxplot für die Temperatur (Temp) 
#für jeden Monat. Interpretieren Sie das Ergebnis.

ggplot(data, aes(x = factor(Month), y = Temp)) +
  geom_boxplot() +
  stat_boxplot(geom = "errorbar") +
  labs(title = "Boxplot Temperatur im Monat",
       x = "Monat",
       y = "Temperatur") +
  theme_classic()
  
#Die Daten scheinen einer Parabel mit dem Hoehepunkt bei Monat 7 zu folgen. Wobei
# die Streuung in diesem Monat auch am geringsten ist. Auch gibt es eine nicht
# unbedeutende Menge an Jahren in denen der 8 Monat der heisseste ist.

