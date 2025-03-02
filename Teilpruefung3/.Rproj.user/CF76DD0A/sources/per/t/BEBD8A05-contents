#Aufgabe a) 
# a) 1. 
# Laden des Datensatzes
data(airquality)

# Bereinigung von fehlenden Werten
airquality_clean <- na.omit(airquality)

# a) 2. 
library(ggplot2)

ggplot(data = airquality_clean, aes(x = Day, y = Ozone)) +
  geom_line()

# a) 3. 
ggplot(data = airquality_clean, aes(x = Day, y = Ozone)) +
  geom_line(linetype = 2) +
  geom_point(size = 1.5, pch = 21, color = "black", bg = "grey") +
  labs(x = "Tag", y = "Ozonkonzentration")

# a) 4. 
ggplot(data = airquality_clean, aes(x = Day, y = Ozone)) +
  geom_line(linetype = 2) +
  geom_point(size = 1.5, pch = 21, color = "black", bg = "grey") +
  labs(x = "Tag", y = "Ozonkonzentration") +
  scale_x_continuous(breaks = seq(0, 31, 5), minor_breaks = seq(0, 31, 1))


# Aufgabe b) 
# Laden des Datensatzes
data(economics)

# Bereinigung von fehlenden Werten
economics_clean <- na.omit(economics)

library(tidyr)

economics_long <- economics_clean %>%
  pivot_longer(cols = c("psavert", "uempmed"), names_to = "Kategorie", values_to = "Wert")

library(ggplot2)

ggplot(data = economics_long, aes(x = date, y = Wert, color = Kategorie)) +
  geom_line(size = 0.75)

ggplot(data = economics_long, aes(x = date, y = Wert, color = Kategorie, linetype = Kategorie)) +
  geom_line(size = 0.75) +
  labs(x = "Datum", y = "Werte") +
  theme(legend.position = "bottom") +
  scale_color_manual(name = "Kategorie", 
                     labels = c("Erwerbstätige", "Erwerbslose"), 
                     values = c("darkgreen", "darkred")) +
  scale_linetype_manual(name = "Kategorie", 
                        labels = c("Erwerbstätige", "Erwerbslose"), 
                        values = c(1, 2))

