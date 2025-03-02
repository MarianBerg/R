#Aufgabe: Ordinal logistische Regression

#In dieser Aufgabe sollst du den Zusammenhang zwischen verschiedenen chemischen Eigenschaften 
#von Weinen und ihrer Qualitätsstufe untersuchen. 
#Der Datensatz "wine" aus dem "rattle" Paket beinhaltet Daten über verschiedene Weine, 
#einschließlich ihres Alkoholgehalts, Magnesiumgehalts und ihrer Farbintensität. 
#Die Qualitätsstufe des Weins ist durch die Variable "Type" dargestellt.

#Führe die folgenden Schritte durch:
  
#a) Lade den Datensatz "wine" und führe eine deskriptive Statistik durch, 
#um ein grundlegendes Verständnis der Daten zu erlangen.
library(rattle)
data <- as_tibble(wine)
summary(data)

library(psych)
describeBy(data$Alcohol, data$Type)
describeBy(data$Malic, data$Type)
describeBy(data$Ash, data$Type)
describeBy(data$Alcalinity, data$Type)
describeBy(data$Magnesium, data$Type)
describeBy(data$Phenols, data$Type)
describeBy(data$Flavanoids, data$Type)
describeBy(data$Nonflavanoids, data$Type)
describeBy(data$Proanthocyanins, data$Type)
describeBy(data$Color, data$Type)
describeBy(data$Hue, data$Type)
describeBy(data$Dilution, data$Type)
describeBy(data$Proline, data$Type)

library(ggplot2)
library(tidyverse)

my_plot <- function(data, var) {ggplot(data, aes(x = Type, y = .data[[var]])) +
  geom_boxplot()
}

plots <- select(data, -Type) %>%
  names() %>%
  map(~ my_plot(data, .x))

for (plot in plots) {
  print(plot)
  readline(prompt = "Druecke [Enter] fuer den naechsten Plot...")
}

#Simple Korrelation scheint auf den ersten Blick nicht ersichtlich zu sein.


#b) Überprüfe die Voraussetzungen für eine lineare Regression, indem du die 
#Multikollinearität der unabhängigen Variablen (Alkohol, Magnesium, Farbe) untersuchst.



library(rms)

model <- ols(Type ~ Magnesium + Alcohol + Color, data = data)
vif(model)

#saemtliche Werte sind < 2, damit sollten selbst sehr konsevative Anforderungen
#an die nicht Multikollinearität der Variablen erfuellt sein.



#c) Erstelle ein ordinal logistisches Regressionsmodell, das die 
#Weintypen (Type) als abhängige Variable und die chemischen Eigenschaften 
#Alkohol, Magnesium und Farbe als unabhängige Variablen verwendet.

ordinal_model <- orm(Type ~ Magnesium + Alcohol + Color, data = data, x = TRUE, y = TRUE)

ordinal_model

#d) Interpretiere die Ergebnisse des Modells, einschließlich der Modellgüte, 
#der Diskriminierungsindizes und der Koeffizienten und p-Werte der unabhängigen Variablen. 
#Diskutiere, wie diese Faktoren die Qualitätsstufe des Weins beeinflussen. 
#Ziehe Schlussfolgerungen aus den Ergebnissen und gebe Empfehlungen ab, wie 
#diese Erkenntnisse genutzt werden können, um die chemischen Eigenschaften von 
#Weinen besser zu verstehen oder möglicherweise die Produktionsprozesse und die 
#Auswahl von Weinen für den Verkauf zu optimieren.

#Zusammenfassung: Insgesamt hat das Model einen p Wert < 0..0001, damit betraechtlich unter der Ablehnung
#von 0.05 und ist damit signifikant im Verhaeltnis zum Null-Model. Und hat mit chi2 von 96.35 einen hohen Erklaerungswert.

#Bodellgüte und Diskriminierungsindizes: Das R2, in diesem Fall das Nagelkerke erreicht einen Wert von 0.472 der aber 
#fachspezifisch eingeordnet werden muesste.

#Koeffizienten und p-Werte der unabhängigen Variablen: Saemtliche Praedikatoren haben einen p-Wert < 0.05 und sind damit
#als signifikant anzusehen. Nach den Vorzeichen haben Magnesium und Alkohol zunaechst einen negativen Einfluss auf den Typ
#des Weines, waehrend die Farbe zunaechst einen positiven Einfluss hat.

#e) Berechne die Odds-Ratio, um die Effekte der unabhängigen Variablen auf die 
#abhängige Variable (Type) zu interpretieren. Interpretiere die Ergebnisse. 

round(exp(coef(ordinal_model)),3)

magnesium_reziprok <- 1 / 9.720000e-01 
magnesium_reziprok

alcohol_reziprok <- 1/ 1.170000e-01
alcohol_reziprok
#Wenn die Farbe um 1 steigt erhoet sich die Wahrscheinlichkeit fuer einen hoeheren Typ um das 2.19 fache.
#Fuer jede Verringerung des Magnesium um eine Einheit steigt die Wahrscheinlichkeit fuer einen hoeheren Typ um das 1.03 fache.
#Fuer jede Verringerung des Alkohols um eine Einheit steigt die Wahrscheinlichkeit fuer einen hoeheren Typ um das 8.55 fache.

#Als Empfehlung waere es Sinnvoll die Prozesse derartig anzupassen/optimieren, das Alkohol in geringerem Maße produziert und Magnesium moeglichst
#wenig beigesetzt, bzw. bei Auswahl der Ausgangsmaterialien auf einen niedrigen Magnesiumanteil geachtet wird. Wie die Prozesse angepasst werde
#koennten um moeglichst hohe Farbwerte zu erreichen, koennte ebenfalls mit den Winzern besprochen werden.
