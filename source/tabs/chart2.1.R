library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

source("app_server.R")

salary_and_gender <- data %>%
  select(sex, salary)
gender <- salary_and_gender$sex
num_of_female <- sum(str_count(gender, " Female"))
female_data <- filter(salary_and_gender, sex == " Female")

plot_labels <- labs(
  x = "",
  y = "",
  title = "Proportion of female's salary"
)
pie_chart_female <- function(female) {
  chart <- ggplot(data = female_data) + 
    geom_bar(
      mapping = aes(x = "", y = sex, fill = salary), 
      stat = "identity",
      width = 1
    ) + 
    coord_polar("y", start = 0) + 
    plot_labels + 
    theme(
      axis.text = element_blank()
    )
  
  female_salary_chart <- ggplotly(chart)
  
  return(female_salary_chart)
}

tab_chart2_1 <- tabPanel(
  "Difference of Salary between Male and Female", 
  sidebarLayout(
    sidebarPanel(
      inputId = "analysis_var",
      label = "level of analysis",
      choices = c("Male", "Female")
    )
  ),
  mainPanel(
    plotlyOutput("chart2.1"),
    p("This plot shows the distribution of salary for female in the dataset, we 
      could see the difference of proportion between salary less than 50k and 
      Greater than 50k.")
  )
)