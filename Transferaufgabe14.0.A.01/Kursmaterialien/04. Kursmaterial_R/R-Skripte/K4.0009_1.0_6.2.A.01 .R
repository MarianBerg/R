# Laden des Datensatzes
data("UCBAdmissions")
View(UCBAdmissions)
str(UCBAdmissions)
summary(UCBAdmissions)


# Gruppiertes Säulendiagramm 
admissions_table <- as.data.frame.table(UCBAdmissions)
library(ggplot2)

ggplot(data = admissions_table, aes(x = Dept, y = Freq, fill = Admit, group = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(. ~ Gender)

# Hinzufügen von Legende, Achsenbeschriftung und Titel 
ggplot(data = admissions_table, aes(x = Dept, y = Freq, fill = Admit, group = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_grid(. ~ Gender) +
  labs(x = "Department", y = "Number of Applicants", title = "UCB Admissions by Department and Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values = c("red", "blue"), labels = c("Rejected", "Admitted"))
