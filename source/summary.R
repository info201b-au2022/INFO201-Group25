library(dplyr)
library(tidyverse)
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(my_dataframe)
summary_info$some_max_value <- my_dataframe %>%
  filter(some_var == max(some_var, na.rm = T)) %>%
  select(some_label)


# Total Deaths from 2013 - 2018
totalDeaths <- geographics %>%
  

# State with Max Death


# State with Least Death


# City with Max Death


# City with Least Death


# Year with most Death


# Year with least Death


# Date with most Death


# Date with least Death



