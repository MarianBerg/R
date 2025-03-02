
#Aufgabe: Liniendiagramme mit ggplot2
#
#a) 
#
#Erstelle ein Liniendiagramm mit ggplot2 in R unter Verwendung des Datensatzes „airquality“. 
#
#1. Lade den Datensatz "airquality" und bereinige fehlende Werte.
library(ggplot2)
library(tidyverse)

cleaned_up_airquality_df <- airquality %>% 
  as_tibble() %>% 
  drop_na()


#
#2. Erstelle ein einfaches Liniendiagramm mit ggplot2, das den Verlauf der Ozonkonzentration im Laufe der Tage darstellt.
#3. Passe das Diagramm an, indem du eine gestrichelte Linie, Datenpunkte und Achsenbeschriftungen hinzufügst.
#
ggplot(data = cleaned_up_airquality_df, aes(x = Day, y = Ozone, color = as.factor(Month), group = Month)) +
  geom_line(linetype = 2, size = 1) +
  geom_point() +
  labs(title = "Ozonkonzentration in den Monaten 5 bis 9",
         x = "Tage",
         y = "Ozonkonzentration",
         color = "Monate") +
  theme_classic()
#
#4. Passe die x-Achsenbeschriftung an, indem du das Hauptgitter und das Hilfsgitter anpasst.
#
ggplot(data = cleaned_up_airquality_df, aes(x = Day, y = Ozone, color = as.factor(Month), group = Month)) +
  geom_line(linetype = 2, size = 1) +
  geom_point() +
  labs(title = "Ozonkonzentration in den Monaten 5 bis 9",
       x = "Tage",
       y = "Ozonkonzentration",
       color = "Monate") +
  theme(panel.grid.major = element_line(color = "blue", size = 0.5, linetype = "solid"),
        
        # Changing the helper grid lines (vertical lines)
        panel.grid.minor = element_line(color = "gray", size = 0.125, linetype = "dashed"),
        
        # Customize axis text to make it more readable
        axis.text = element_text(size = 14, face = "bold"))
#5. Interpretiere das Ergebnis: Wie verändert sich die Ozonkonzentration im Laufe der Tage? 
#Gibt es einen erkennbaren Trend oder ein Muster?
#  An welchen Tagen sind die höchsten und niedrigsten Ozonkonzentrationen zu beobachten?
 
#Antwort: Es scheint einen Trend zu geben das am Monats-Anfang und -Ende jeweils die Ozonkonzentration am hoechsten ist, waehrend sie 
#in der Mitte des Monats am niedriegsten ist. Am hoechsten scheint es am 25 des Monats zu sein, waehrend es am 16 am niedriegsten ist.

  
#  Wie hilft die gestrichelte Linie, Datenpunkte und angepasste Achsenbeschriftungen bei der 
#Visualisierung und Interpretation der Daten?

#Antwort: Die Datenpunkte machen klar, was die eigentlichen Daten sind und was interpoliert wurde.
#Ich persohnlich wuerde wohl die durchgezogene Linie gegenueber der gestrichelten bevorzugen,
#da ich dem Kurvenverlauf so leichter folgen koennte.Die angepasste Achsenbeschriftung hatte fuer mich
#keinen nennenswerten Effekt auf die Lesbarkeit. Mag aber auch an gut gewaehlten Voreinstellunge liegen. 