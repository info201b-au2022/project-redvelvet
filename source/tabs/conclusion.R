library(shiny)

source("tabs/chart1.R")
source("tabs/chart3.R")

# Chart 1 Data
chart1_data <- get_age_df() %>%
  group_by(salary, age) %>%
  summarize(total = n()) %>%
  filter(age == 65)

# Chart 3 Data
chart3_data <- get_edu_df() %>%
  group_by(salary, education) %>%
  summarize(total = n()) %>%
  filter(education == " Bachelors")

# Prints onto shiny page text and title tab
conclusion <- tabPanel(
  "Conclusion",
  p(strong("What parts of our identity influences our salary?")),
  p("Our project centers around finding correlations between identity and salary to better communicate any magnified inequalities in the job sector. We selected the key identity variables of age, education level, and gender in our investigation, letting these meld together in our data visualizations to communicate even more possible intersections. With the wealth of information that is being communicated through our charts, it is important to remember the magnitude of these findings and acknowledge that correlation doesn't always equal causation. These plot points, bars, and pie charts do not act in finality, they allow for conversation and acknowledge of anything that may be unrelated in its totality."),
  h3("Chart 1"),
  p("The first chart puts age and salary into comparison, delving further into the hours of employments and its associations with the former variables. There seems, however, to be a potential disconnect with age and salary correlation. At no point does the age have more people making more then $50,000, while increasing the age along the slider it can be seen that the difference becomes increasingly smaller however. At 65 years old, there are ", chart1_data$total[1] - chart1_data$total[2], " more people making less than $50,000 than more than $50,000. Salary and age can be potentially linked because of the steady correlation of the difference as the age of the individual increases, but it is never a sure sign that there is a positive association between age and salary."),
  h3("Chart 2"),
  p("The second chart investigates the relationship between gender and salary, simultaneously comparing them with their respective ages. Comparing the two binary gender we had in our data set doesn't yield much different. Flipping the widget between the two doesn't yield much difference, they're so closely related that they are virtually the same. The mean age for males below $50,000 was 35 years old and above $50,000 was 44 years old, the mean age for females in comparison below $50,000 was 34 years old and above $50,000 was 41 years old. Since these values are so similar, it emphasizes the fact there is no clear sign of correlation between gender and salary."),
  h3("Chart 3"),
  p("The third chart investigates the education impacts on salary outcomes, bringing age into the mix as well. With maintaining the original range and seeing all of the ages represented on the chart, there seems to be a relatively positive correlation with level of education and salary. To a point there seems to be a correlation where higher level of education results in higher salaries, lower level of education to lower salaries. Though this should all be taken to a fault because there is obvious outliers and places where these correlations bleed together. For example, those that got a bachelors", chart3_data$total[1], " people got below $50,000 salary and ", chart3_data$total[2], " people got above $50,000 salary. Even some of those that went to a higher level education weren't able to get paid better than their peers that went on the same path. Due to these semi-inequivalent outcomes, it becomes increasingly difficult to make an informed conclusion on whether higher education means higher salary and would require more research to make a final decision."),
  img("", src = "https://thumbs.dreamstime.com/b/psychology-invent-conception-brain-function-model-mind-85553737.jpg",
      height="50%", width="50%", style="display: block; margin-left: auto; margin-right: auto;")
)
