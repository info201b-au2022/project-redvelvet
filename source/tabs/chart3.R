# loads relevant packages
library(ggplot2)
library(dplyr)

source("app_server.R")

# load raw data from CSV in data folder
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

write.csv(salaries_raw, file = "salary.csv")


# stores range of values in age
age_range <- range(salaries_raw$age)

# sets range slider input
age_input <- sliderInput(
  inputId = "age_choice",
  label = "Age",
  min = age_range[1],
  max = age_range[2],
  value = age_range
)

# Renders data frame with relevant features and new names for clarity

  salaries_edu <- salaries_raw %>%
    rename(Level.of.Education = education.num) %>%
    select(Level.of.Education, salary, education, sex, age)
  

# function to render plot
plotly_edu <- function() {
  
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

tab_chart3 <- tabPanel(
  titlePanel("Education and Income by Age"),
  sidebarLayout(
    sidebarPanel(
     sliderInput(
        inputId = "age_choice",
        label = "Age",
        min = age_range[1],
        max = age_range[2],
        value = age_range)
    ),
    mainPanel(
      plotOutput("chart3"),
    )
  )
  
  
)

