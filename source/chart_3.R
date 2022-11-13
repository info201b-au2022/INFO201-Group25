library(tidyverse)
library(ggplot2)
library(dplyr)
library(maps)

StatePopulation <- read.csv("https://raw.githubusercontent.com/ds4stats/r-tutorials/master/intro-maps/data/StatePopulation.csv")
View(StatePopulation)
#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#pull the deaths for date into a table
df2 <- data.frame("date" = geographics$date, "deaths" = geographics$n_killed, "region" = geographics$state)
View(df2)

date <- df2 %>%
  group_by(date) 
View(date)

#Create US map that shows deaths
mainStates<- map_data("state")
View(mainStates)
mergedStates <- inner_join(mainStates, date, by = "region")
View(mergedStates)

p <- ggplot() +
  geom_polygon( 
    data = mergedStates,
    aes(x = long, y= lat, group = group, fill = totalDeaths),
    fill = "black",
    color = "white",
    size  = 0.1, 
  ) +
  coord_map()
p
