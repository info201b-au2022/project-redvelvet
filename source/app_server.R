# loads relevant packages
library(shiny)
library(plotly)
salaries <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    salaries_work <- salaries %>% select(age, salary, workclass)
      plotly_age(salaries_work)
  })
  
  output$chart3 <- renderPlotly({
    salaries_edu <- get_edu_df()
    filter(salaries_edu, age >= input$age_choice[[1]], 
           age <= input$age_choice[[2]]) %>% 
      plotly_edu()
})

  output$html_doc<-renderUI({
    includeHTML("docs/index.html")
  })
  
  }




