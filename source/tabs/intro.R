# tab_panel_intro

library(shiny)

# Prints onto shiny page text and title tab
intro <- tabPanel(
  "Introduction",
  img("", src = "https://cdn.pixabay.com/photo/2017/08/30/07/56/clock-2696234_1280.jpg",
      height="50%", width="50%", align="right"),
  h1("Introduction"),
  p(strong("What parts of our identity influences our salary?")),
  p("Our project examines the aspects of a person that influence their resulting salary. We delve into the influences of education, age, and gender, seeking answers to these questions: What effect does an individuals level of education have? What effect does an individuals age have? What effect do gender disparities have? The main purpose of this research is looking for possible inequalities among these intersections between salary and these three identities. This data does not provide a answer with finality because correlations never correspond to causations or ever have solid ties to realities, we respect the ideas of any and all confounding variables that may be affecting these resulting patterns. Thus the purpose is to provide a springboard for curiosity and further questioning of the world around us."),
  h3("Origin of Data"),
  p("The data that we are using for our investigation is from the 1994 census data from the United States, extracted with the help of Ronny Kohavi and Barry Becker working with the Silicon Graphics in Data Mining and Visualization. Coming from a Census that was conducted by the government provides the validity and reliability to allow our findings to have powerful backing and enough evidence to determine any possible correlations between these variables."),
  h3("Problem Domain"),
  p("Much of the sources of inequality of these variables of identity has its origins in built systems. Systematic inequality and the combination of implicit bias disadvantages underprivileged individuals further from easily achieving higher salary outcomes compared to their privileged peers. When considering these outcomes and intersections of variables, these barriers that have been systematically put into place should be considered and kept in conversation throughout the analysis of this research."),
  h3("Key Findings"),
  p("Each of the different tabs above investigates the relationships and correlations between identity and salary. Our first graph suggests that there might be an association with higher salary and age, though it is indeed questionable at times. Our second graph suggests a positive correlation with level of education and salary, though it is clarified that at a point the correlation becomes obsolete to the point that it really doesn't matter.")
)
