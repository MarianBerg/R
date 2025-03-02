library(tidyr)
library(dplyr)

hair_eye_color <- as.data.frame(HairEyeColor)
View(hair_eye_color)
hair_eye_color %>% 
  mutate(across(Hair:Sex, as.factor(.))) %>%
  pivot_longer(cols = Hair:Sex, names_to = "variable", values_to = "value") %>%
  mutate(dummy = 1) %>%
  pivot_wider(names_from = c("variable", "value"), values_from = "dummy", values_fill = list(dummy = 0))
  