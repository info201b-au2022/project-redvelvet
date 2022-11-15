library(dplyr)

# Download data
salaries_raw <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-redvelvet/main/data/salary.csv", stringsAsFactors = FALSE)

summary_info <- list()

# Get total participants in data
get_total_participants <- function() {
  return(prettyNum(nrow(salaries_raw)))
}

# Get max age of those in the data
get_max_age <- function() {
  summary_info$max_age <- salaries_raw %>%
    filter(age == max(age)) %>%
    pull(age)
  return(summary_info$max_age[1])
}

# Get min age of those in the data
get_min_age <- function() {
  summary_info$min_age <- salaries_raw %>%
    filter(age == min(age)) %>%
    pull(age)
  return(summary_info$min_age[1])
}

# Get max educations of those in the data
get_max_education <- function() {
  summary_info$max_education <- salaries_raw %>%
    filter(education.num == max(education.num)) %>%
    pull(education)
  return(summary_info$max_education[1])
}

# Get min education of those in the data
get_min_education <- function() {
  summary_info$min_education <- salaries_raw %>%
    filter(education.num == min(education.num)) %>%
    pull(education)
  return(summary_info$min_education[1])
}



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
      us.origin = sum(native.country == " United-States"),
      foreign.origin = sum(native.country != " United-States")
    ) %>%
    arrange(desc(salary))
  return(new_table)
}
