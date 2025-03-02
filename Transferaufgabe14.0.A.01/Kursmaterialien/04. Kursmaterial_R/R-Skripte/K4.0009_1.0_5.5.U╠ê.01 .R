# Laden des Iris-Datensatzes
data(iris)

# Laden des psych-Pakets und Anwendung der describe()-Funktion auf die Kelchblattlängen (Sepal.Length)
install.packages("psych")
library(psych)
sepal_length_desc <- describe(iris$Sepal.Length)
print(sepal_length_desc)

# Laden des DescTools-Pakets und Anwendung der Desc()-Funktion auf die Blütenblattlängen (Petal.Length)
install.packages("DescTools")
library(DescTools)
petal_length_desc <- Desc(iris$Petal.Length)
print(petal_length_desc)
