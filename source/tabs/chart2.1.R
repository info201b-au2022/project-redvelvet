library(tidyverse)
library(ggplot2)
library(plotly)
library(shiny)

# sources server
source("app_server.R")

# read data into chart
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

write.csv(data, file = "salary.csv")

# sets function to call ds
get_df <- function() {
  df <- data %>%
    select(salary, age, sex)
  return(df)
}

# sets function to call plotly chart
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
    ylab("Age") +
    theme(legend.position = "none")
  boxplot <- ggplotly(box_plot)

  return(boxplot)
}

# assigns widget chart and summary to chart 2 tab
tab_chart2 <- tabPanel(
  "Difference of Salary between Male and Female",
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "select",
        label = "Gender",
        choices = c(" Male", " Female")
      )
    ),
    mainPanel(
      plotlyOutput("chart2"),
      p("This plot shows the distribution of salary by age in the dataset, we
      could see the difference of proportion between salary less than 50k and
      Greater than 50k. As you filter for gender, you can see the impacts of 
        the pay gap as they relate to age.")
    )
  )
)
