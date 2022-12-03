# loads relevant packages
library(shiny)
library(plotly)



server <- function(input, output) {
  output$chart3 <- renderPlotly({
    salaries_edu <- get_edu_df()
    filter(salaries_edu, age >= input$age_choice[[1]], 
           age <= input$age_choice[[2]]) %>% 
      plotly_edu()
})
  output$caption <- renderText({
    get_capt()
  })
  
}




