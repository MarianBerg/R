library(tidyverse)



data <- as_tibble(Orthodont)


age_8 <- data %>% filter(age == 8) %>%
  pull(distance)

age_14 <- data %>% filter(age == 14) %>%
  pull(distance)

t.test(age_8, age_14, paired = TRUE)


cohen_d <- mean(differences) / sd(differences)

cohen_d
