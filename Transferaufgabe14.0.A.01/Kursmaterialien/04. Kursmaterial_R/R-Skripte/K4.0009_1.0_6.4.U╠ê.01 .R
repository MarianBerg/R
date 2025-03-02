library(ggplot2)
data(msleep)
msleep_clean <- na.omit(msleep)

# Boxplot für Gewicht
ggplot(msleep_clean, aes(x = order, y = bodywt, fill = order)) +
  geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.5, size = 2) +
  labs(title = "Boxplot des Gewichts für verschiedene Tierarten",
       x = "Tierarten",
       y = "Gewicht (kg)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Boxplot für Gehirngewicht
ggplot(msleep_clean, aes(x = order, y = brainwt, fill = order)) +
  geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.5, size = 2) +
  labs(title = "Boxplot des Gehirngewichts für verschiedene Tierarten",
       x = "Tierarten",
       y = "Gehirngewicht (g)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Installieren und Laden des reshape2-Pakets
install.packages("reshape2")
library(reshape2)

# Umwandeln des Dataframes in das "long" Format
msleep_long <- melt(msleep_clean, id.vars = c("order"), measure.vars = c("scaled_weight", "scaled_brainwt"))

# Erstellen des kombinierten Boxplots
ggplot(msleep_long, aes(x = order, y = value, fill = variable)) +
  geom_boxplot() +
  geom_jitter(width = 0.3, alpha = 0.5, size = 2) +
  labs(title = "Kombinierter Boxplot von Gewicht und Gehirngewicht für verschiedene Tierarten",
       x = "Tierarten",
       y = "Skalierte Werte") +
  scale_fill_discrete(labels = c("Gewicht", "Gehirngewicht")) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

        
