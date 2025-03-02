library(tidyr)
library(readr)

sales_wide <- read_csv("Tabelle_Übung2.4.Ü.01(b).csv")


sales_long <- pivot_longer(sales_wide, Januar:März,
                           names_to = 'Monat',
                           values_to = 'Verkaufszahlen')
View(sales_long)

sales_wide2 <- pivot_wider(sales_long, 
                           names_from = 'Monat',
                           values_from = 'Verkaufszahlen')
View(sales_wide2)
