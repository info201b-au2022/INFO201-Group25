library(dplyr)
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

# State

stateDF <- geographics %>%
  group_by(state) %>%
  summarize(stateDeaths = sum(n_killed))
View(stateDF)


