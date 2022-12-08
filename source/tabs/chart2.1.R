library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

source("app_server.R")
get_df <- function() {
  
  salary_and_gender <- data %>%
    select(sex, salary)
  
  return(salary_and_gender)
}



#gender <- salary_and_gender$sex
#num_of_female <- sum(str_count(gender, " Female"))
#female_data <- filter(salary_and_gender, sex == " Female")

plot_labels <- labs(
  x = "",
  y = "",
  title = "Proportion of female's salary"
)
pie_chart <- function(dataframe) {
  chart <- ggplot(data = salary_df) + 
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

tab_chart2 <- tabPanel(
  "Difference of Salary between Male and Female", 
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "select",
        label = "Gender",
        choices = c("Male", "Female")
      )
     
    )
    ,
    mainPanel(
      plotlyOutput("chart2"),
      p("This plot shows the distribution of salary for female in the dataset, we 
      could see the difference of proportion between salary less than 50k and 
      Greater than 50k.")
  )
  )
)