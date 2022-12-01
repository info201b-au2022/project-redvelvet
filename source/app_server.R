
#

library(shiny)

server <- function(input, output) {
  output$chart3 <- renderPlotly({
    filter(salaries_edu, age >= input$age_choice[[1]], age <= input$age_choice[[2]]) %>% 
      plotly_edu()
})
  
}


