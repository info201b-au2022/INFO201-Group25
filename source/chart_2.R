library(tidyverse)
library(ggplot2)
library(dplyr)
#install.packages("usmap")
library(usmap)

#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#pull the deaths for each city/county into a table
df <- data.frame("city" = geographics$city_or_county, "state" = geographics$state, "deaths" = geographics$n_killed)  
df <- unite(df, "location", city:state, sep = ", " , na.rm = TRUE, remove = FALSE)
View(df)

city <- df %>%
  group_by(location) %>%
  summarize(cityDeaths = sum(deaths))
View(city)

#create state chart
city_death_by_state_chart <- 
  plot_usmap(
    include = c("WA"),
    fill = "light blue") +
  geom_point(data = city_total_deaths,
             aes(x = long, y = lat),
             color = "gold") +
  labs(title = "Gun Violence distribution by Cities in different States")
city_death_by_state_chart



