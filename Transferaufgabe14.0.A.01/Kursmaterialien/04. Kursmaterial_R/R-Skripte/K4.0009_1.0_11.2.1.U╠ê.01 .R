# Teil 1
# Datensatz laden
read.csv("UN.csv")

# Deskriptive Statistiken
library(dplyr)
summary(UN, group_by(group))
UN %>% 
  select(group, fertility, ppgdp, lifeExpF, pctUrban, infantMortality) %>% 
  group_by(group) %>% 
  summarise_all(list(mean, sd, min, max))

# Histogramme
par(mfrow = c(2, 3))
hist(UN$fertility, main = "Fertility", xlab = "Fertility")
hist(UN$ppgdp, main = "GDP per Capita", xlab = "GDP per Capita")
hist(UN$lifeExpF, main = "Female Life Expectancy", xlab = "Female Life Expectancy")
hist(UN$pctUrban, main = "Percentage Urban", xlab = "Percentage Urban")
hist(UN$infantMortality, main = "Infant Mortality", xlab = "Infant Mortality")

# Boxplots
par(mfrow = c(2, 3))
boxplot(fertility ~ group, data = UN, main = "Fertility")
boxplot(ppgdp ~ group, data = UN, main = "GDP per Capita")
boxplot(lifeExpF ~ group, data = UN, main = "Female Life Expectancy")
boxplot(pctUrban ~ group, data = UN, main = "Percentage Urban")
boxplot(infantMortality ~ group, data = UN, main = "Infant Mortality")

# Scatterplots
pairs(UN[, c("fertility", "ppgdp", "lifeExpF", "pctUrban", "infantMortality")])

# Überprüfung der Normalverteilung der Residuen
anova_model1 <- aov(fertility ~ group, data = UN)
anova_model1
resid_normal1 <- shapiro.test(resid(anova_model1))
resid_normal1
qqnorm(resid(anova_model1))
qqline(resid(anova_model1))

anova_model2 <- aov(lifeExpF ~ group, data = UN)
resid_normal2 <- shapiro.test(resid(anova_model2))
resid_normal2
qqnorm(resid(anova_model2))
qqline(resid(anova_model2))

# Überprüfung der Varianzhomogenität
library(car)
leveneTest(fertility ~ group, data = UN)
plot(anova_model1, 1)

leveneTest(lifeExpF ~ group, data = UN)
plot(anova_model2, 1)

# Einfaktorielle ANOVA
anova_results1 <- anova(anova_model1)
anova_results1

anova_results2<- anova(anova_model2)
anova_results2

# Post-hoc-Tests mit Bonferroni-Korrektur
# Entfernen von fehlenden Werten
UN_filtered <- na.omit(UN)

# Post-hoc-Tests mit Bonferroni-Korrektur
posthoc_fertility <- pairwise.t.test(UN_filtered$fertility, UN_filtered$group, p.adjust.method = "bonferroni")
posthoc_fertility

posthoc_lifeExpF <- pairwise.t.test(UN_filtered$lifeExpF, UN_filtered$group, p.adjust.method = "bonferroni")
posthoc_lifeExpF

# Effektstärke 
library(dplyr)
library(rstatix)
UN %>%
  cohens_d(fertility~group)%>%
  as.data.frame()

UN %>%
  cohens_d(lifeExpF~group)%>%
  as.data.frame()

# Teil 2

# Deskriptive Statistiken
library(dplyr)
UN %>% 
  select(region, fertility, ppgdp, lifeExpF, pctUrban, infantMortality) %>% 
  group_by(region) %>% 
  summarise_all(list(mean, sd, min, max))

# Boxplots
par(mfrow = c(2, 3))
boxplot(fertility ~ region , data = UN, main = "Fertility")
boxplot(ppgdp ~ region, data = UN, main = "GDP per Capita")
boxplot(lifeExpF ~ region, data = UN, main = "Female Life Expectancy")
boxplot(pctUrban ~ region, data = UN, main = "Percentage Urban")
boxplot(infantMortality ~ region, data = UN, main = "Infant Mortality")

# Scatterplots
pairs(UN[, c("fertility", "ppgdp", "lifeExpF", "pctUrban", "infantMortality")])

# Überprüfung der Normalverteilung der Residuen
anova_model3 <- aov(pctUrban ~ region, data = UN)
resid_normal3 <- shapiro.test(resid(anova_model3))
qqnorm(resid(anova_model3))
qqline(resid(anova_model3))

# Überprüfung der Varianzhomogenität
library(car)
leveneTest(pctUrban ~ region, data = UN)
plot(anova_model3, 1)

# Einfaktorielle ANOVA
anova_results3 <- anova(anova_model3)
anova_results3

# Post-hoc-Tests mit Bonferroni-Korrektur
posthoc_results3 <- pairwise.t.test(UN_filtered$pctUrban, UN_filtered$region, p.adjust.method = "bonferroni")
posthoc_results3

# Effektstärke 
UN %>%
  cohens_d(pctUrban~region)%>%
  as.data.frame()

