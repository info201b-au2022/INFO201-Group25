library(dplyr)
library(leaflet)
library(ggplot2)

# Read in the dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#Filter to get the specific state user wants to look at
cities <- geographics %>%
  filter(state == "Washington") %>% 
  rename(lat = latitude) %>%
  rename(long = longitude)
View(cities)

# Add a radius column to get the radius of the points to be plotted
city_most_deaths <- cities %>% 
  mutate(radius = (n_killed/max(n_killed) * 3)^2)

# Create map using leaflet that shows the deaths in the cities of specified state
death_distribution_by_city_in_washington <- 
  leaflet(city_most_deaths) %>% 
  addTiles() %>%
  addCircleMarkers(
    lat = ~lat, 
    lng = ~long,
    popup = ~city_or_county, #the points are plotted on the city or county in the dataset
    stroke = FALSE,
    radius = ~radius, # based off the radius created previously by the number of deaths
    fillOpacity = 0.5,
    color = "Red"
  )
death_distribution_by_city_in_washington
