# loads relevant packages
library(ggplot2)
library(dplyr)
library(plotly)

# source relevant file
source("app_server.R")

# load raw data from CSV in data folder
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

write.csv(salaries_raw, file = "salary.csv")

# Renders data frame with relevant features and new names for clarity
get_edu_df <- function() {
  salaries_edu <- salaries_raw %>%
    rename(Level.of.Education = education.num) %>%
    select(Level.of.Education, salary, education, sex, age)
  return(salaries_edu)
}

# renders caption
# get_capt <- eventReactive(input$capt, {
# caption <- paste("This plot offers helpful insights into the return on investment of
# post-secondary education and the impact of education on future outcomes.
# American post-secondary education is increasingly a luxury. While education and
# salary outcomes are often correlated, a college degree is not essential for
# success. Individuals considering a post-secondary degree should make
# informed decisions about their future. This visualization highlights the
# correlation between salary and education level, but also clarifies
# the limits of this correlation.")
# })


# function to render plot
plotly_edu <- function(df) {
  org_plot <- ggplot(data = df) +
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
      breaks = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16),
      labels = c(
        "Pre-school", "1st-4th Grade", "5th-6th Grade", "7th-8th Grade",
        "9th Grade", "10th Grade", "11th Grade", "12th Grade",
        "High School Diploma", "Some College", "Vocational Associates Degree",
        "Academic Associates Degree", "Bachelors", "Masters",
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
"Education and Income by Age",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "age_choice",
        label = "Age",
        min = 17,
        max = 89,
        value = c(17, 89)
      )
      # , actionButton(
      # inputId = "capt",
      # label = "Reveal Insights",
      # icon("paper-plane"),
      #  style = "color: #fff; background-color: #337ab7;
      #           border-color: #2e6da4" )
    ),
    mainPanel(
      plotlyOutput("chart3"),
      p("This plot offers helpful insights into the return on investment of
        post-secondary education and the impact of education on future outcomes.
        American post-secondary education is increasingly a luxury. While education and
        salary outcomes are often correlated, a college degree is not essential for
        success. Individuals considering a post-secondary degree should make
        informed decisions about their future. This visualization highlights the
        correlation between salary and education level, but also clarifies
        the limits of this correlation.")
    )
  )
)
