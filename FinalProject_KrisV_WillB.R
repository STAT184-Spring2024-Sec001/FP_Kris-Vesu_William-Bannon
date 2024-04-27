library(ggplot2)
library(dplyr)
library(kableExtra)

lebron_data <- read.csv("C:/Users/krisv/Downloads/career_data/lebron_career.csv")
lebron_data$age <- substr(lebron_data$age, 1, 2)
write.csv(lebron_data, "modified_lebron_data.csv", row.names = FALSE)
View(lebron_data)

jordan_data <- read.csv("C:/Users/krisv/Downloads/career_data/jordan_career.csv")
jordan_data$age <- substr(jordan_data$age, 1, 2)
write.csv(jordan_data, "modified_jordan_data.csv", row.names = FALSE)
View(jordan_data)

lebron_data$ts = (lebron_data$fg + (0.5 * lebron_data$three)) / lebron_data$fga
jordan_data$ts = (jordan_data$fg + (0.5 * jordan_data$three)) / jordan_data$fga

ggplot() +
  geom_boxplot(data = lebron_data, aes(x = age, y = pts), color = "blue") +
  geom_boxplot(data = jordan_data, aes(x = age, y = pts), color = "red") +
  labs(title = "Points by each GOAT",
       x = "Age",
       y = "Points per Game")

ggplot() +
  geom_boxplot(data = lebron_data, aes(x = age, y = ts), color = "blue") +
  geom_boxplot(data = jordan_data, aes(x = age, y = ts), color = "red") +
  labs(title = "True Shooting by each GOAT",
       x = "Age",
       y = "True Shooting per Game")

sumTable_lebronPts <- lebron_data %>%
  group_by(fg) %>%
  summarize(
    count = n(),
    minimum = min(pts, na.rm = TRUE),
    firstQuin = quantile(pts, probs = 0.2, na.rm = TRUE),
    secondQuin = quantile(pts, probs = 0.4, na.rm = TRUE),
    median = median(pts, na.rm = TRUE),
    thirdQuin = quantile(pts, probs = 0.6, na.rm = TRUE),
    fourthQin = quantile(pts, probs = 0.8, na.rm = TRUE),
    max = max(pts, na.rm = TRUE),
    SAM = mean(pts, na.rm = TRUE),
    SASD = sd(pts, na.rm = TRUE)
  )

sumTable_lebronTs <- lebron_data %>%
  group_by(fg) %>%
  summarize(
    count = n(),
    minimum = min(ts, na.rm = TRUE),
    firstQuin = quantile(ts, probs = 0.2, na.rm = TRUE),
    secondQuin = quantile(ts, probs = 0.4, na.rm = TRUE),
    median = median(ts, na.rm = TRUE),
    thirdQuin = quantile(ts, probs = 0.6, na.rm = TRUE),
    fourthQin = quantile(ts, probs = 0.8, na.rm = TRUE),
    max = max(ts, na.rm = TRUE),
    SAM = mean(ts, na.rm = TRUE),
    SASD = sd(ts, na.rm = TRUE)
  )

sumTable_jordanPts <- jordan_data %>%
  group_by(fg) %>%
  summarize(
    count = n(),
    minimum = min(pts, na.rm = TRUE),
    firstQuin = quantile(pts, probs = 0.2, na.rm = TRUE),
    secondQuin = quantile(pts, probs = 0.4, na.rm = TRUE),
    median = median(pts, na.rm = TRUE),
    thirdQuin = quantile(pts, probs = 0.6, na.rm = TRUE),
    fourthQin = quantile(pts, probs = 0.8, na.rm = TRUE),
    max = max(pts, na.rm = TRUE),
    SAM = mean(pts, na.rm = TRUE),
    SASD = sd(pts, na.rm = TRUE)
  )

sumTable_jordanTs <- jordan_data %>%
  group_by(fg) %>%
  summarize(
    count = n(),
    minimum = min(ts, na.rm = TRUE),
    firstQuin = quantile(ts, probs = 0.2, na.rm = TRUE),
    secondQuin = quantile(ts, probs = 0.4, na.rm = TRUE),
    median = median(ts, na.rm = TRUE),
    thirdQuin = quantile(ts, probs = 0.6, na.rm = TRUE),
    fourthQin = quantile(ts, probs = 0.8, na.rm = TRUE),
    max = max(ts, na.rm = TRUE),
    SAM = mean(ts, na.rm = TRUE),
    SASD = sd(ts, na.rm = TRUE)
  )

sumTable_lebronPts %>%
  kable(
    digits = 2,
    format.args = list(big.mark = ","),
    caption = "Summary Statistics for LeBron Points (by Field Goal)",
    col.names = c("FG", "Count", "Minimum", "20%-tile", "40%-tile", "Median",
                  "60%-tile", "80%-tile", "Max", "SAM", "SASD"),
    align = c("l", rep("c", 10)),
    booktabs = TRUE
  ) %>%
  kableExtra::kable_classic()

sumTable_jordanPts %>%
  kable(
    digits = 2,
    format.args = list(big.mark = ","),
    caption = "Summary Statistics for Jordan Points (by Field Goal)",
    col.names = c("FG", "Count", "Minimum", "20%-tile", "40%-tile", "Median",
                  "60%-tile", "80%-tile", "Max", "SAM", "SASD"),
    align = c("l", rep("c", 10)),
    booktabs = TRUE
  ) %>%
  kableExtra::kable_classic()

sumTable_lebronTs %>%
  kable(
    digits = 2,
    format.args = list(big.mark = ","),
    caption = "Summary Statistics for LeBron Total Shooting Percentage (by Field Goal)",
    col.names = c("FG", "Count", "Minimum", "20%-tile", "40%-tile", "Median",
                  "60%-tile", "80%-tile", "Max", "SAM", "SASD"),
    align = c("l", rep("c", 10)),
    booktabs = TRUE
  ) %>%
  kableExtra::kable_classic()

sumTable_jordanTs %>%
  kable(
    digits = 2,
    format.args = list(big.mark = ","),
    caption = "Summary Statistics for Jordan Total Shooting Percentage (by Field Goal)",
    col.names = c("FG", "Count", "Minimum", "20%-tile", "40%-tile", "Median",
                  "60%-tile", "80%-tile", "Max", "SAM", "SASD"),
    align = c("l", rep("c", 10)),
    booktabs = TRUE
  ) %>%
  kableExtra::kable_classic()

new_table <- rbind(lebron_data, jordan_data)
View(new_table)

ggplot() +
  geom_boxplot(data = new_table, aes(x = age, y = pts, color = name)) +
  scale_color_manual(values = c("red", "blue")) +
  labs(title = "Points by each GOAT",
       x = "Age",
       y = "Points per Game")


