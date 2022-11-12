library(dplyr)
library(tidyverse)
library(lubridate)
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

# State

state <- geographics %>%
  group_by(state) %>%
  summarize(stateDeaths = sum(n_killed))
View(state)

# City

df <- data.frame("city" = geographics$city_or_county, "state" = geographics$state, "deaths" = geographics$n_killed)  
df <- unite(df, "location", city:state, sep = ", " , na.rm = TRUE, remove = FALSE)
View(df)

city <- df %>%
  group_by(location) %>%
  summarize(cityDeaths = sum(deaths))
View(city)

# Date
df2 <- data.frame("date" = geographics$date, "deaths" = geographics$n_killed)
View(df2)

date <- df2 %>%
  group_by(date) %>%
  summarize(totalDeaths = sum(deaths))
View(date)

# date[order(as.Date(date$date, format="%m/%d/%Y")),]

#date %>% arrange(mdy(data$date))
date %>% order(as.Date(date$date, format="%m/%d/%Y"))
