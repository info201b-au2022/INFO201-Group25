library(dplyr)
library(tidyverse)
library(lubridate)
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# Total Deaths from 2013 - 2018
total_deaths <- sum(geographics$n_killed)
print(total_deaths)

# State with total max death
state_deaths <- geographics %>%
  group_by(state) %>%
  summarise(total_state_deaths = sum(n_killed)) 

max_state_deaths <- state_deaths %>%
  filter(total_state_deaths == max(total_state_deaths)) %>%
  pull(state)
print(max_state_deaths)

# State with Least Death
min_state_deaths <- state_deaths %>%
  filter(total_state_deaths == min(total_state_deaths)) %>%
  pull(state)
print(min_state_deaths)

# City with Max Death
geo_with_location <- 
  unite(geographics, "location", city_or_county:state, sep = ", " , na.rm = TRUE, remove = FALSE)
View(geo_with_location)


location_deaths <- geo_with_location %>%
  group_by(location) %>%
  summarise(total_city_deaths = sum(n_killed)) 
View(location_deaths)

max_city_deaths <- location_deaths %>%
  filter(total_city_deaths == max(total_city_deaths)) %>%
  pull(location)
print(max_city_deaths)

# Cities with Least Death (0s)
min_city <- location_deaths %>%
  filter(total_city_deaths == min(total_city_deaths)) 

min_city_deaths <- nrow(min_city)
print(min_city_deaths)


#select year from date
year_col <- geographics %>%
  mutate(year =  format(as.Date(date, format="%m/%d/%Y"),"%Y"))
View(year_col)

# Year with most Death
year_deaths <- year_col %>%
  group_by(year) %>%
  summarise(total_year_deaths = sum(n_killed)) 
View(year_deaths)

max_year_deaths <- year_deaths %>%
  filter(total_year_deaths == max(total_year_deaths)) %>%
  pull(year)
print(max_year_deaths)


# Year with least Death
min_year_deaths <- year_deaths %>%
  filter(total_year_deaths == min(total_year_deaths)) %>%
  pull(year)
print(min_year_deaths)


# Date with most Death
date_deaths <- geographics %>%
  group_by(date) %>%
  summarise(total_date_deaths = sum(n_killed)) 
View(date_deaths)

max_date_deaths <- date_deaths %>%
  filter(total_date_deaths == max(total_date_deaths)) %>%
  pull(date)
print(max_date_deaths)

# Date with least Death
min_date <- date_deaths %>%
  filter(total_date_deaths == min(total_date_deaths))

min_date_deaths <- nrow(min_date)
print(min_date_deaths)




summary_table <- data.frame(total_Deaths=c(total_deaths),
                 state_Max_Total_Death=c(max_state_deaths),
                 state_Min_Total_Death=c(min_state_deaths),
                 city_Max_Total_Death=c(max_city_deaths),
                 cities_Least_Total_Death=c(min_city_deaths),
                 year_Max_Total_Death=c(max_year_deaths),
                 year_Min_Total_Death=c(min_year_deaths),
                 date_Max_Death=c(max_date_deaths),
                 dates_Least_Total_Death=c(min_date_deaths))

colnames(summary_table) = c("Total Deaths","State with Most Total Deaths","State with Least Total Deaths", "City with Most Total Deaths", "Cities with Least Total Deaths (0)", "Year with Most Deaths", "Year with Least Deaths", "Date with Most Deaths", "Dates with Lead Deaths (0)")

summary_table_verticle <- as.data.frame(t(summary_table))
View(summary_table_verticle)
