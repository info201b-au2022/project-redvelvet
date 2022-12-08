library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

source("app_server.R")
get_df <- function() {
  df <- data %>%
    select(salary, age, sex)
    return(df)
}
  
  plotly_box <- function(df) {
    box_plot <- ggplot(data = df) +
      geom_boxplot(mapping = aes(
        x = salary,
        y = age,
        fill = salary
      )) +
      scale_x_discrete("Annual Salary",
                       labels = c("Less than 50k", "Greater than 50k")
      ) +
      labs(title = "Age and Salary by Gender") +
      theme(legend.position = "none")
    boxplot <- ggplotly(box_plot)
    
    return(boxplot)
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