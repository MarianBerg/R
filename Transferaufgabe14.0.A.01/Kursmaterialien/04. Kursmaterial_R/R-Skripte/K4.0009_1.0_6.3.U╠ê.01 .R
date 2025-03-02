library(ggplot2)

# Aufgabe a) 
diamonds_colors <- table(diamonds$color)
barplot(diamonds_colors,
        xlab = "Farben", ylab = "Anzahl der Diamanten", main = "Diamanten nach Farben",
        horiz = TRUE)

# Aufgabe b) 
avg_price_by_color <- aggregate(price ~ color, data = diamonds, FUN = mean)

ggplot(avg_price_by_color, aes(x = color, y = price)) +
  geom_bar(stat = "identity") +
  labs(x = "Farben", y = "Durchschnittlicher Preis") +
  ggtitle("Durchschnittlicher Preis der Diamanten nach Farben")

# Aufgabe c) 
diamonds_count <- diamonds %>%
  count(color, cut)

ggplot(diamonds_count, aes(x = color, y = n, fill = cut)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(y = "Anzahl der Diamanten", x = "Farben", fill = "Schnitt") +
  ggtitle("Anzahl der Diamanten nach Farben und Schnitten")

