library(tidyverse)
library(ggplot2)
library(plotly)
data <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)
salary_and_gender <- data %>%
  select(sex, salary)
View(salary_and_gender)
gender <- salary_and_gender$sex
num_of_female <- sum(str_count(gender, " Female"))
num_of_male <- sum(str_count(gender, " Male"))
male_data <- filter(salary_and_gender, sex == " Male")
female_data <- filter(salary_and_gender, sex == " Female")
plot_labels <- labs(
  x = "",
  y = "",
  title = "Proportion of male's salary"
)
pie_chart_male <- function(male) {
  chart <- ggplot(data = male_data) + 
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
  
  male_salary_chart <- ggplotly(chart)
  
  return(male_salary_chart)
}

tab_chart2.2 <- tabPanel(
  "Difference of Salary between Male and Female", 
  sidebarLayout(
    sidebarPanel(
      inputId = "analysis_var",
      label = "level of analysis",
      choices = c("Male", "Female")
    )
  ),
  mainPanel(
    plotlyOutput("chart2.2"),
    p("This plot shows the distribution of salary for male in the dataset, we 
      could see the difference of proportion between salary less than 50k and 
      Greater than 50k.Compare to female, we could see that male have higher 
      proportion in greater than 50k compare to female.")
  )
)

