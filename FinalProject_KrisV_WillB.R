lebron_data <- read.csv("C:/Users/krisv/Downloads/career_data/lebron_career.csv")
lebron_data$age <- substr(lebron_data$age, 1, 2)
write.csv(lebron_data, "modified_lebron_data.csv", row.names = FALSE)
View(lebron_data)

jordan_data <- read.csv("C:/Users/krisv/Downloads/career_data/jordan_career.csv")
jordan_data$age <- substr(jordan_data$age, 1, 2)
write.csv(jordan_data, "modified_jordan_data.csv", row.names = FALSE)
View(jordan_data)
