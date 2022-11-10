# load raw data from CSV in data folder
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

# renders dataframe with relevant values
edu_salary <- salaries_raw %>%
  select(salary, education, education.num, hours.per.week, sex)


# renders plot of education by hours per week by salary type
edu_salary_plot <- ggplot(data = edu_salary) +
  geom_smooth(mapping = aes(x = hours.per.week, y = education.num, color = salary), se = FALSE) +
  scale_color_brewer(palette = "Dark2")

# saves plot as png for output file

ggsave("edu_salary_chart3.png")



