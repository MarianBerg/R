# Datensatz laden
data(CO2)

# Zusammenfassung des Datensatzes
summary(CO2)

# Streudiagramm erstellen
library(ggplot2)

ggplot(data = CO2, aes(x = Plant, y = uptake)) +
  geom_point(size = 3, color = "steelblue") +
  labs(x = "Pflanzentyp", y = "CO2-Aufnahme (umol/d)") +
  theme_minimal()

# Streudiagramm erweitern
ggplot(data = CO2, aes(x = Plant, y = uptake, color = Treatment, shape = Treatment)) +
  geom_point(size = 3) +
  labs(x = "Pflanzentyp", y = "CO2-Aufnahme (umol/d)", color = "Behandlung", shape = "Behandlung") +
  scale_color_manual(values = c("chilled" = "blue", "nonchilled" = "red")) +
  scale_shape_manual(values = c("chilled" = 16, "nonchilled" = 17)) +
  theme_minimal()
