setwd("/Users/sarahkulchen/Documents/FREELANCING/03_future.self & VelpTEC/05_Kurserstellung_R/Datensätze")
library(haven)
biking<-read_sav("Münster Biking Data.sav")
View(biking)
summary(biking)

#check for missing values 
install.packages("skimr")
library(skimr)
skim(biking)
is.na(biking$Gesamt) 
is.na(biking$Windkmh) 
is.na(biking$Lockdown) 
is.na(biking$Kontaktbeschränkungen) 
is.na(biking$`Temperatur°C`)

#combine all measurement locations for each day and create a subset biking1 with all important variables
subsetGartenstr<-subset(biking, biking$Ort == "Gartenstr") 
View(subsetGartenstr)
subsetKanalpro<-subset(biking, biking$Ort == "Kanalpro") 
subsetWolbeckerstr<-subset(biking, biking$Ort == "Wolbeckerstr") 
subsetHammer<-subset(biking, biking$Ort == "Hammer Str") 
subsetWeselerstr<-subset(biking, biking$Ort == "Weselerstr") 
subsetNeutor<-subset(biking, biking$Ort == "Neutor") 
subsetHüfferstr<-subset(biking, biking$Ort == "Hüfferstr") 
subsetWarendorferstr<-subset(biking, biking$Ort == "Warendorferstr") 
subsetPromenade<-subset(biking, biking$Ort == "Promenade")
sub_Gartenstr_total <- subsetGartenstr[,c("Gesamt")] 
sub_Kanal_total <- subsetKanalpro[,c("Gesamt")] 
sub_Hammer_total <- subsetHammer[,c("Gesamt")]
sub_Weseler_total <- subsetWeselerstr[,c("Gesamt")] 
sub_Neutor_total <- subsetNeutor[,c("Gesamt")] 
sub_Hüffer_total <- subsetHüfferstr[,c("Gesamt")] 
sub_Warendorfer_total <- subsetWarendorferstr[,c("Gesamt")] 
sub_Promenade_total <- subsetPromenade[,c("Gesamt")] 
sub_Wolbecker_total <- subsetWolbeckerstr[,c("Gesamt")]
bikinggesamt <- sub_Gartenstr_total + sub_Kanal_total + sub_Hammer_total + sub_Weseler_total + sub_Neutor_total + sub_Hüffer_total + sub_Warendorfer_total + sub_Promenade_total + sub_Wolbecker_total
View(bikinggesamt)
allesandere <- subsetGartenstr[,c("Temperatur°C","Windkmh","Lockdown","Kontaktbeschränkungen")]
View(allesandere)
library(dplyr)
biking1 <- bikinggesamt %>% bind_cols(allesandere) 
View(biking1)

#recode variables Kontaktbeschränkungen & Lockdown
biking1$Kontaktbeschränkungen_code<- recode(biking1$Kontaktbeschränkungen, "Keine"=1, "Feiern bis max 150 Personen"=2, "Feiern bis max 50 Personen"=3, "Max 10 Personen"=4, "Max 2 Haushalte"=5,"2 Haushalte, Max 10 Personen"=6,"2 Haushalte, Max 5 Personen"=7, "Max 5 Personen aus Familie"=8, "Max 2 Personen"=9)
biking1$Lockdown_code<- recode(biking1$Lockdown, "Nein"=1, "Teilweise"=2, "Offen unter Auflagen"=2, "Ja"=3)
View(biking1)

#check requierements for Pearson's r: linearity, outlier, normality plot(biking1$Windkmh, biking1$Gesamt, pch = 16)
plot(biking1$Windkmh, biking1$Gesamt, pch = 16)
reg_model <- lm(Gesamt ~ Windkmh, data = biking1) 
abline(reg_model, col="steelblue")

plot(biking1$Kontaktbeschränkungen_code, biking1$Gesamt, pch = 16)
reg_model4 <- lm(Gesamt ~ Kontaktbeschränkungen_code, data = biking1) 
abline(reg_model4, col="steelblue")
#linearity is mostly given

boxplot(biking1$Gesamt)
boxplot(biking1$Windkmh) 
boxplot(biking1$Kontaktbeschränkungen_code)
#outliers of wind are not removed, because it is real measurement data

shapiro.test(biking1$Gesamt)
shapiro.test(biking1$Windkmh)
#analytical tests become ineffective above a certain sample size

qqnorm(biking1$Gesamt)
biking1$zGesamt <- scale(biking1$Gesamt) 
qqnorm(biking1$zGesamt) 
qqline(biking1$zGesamt)

