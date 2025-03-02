# Daten laden
library(nlme)
data(Orthodont)

# Deskriptive Statistiken
library(dplyr)
Orthodont %>%
  group_by(age) %>%
  summarize(Mean = mean(distance),
            SD = sd(distance),
            N = n()) %>%
  as.data.frame()

# Boxplots erstellen
boxplot(distance ~ age, data = Orthodont)

# Überprüfung auf Ausreißer
library(rstatix)
Orthodont %>%
  group_by(age) %>%
  identify_outliers(distance) %>%
  as.data.frame()

# Überprüfung auf Normalverteilung
library(ggpubr)
ggqqplot(Orthodont, "distance", facet.by = "age")

# ANOVA mit Messwiederholungen
rep_anova <- anova_test(data = Orthodont, dv = distance, wid = Subject,
                        within = age, effect.size = "pes")

# Ergebnisse der ANOVA
get_anova_table(rep_anova)

# Mauchly-Test zur Prüfung der Sphärizität
rep_anova$`Mauchly's Test for Sphericity`

# Post-hoc-Tests
Orthodont %>%
  pairwise_t_test(distance ~ age, paired = TRUE,
                  p.adjust.method = "bonferroni") %>%
  as.data.frame()

