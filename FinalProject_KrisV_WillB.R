library(ggplot2)

lebron_data <- read.csv("C:/Users/krisv/Downloads/career_data/lebron_career.csv")
lebron_data$age <- substr(lebron_data$age, 1, 2)
write.csv(lebron_data, "modified_lebron_data.csv", row.names = FALSE)
View(lebron_data)

jordan_data <- read.csv("C:/Users/krisv/Downloads/career_data/jordan_career.csv")
jordan_data$age <- substr(jordan_data$age, 1, 2)
write.csv(jordan_data, "modified_jordan_data.csv", row.names = FALSE)
View(jordan_data)

ggplot() +
  geom_line(data = lebron_data, aes(x = lebron_data$age, y = lebron_data$pts), color = "blue") +
  geom_line(data = jordan_data, aes(x = lebron_data$age, y = jordan_data$pts), color = "red") +
  labs(title = "Points by each GOAT",
       x = "Age",
       y = "Points per Game")
