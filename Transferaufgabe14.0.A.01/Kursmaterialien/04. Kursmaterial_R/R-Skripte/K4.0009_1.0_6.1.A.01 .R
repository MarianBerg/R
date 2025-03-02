# Laden des benötigten Pakets und des Datensatzes
library(ggplot2)
data(diamonds)

# Basisversion von R
hist(diamonds$price, main = "Histogramm der Diamantenpreise",
     xlab = "Preis", ylab = "Häufigkeit", col = "steelblue")

# ggplot2
ggplot(data = diamonds, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "steelblue", color = "white") +
  labs(x = "Preis", y = "Häufigkeit") +
  ggtitle("Histogramm der Diamantenpreise") +
  theme(plot.title = element_text(hjust = 0.5))

# Dichte der Preisverteilung
ggplot(data = diamonds, aes(x = price, y = ..density..)) +
  geom_histogram(binwidth = 500, fill = "steelblue", color = "white") +
  geom_density(size = 1, color = "red") +
  labs(x = "Preis", y = "Dichte") +
  ggtitle("Histogramm der Diamantenpreise mit Dichtefunktion") +
  theme(plot.title = element_text(hjust = 0.5))


