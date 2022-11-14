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


map1 <- ggplot(city, aes( x = city , y = deaths, group=group)) + 
  geom_polygon(aes(fill = df), color = "black")
map1



library(ggplot2)
library(maps)
library(mapdata)

usa <- map_data('city')
View(usa)



install.packages("plyr")
library(plyr)
usa_city <- rbind.fill(usa, city)
View(usa_city)

mapdata1 <- usa_city %>% filter(!is.na(usa_city$location))
View(mapdata1)



map_1 <- ggplot(usa_city, aes( x = long , y = lat, group=group)) + 
  geom_polygon(aes(fill = cityDeaths), color = "black")
map_1


