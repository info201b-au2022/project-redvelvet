# loads relevant packages
library(shiny)
library(plotly)
salaries <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  # assigns chart1 output
  output$chart1 <- renderPlotly({
    workclassdf <- get_age_df()
    filter(workclassdf, hours.per.week == input$hours_choice) %>% plotly_age()
  })

  # assigns chart2 output
  output$chart2 <- renderPlotly({
    genderdf <- get_df()
    filter(genderdf, sex == input$select) %>%
      plotly_box()
  })

  # assigns chart3 output
  output$chart3 <- renderPlotly({
    salaries_edu <- get_edu_df()
    filter(
      salaries_edu, age >= input$age_choice[[1]],
      age <= input$age_choice[[2]]
    ) %>%
      plotly_edu()
  })

  output$html_doc <- renderUI({
    includeHTML("docs/index.html")
  })
}
