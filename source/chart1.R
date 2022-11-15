# loading packages
library(ggplot2)
library(dplyr)

# loading data from CSV in data folder
salaries <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

salaries_age <- salaries %>% select(age, salary)

age_graph <- ggplot(data = salaries_age) +
  geom_bar(aes(x = salary, fill = age)) +
  scale_x_discrete("Annual Salary", labels = c("Less than 50k", "Greater than 50k")) +
  scale_y_continuous(name = "Age Vs Salary")

plot_age <- function(){
  plot(age_graph)
}
