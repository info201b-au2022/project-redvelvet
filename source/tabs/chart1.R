# loading packages
library(ggplot2)
library(dplyr)

source("app_server.R")

# loading data from CSV in data folder
salaries <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

# calls data frame
get_age_df <- function() {
 
  salaries_age <- salaries 
  
  return(salaries_age)
}


plotly_age <- function(df){
  age_plot <- ggplot(data = df) +
    geom_bar(aes(x = salary, fill = hours.per.week)) +
    scale_x_discrete("Annual Salary", labels = c("Less than 50k", "Greater than 50k")) +
    scale_y_continuous(name = "Hours Per Week")
  
  salary_age_plot <- ggplotly(age_plot)
  
  return(salary_age_plot)
}

tab_chart1 <- tabPanel(
  "Hours Per Week and Salary by Age",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
      inputId = "age_choice",
      label = "Age",
      min = 17,
      max = 89,
      value = 17
    )
    ),
    mainPanel(
      plotlyOutput("chart1"),
      p("The original plot helps trend Hours Per week with Annual Salary. This will allow the users to view how much effort can result in what level of a salary, encouraging hard work.
        Furthermore, selecting by age can show these trends by age group which will allow the viewers to get an idea of how much effort their age group peers are inputting into their work.")
    )
  )
)