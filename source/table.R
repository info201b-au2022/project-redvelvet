library(dplyr)

# Download data
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

# Create aggregated table of data
get_table <- function() {
  new_table <- salaries_raw %>%
    group_by(salary) %>%
    summarize(
      HS.Diploma.Or.Less = sum(education == " Preschool" |
                                 education == " 1st-4th" |
                                 education == " 5th-6th" |
                                 education == " 7th-8th" |
                                 education == " 9th" |
                                 education == " 10th" |
                                 education == " 11th" |
                                 education == " 12th" |
                                 education == " HS-grad"),
      College.Or.More = sum(education == " Some-college" |
                              education == " Assoc-acdm" |
                              education == " Assoc-voc" |
                              education == " Bachelors" |
                              education == " Masters" |
                              education == " Doctorate"),
      age.17_39 = sum(age >= 20 & age <= 39),
      age.40_90 = sum(age >= 40 & age <= 90),
      female = sum(sex == " Female"),
      male = sum(sex == " Male")) %>%
    arrange(desc(salary))
  return(new_table)
}