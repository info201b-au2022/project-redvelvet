library(tidyverse)
library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)
salary_and_gender <- data %>%
  select(sex, salary)
view(salary_and_gender)
gender <- salary_and_gender$sex
num_gender <- length(unique(gender))
num_of_female <- sum(str_count(gender, "Female"))
num_of_male <- sum(str_count(gender, "Male"))
male <- filter(salary_and_gender, sex == "Male")
female <- filter(salary_and_gender, sex == "Female")
ggplot(female, aes(x="", y=num_of_female, fill=salary)) +
  geom_bar(stat = "identity", width=1) +
  ggtitle("Proportion of Female's salary") + 
  coord_polar("y", start = 0) + 
  theme_void()
ggplot(male, aes(x="", y=num_of_male, fill=salary)) +
  geom_bar(stat = "identity", width=1) +
  ggtitle("Proportion of Male's salary") + 
  coord_polar("y", start = 0) + 
  theme_void()

