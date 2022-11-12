library(tidyverse)
library(ggplot2)
library(dplyr)
#install.packages("usmap")
library(usmap)

#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#pull the deaths for each city/county into a table
city_total_deaths <- geographics %>%
  group_by(city_or_county) %>%
  summarize(total_city_deaths = sum(n_killed))
View(city_total_deaths)

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



