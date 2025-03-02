library(tidyverse)

hist(diamonds$price)

ggplot(diamonds, aes(x = price, y = ..density..)) +
  geom_histogram(binwidth = 500, color = 'white', 
                fill = "steelblue") +
  labs(x = "Preis", y = "Häufigkeit") +
  ggtitle("Haeufikeit fuer Preise") +
  geom_density(size = 1, color = "red") +
  theme(plot.title = element_text(hjust = 0.5))
  
  
  

View(UCBAdmissions)
UCBAdmissions_data_frame <- as.data.frame(UCBAdmissions)
ggplot(UCBAdmissions_data_frame, aes(x = Dept, y = Freq, fill = Admit, group = Gender)) +
  
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Akzetanz von Bewerbungen in Instituten nach Geschlecht")+
  facet_grid(. ~ Gender) +
  scale_fill_manual(values = c('red', 'blue'), labels = c('Rejected', 'Accepted'))
#Füge dem Diagramm eine Legende, Achsenbeschriftungen und einen Titel hinzu.
