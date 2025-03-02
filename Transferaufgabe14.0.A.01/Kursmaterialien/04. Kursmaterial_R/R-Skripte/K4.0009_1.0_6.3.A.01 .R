library(ggplot2)
data("airquality")
View(airquality)

# Streudiagramm 
ggplot(airquality, aes(x = Temp, y = Ozone, color = factor(Month))) +
  geom_point() +
  labs(x = "Temperatur (°F)", y = "Ozonkonzentration (ppb)", color = "Monat") +
  ggtitle("Streudiagramm: Temperatur vs. Ozonkonzentration")

# Balkendiagramm 
avg_ozone <- aggregate(Ozone ~ Month, data = airquality, FUN = mean, na.rm = TRUE)

ggplot(avg_ozone, aes(x = factor(Month), y = Ozone)) +
  geom_bar(stat = "identity") +
  labs(x = "Monat", y = "Durchschnittliche Ozonkonzentration (ppb)") +
  ggtitle("Balkendiagramm: Durchschnittliche Ozonkonzentration pro Monat")

# Boxplot
ggplot(airquality, aes(x = factor(Month), y = Temp)) +
  geom_boxplot() +
  labs(x = "Monat", y = "Temperatur (°F)") +
  ggtitle("Boxplot: Temperaturverteilung pro Monat")

