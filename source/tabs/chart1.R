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
    geom_bar(aes(x = salary, fill = age)) +
    scale_x_discrete("Annual Salary", labels = c("Less than 50k", "Greater than 50k")) +
    scale_y_continuous(name = "Age", breaks = c(5000, 10000, 15000, 20000, 25000),
                       labels = c("20", "30", "40", "50", "60"))
  
  salary_age_plot <- ggplotly(age_plot)
  
  return(salary_age_plot)
}

tab_chart1 <- tabPanel(
  "Age and Salary by Workclass",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
      inputId = "hours_choice",
      label = "Hours",
      min = 1,
      max = 99,
      value = 40
    )
    ),
    mainPanel(
      plotlyOutput("chart1"),
      p("This plot allows us to graph the variation in Salary among surveyed individuals in this study, and categorize by type of employment. 
        Doing this, gives us an insight into how these different types of employment cause variation in income, and by what level. 
        Furthermore, one can use this data to gain knowledge on different types of employment, and shift their aims and goals based on their desire to earn a specific way.")
    )
  )
)