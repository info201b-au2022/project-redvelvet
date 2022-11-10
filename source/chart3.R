# loads relevant packages
library(ggplot2)
library(dplyr)

# load raw data from CSV in data folder
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)



# Renders data frame with relevant features and new names for clarity
salaries_edu <- salaries_raw %>%
  rename(Level.of.Education = education.num) %>%
  select(Level.of.Education, salary, education, sex)

# Renders plot of salary by level of education
job_edu_plot <- ggplot(data = salaries_edu) +
  geom_violin(mapping = aes(x = salary, y = Level.of.Education, fill = salary), position = "fill", trim = FALSE) +
  scale_fill_manual(values = c("#49A4B9", "#2C5985")) +
  scale_x_discrete(labels=c('Less than 50k', 'Greater than 50k')) +
  labs(title = "Education Impacts on Career Outcomes")


  


# saves plot as png for output file

ggsave("edu_salary_chart3.png")
