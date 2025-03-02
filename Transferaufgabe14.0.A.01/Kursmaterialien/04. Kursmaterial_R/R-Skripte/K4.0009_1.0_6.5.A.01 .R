# Aufgabe a) 
data("HairEyeColor")
hair <- as.table(apply(HairEyeColor, c(1), sum))
eye <- as.table(apply(HairEyeColor, c(2), sum))

prozent_hair <- round(prop.table(hair) * 100, 2)
prozent_eye <- round(prop.table(eye) * 100, 2)

beschriftung_hair <- paste(names(hair), prozent_hair, "%", sep = " ")
beschriftung_eye <- paste(names(eye), prozent_eye, "%", sep = " ")

par(mfrow = c(1, 2))
pie(hair, labels = beschriftung_hair, main = "Haarfarben")
pie(eye, labels = beschriftung_eye, main = "Augenfarben")



#Aufgabe b) 
data("mtcars")
qqnorm(mtcars$mpg, main = "QQ-Plot für Miles per Gallon")
qqline(mtcars$mpg)



