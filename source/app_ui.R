
library(shiny)

source("tabs/summary.R")
source("tabs/chart1.R")
source("tabs/chart2.R")
source("tabs/chart2(2).R")
source("tabs/chart3.R")
source("tabs/table.R")


ui <- navbarPage(
  title = "Income and Relation to Social Categories",
  position = "fixed-top",


  # The project introduction
 # tab_panel_intro,

  # The three charts
 # chart1,
 # chart2,
  tab_chart3,


  # The project summary
  # tab_panel_summary,

  # The project report
  #tab_panel_report
)
