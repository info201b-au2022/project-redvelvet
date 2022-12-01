# loads relevant packages
library(ggplot2)
library(dplyr)

# load raw data from CSV in data folder
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

write.csv(salaries_raw, file = "salary.csv")


# Renders data frame with relevant features and new names for clarity

get_df <- function() {
  salaries_edu <- salaries_raw %>%
    rename(Level.of.Education = education.num) %>%
    select(Level.of.Education, salary, education, sex, age)
  
  return(salaries_edu)
}

# Renders plot of salary by level of education

# function to render plot
plotly_edu <- function() {
  salaries_edu <- get_df()
  
  org_plot <- ggplot(data = salaries_edu) +
    geom_violin(mapping = aes(
      x = salary,
      y = Level.of.Education,
      fill = salary
    )) +
    scale_x_discrete("Annual Salary",
                     labels = c("Less than 50k", "Greater than 50k")
    ) +
    scale_y_continuous(
      name = "Level of Education",
      breaks = c(1, 4, 8, 9, 10, 11, 12, 13, 14, 15, 16),
      labels = c(
        "Pre-school", "Middle School", "Some High School",
        "High School Diploma", "Some College", "Vocational",
        "Associates", "Bachelors", "Masters",
        "Professional", "Doctorate"
      )
    ) +
    labs(title = "Education Impacts on Salary Outcomes") +
    scale_fill_manual(values = c("#49A4B9", "#2C5985")) +
    theme(legend.position = "none")
  
  edu_plot <- ggplotly(org_plot)
  
  return(edu_plot)
}

