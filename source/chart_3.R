library(tidyverse)
library(ggplot2)
library(dplyr)
library(maps)

#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#pull the deaths for date into a table
df2 <- data.frame("date" = geographics$date, "deaths" = geographics$n_killed, "state" = geographics$state, "latitude" = geographics$latitude, "longitude" = geographics$longitude)
View(df2)

date <- df2 %>%
  group_by(date) %>%
  mutate(state = tolower(state))
View(date)

#Create US map that shows deaths
mainStates<- map_data("state")%>%
  rename(state = region) %>%
  left_join(date, by = "state")
View(mainStates)

p <- ggplot() +
  geom_polygon( 
    data = mainStates,
    mapping = aes(x = long, y= lat, group = group, fill = deaths),
    fill = "black",
    color = "white",
    size  = 0.1, 
  ) +
  coord_map()+ 
  scale_fill_continuous(low = "#132B43", high = "Red") +
  labs(fill = "Deaths") 
p
