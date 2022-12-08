
# laods relevant packages
library(shiny)
library(plotly)

source("tabs/chart1.R")
 source("tabs/chart2.1.R")
source("tabs/chart3.R")
source("tabs/intro.R")
source("tabs/conclusion.R")
source("tabs/report.R")


ui <- navbarPage(
  includeCSS("my_styles.css"),
  
  title = "Income and Relation to Social Categories",


  # The project introduction
  intro,

  # The three charts
  tab_chart1,
  tab_chart2,
  tab_chart3,

  # The project report
  conclusion,
  report
)
