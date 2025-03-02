# Aufgabe a) Flächendiagramm 

# Bibliotheken laden
library(ggplot2)
library(tidyr)

# Datensatz laden
data(economics)

# Datensatz ins Long-Format umwandeln
economics_long <- economics %>%
  gather(key = "Kategorie", value = "Wert", unemploy, pop)
economics_long$Wert <- economics_long$Wert / 1000

# Gestapeltes Flächendiagramm erstellen
flaechendiagramm <- ggplot(economics_long, aes(x = date, y = Wert, fill = Kategorie)) +
  geom_area()
flaechendiagramm

# Optische Einstellungen anpassen
flaechendiagramm <- flaechendiagramm +
  geom_area(alpha = 0.3, size = 0.2, colour = "black") +
  labs(x = "Datum", y = "Personen in Mio.") +
  theme(legend.position = "bottom") +
  scale_fill_manual(name = "Legende",
                    labels = c("Erwerbslose", "Erwerbstätige"),
                    values = c("darkred", "darkgreen"))
flaechendiagramm

# Aufgabe b) 
# R-Skript zur Lösung der Aufgaben

# Laden der benötigten Pakete
library(ggplot2)
library(ggpubr)

# Umwandeln von numerischen Variablen in Faktoren
mtcars$Zylinder <- as.factor(mtcars$cyl)
mtcars$Gänge <- as.factor(mtcars$gear)

# 1) Säulendiagramm
ggplot(mtcars, aes(x = Zylinder, y = hp)) +
  geom_bar(stat = "summary", fun = "mean", fill = "steelblue") +
  stat_summary(fun.data = mean_sdl, fun.args = list(mult = 1),
               geom = "errorbar", color = "black", width = 0.5,
               size = 1)

# 2) Liniendiagramm
ggline(mtcars, x = "Zylinder", y = "hp", add = "mean_se")

# 3) Erweitertes Liniendiagramm
ggline(mtcars, x = "Zylinder", y = "hp", color = "Gänge", add = "mean_se")