qqnorm(biking1$Windkmh)
biking1$zWindkmh <- scale(biking1$Windkmh) 
qqnorm(biking1$zWindkmh) 
qqline(biking1$zWindkmh)

biking1$zKontaktbeschränkungen_code <- scale(biking1$Kontaktbeschränkungen_code) 
qqnorm(biking1$zKontaktbeschränkungen_code) 
qqline(biking1$zKontaktbeschränkungen_code)
#normality is predominantly given

#correlation
correl<- biking1[,c("Temperatur°C","Windkmh","Lockdown_code","Kontaktbeschränkungen_code","Gesamt" )]
install.packages("Hmisc") 
library(Hmisc)
corr<-rcorr(as.matrix(correl))
corr 
install.packages("apaTables",dep=T) 
library(apaTables) 
apa.cor.table(correl)

#linear model H1
h1<-lm(Gesamt~Windkmh,biking1,na.action = na.exclude) 
summary(h1)
h1.1<-lm(zGesamt~zWindkmh,biking1,na.action = na.exclude) 
summary(h1.1)
install.packages("ggfortify")
library(ggfortify)
library(broom)
tidy(h1)
glance(h1)
augment(h1)
model.diag.metrics <- augment(h1)
head(model.diag.metrics)
ggplot(model.diag.metrics, aes(Windkmh, Gesamt)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  geom_segment(aes(xend = Windkmh, yend = .fitted), color = "red", size = 0.3)
par(mfrow = c(2, 3)) 
plot(h1)
plot(h1, 4)
library(apaTables) 
apa.reg.table(h1)

#linear model H2: checking for Kontaktbeschränkungen as a predictor 
h2<-lm(Gesamt~Kontaktbeschränkungen_code,biking1,na.action = na.exclude) 
summary(h2)
biking1$zKontaktbeschränkungen_code <- scale(biking1$Kontaktbeschränkungen_code)

h2.1<-lm(zGesamt~zKontaktbeschränkungen_code,biking1,na.action = na.exclude) 
summary(h2.1)
library(ggfortify)
library(broom)
tidy(h2)
glance(h2)
augment(h2)
model.diag.metrics.2 <- augment(h2)
head(model.diag.metrics.2)
ggplot(model.diag.metrics.2, aes(Kontaktbeschränkungen_code, Gesamt)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  geom_segment(aes(xend = Kontaktbeschränkungen_code, yend = .fitted), color = "red", size = 0.3)
par(mfrow = c(2, 3)) 
plot(h2)
plot(h2, 4)
library(apaTables) 
apa.reg.table(h2)

#linear model H2: moderation
h3<-lm(Gesamt~Windkmh+Kontaktbeschränkungen_code,biking1,na.action = na.exclude)
summary(h3)
h3.z<-lm(zGesamt~zWindkmh+zKontaktbeschränkungen_code,biking1,na.action = na.exclude)
summary(h3.z)
h3.mod<-lm(Gesamt~Windkmh + Kontaktbeschränkungen_code + Windkmh*Kontaktbeschränkungen_code,biking1,na.action = na.exclude)
summary(h3.mod)
h3.zmod<-lm(zGesamt~zWindkmh + zKontaktbeschränkungen_code + zWindkmh*zKontaktbeschränkungen_code,biking1,na.action = na.exclude)
summary(h3.zmod)

#model diagnostics of h3 moderation 
par(mfrow = c(2, 3))
plot(h3.mod) 
plot(h3.mod, 4)

#variance inflation factor
library(car)
vif(h3)

#no multicolinearity because values<10
apa.reg.table(h3.mod)
install.packages("interactions")
library(interactions)
interact_plot(h3.mod, pred = Windkmh, modx = Kontaktbeschränkungen_code)
interact_plot(h3.mod, pred = Windkmh, modx = Kontaktbeschränkungen_code, plot.points = TRUE)
interact_plot(h3.mod, pred = Windkmh, modx = Kontaktbeschränkungen_code, interval = TRUE, int.width = 0.8)
#no further analyze has to be done, because we do not have a significant interaction effects

apa.cor.table(correl,filename = "Correl.doc",table.number = 1,show.conf.interval = F)
apa.reg.table(lm(Gesamt~Windkmh,biking1),lm(Gesamt~Kontaktbeschränkungen_code,biking1),lm( Gesamt~Windkmh + Kontaktbeschränkungen_code,biking1),lm(Gesamt~Windkmh + Kontaktbeschränkungen_code + Windkmh*Kontaktbeschränkungen_code,biking1),filename = "Regression.doc",table.number = 2)
