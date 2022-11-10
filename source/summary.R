library(dplyr)
demographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/demographics.csv")
View(demographics)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(demographics)
summary_info$race_max_deaths <- demographics %>%
  filter(TotalDeaths == max(TotalDeaths, na.rm = T)) %>%
  select(Ethnicity)
summary_info$gender_max_deaths <- demographics %>%
  filter(TotalDeaths == max(TotalDeaths, na.rm = T)) %>%
  select(Gender)

