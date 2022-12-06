# tab_panel_intro

library(shiny)

# Prints onto shiny page text and title tab
conclusion <- tabPanel(
  "Conclusion",
  p(strong("What parts of our identity influences our salary?")),
  p(""),
  img("", src = "https://thumbs.dreamstime.com/b/psychology-invent-conception-brain-function-model-mind-85553737.jpg",
      height="50%", width="50%", style="display: block; margin-left: auto; margin-right: auto;")
)
