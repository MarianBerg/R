library(tidyverse)
library(haven)

biking <- read_sav("G:\\Programming\\Projekte\\Fortbildung\\R\\Transferaufgabe14.0.A.01\\Kursmaterialien\\04. Kursmaterial_R\\Datensa╠êtze\\Mu╠ênster Biking Data.sav")

summary(biking)




biking_selected <- select(biking, -Datum, -Schneecm, -DAX, -Stadteinwärts, -Stadtauswärts, -KanalpromenadeFRZentrum, -KanalpromenadeFROsttor, -PromenadeFRSalzstraße, -PromenadeFRMauritztor)



biking_one_hot <- biking_selected %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Ort, values_from = value, values_fill = list(value = 0))

biking_one_hot <- biking_one_hot %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Wetter, values_from = value, values_fill = list(value = 0))

biking_one_hot <- biking_one_hot %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Ferien, values_from = value, values_fill = list(value = 0))

biking_one_hot <- biking_one_hot %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Kontaktbeschränkungen, values_from = value, values_fill = list(value = 0))

biking_one_hot <- biking_one_hot %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Lockdown, values_from = value, values_fill = list(value = 0))

biking_one_hot <- biking_one_hot %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = Wochentag, values_from = value, values_fill = list(value = 0))



biking_one_hot <- biking_one_hot %>%
  drop_na()

# Check if there are no NA values in the entire tibble
no_na_values <- biking_one_hot %>%
  summarise_all(~ all(!is.na(.))) %>%
  unlist() %>%
  all()


no_na_values

write_csv(biking_one_hot, "biking_one_hot.csv")

library(interactions)
interact_plot(model = model, pred = Wetter, modx = Kontaktbeschränkungen)


df_one_hot <- df %>%
  mutate(value = 1) %>%
  pivot_wider(names_from = category, values_from = value, values_fill = list(value = 0))

# View the resulting data frame
print(df_one_hot