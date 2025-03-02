install.packages("datarium")

# Pakete laden
library(tidyverse)
library(datarium)
library(rstatix)
library(ggpubr)

# Daten laden und vorbereiten
set.seed(123)
data("anxiety", package = "datarium")
anxiety %>% sample_n_by(group, size = 1)

anxiety <- anxiety %>%
  gather(key = "time", value = "score", t1, t2, t3) %>%
  convert_as_factor(id, time)

# Voraussetzungen prüfen
bxp <- ggboxplot(
  anxiety, x = "time", y = "score",
  color = "group", palette = "jco"
)
bxp

anxiety %>%
  group_by(time, group) %>%
  shapiro_test(score)

ggqqplot(anxiety, "score", ggtheme = theme_bw()) +
  facet_grid(time ~ group)

anxiety %>%
  group_by(time) %>%
  levene_test(score ~ group)

# Zwei-Wege-gemischte ANOVA
res.aov <- anova_test(
  data = anxiety, dv = score, wid = id,
  between = group, within = time
)
anova_table <- get_anova_table(res.aov)
print(anova_table)

# Post-hoc-Tests
one.way <- anxiety %>%
  group_by(time) %>%
  anova_test(dv = score, wid = id, between = group) %>%
  get_anova_table() %>%
  adjust_pvalue(method = "bonferroni")

pwc <- anxiety %>%
  group_by(time) %>%
  pairwise_t_test(score ~ group, p.adjust.method = "bonferroni")

print(one.way)
print(pwc)

