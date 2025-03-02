#Aufgabe: Liniendiagramme mit ggplot2 
#
#b) 
#
#Erstelle ein Liniendiagramm mit ggplot2 in R, das die Anzahl der Erwerbstätigen und Erwerbslosen im Laufe der Zeit darstellt, 
#basierend auf dem Datensatz "economics". 
#Passe das Diagramm an, indem du verschiedene Farben, Linienstile und eine Legende hinzufügst.
#
#1. Lade den Datensatz "economics" und bereinige fehlende Werte.
#
library(tidyverse)
library(ggplot2)

cleaned_up_data <- as_tibble(economics) %>%
  drop_na()


#2. Transformiere den Datensatz in das Long-Format.
#
#Leider waren keine Erwertaetigen in dem Datensatz erhalten, er kann hoechstens als Differenz der Allgemeinen Bevoelkerung und der 
#Erwerbslosen geschaetzt werden, auch wenn dann wohl auch Kinder, Rentner und Kranke als Erwerbstaetige gezaehlt werden.

data_with_employed <- cleaned_up_data %>%
  mutate(employed = pop - unemploy)

#Umbenennung der Variablen fuer die spaetere Legende:

data_with_employed <- data_with_employed %>%
  rename(Beschäftigte = employed,
         Unbeschäftigte = unemploy)

data_with_employed_long <- data_with_employed %>%
  pivot_longer(cols = c(Unbeschäftigte, Beschäftigte), names_to = "status", values_to = "numbers_in_thousands")


#3. Erstelle ein Liniendiagramm mit zwei Linien, die die Anzahl der Erwerbstätigen und Erwerbslosen im Laufe der Zeit darstellen.
#




data_with_employed_long %>% ggplot(aes(x = date, y = numbers_in_thousands))+
  geom_line(aes(linetype = status), color = "black")
  
#4. Passe das Diagramm an, indem du verschiedene Farben, Linienstile und eine Legende hinzufügst.
#
data_with_employed_long %>% ggplot(aes(x = date, y = numbers_in_thousands, color = status))+
  geom_line() +
  labs(title = "Beschäftigte und Unbeschäftigte in den USA ueber 5 Jahrzehnte",
       x = "Datum",
       y = "Anzahl in Tausend") +
  theme(panel.grid.major = element_line(color = "black", size = 0.25, linetype = "dashed"),
        
        # Changing the helper grid lines (vertical lines)
        panel.grid.minor = element_line(color = "gray", size = 0.125, linetype = "dashed"),
        
        # Customize axis text to make it more readable
        axis.text = element_text(size = 14, face = "bold"))
  


#5. Interpretiere das erstellte Liniendiagramm, indem du Trends und mögliche Zusammenhänge zwischen der Anzahl der Erwerbstätigen 
#   und Erwerbslosen im Laufe der Zeit beschreibst.