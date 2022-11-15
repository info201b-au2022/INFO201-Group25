library(dplyr)
library(leaflet)
library(ggplot2)

geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

cities <- geographics %>%
  filter(state == "Washington") %>%
  mutate(state = tolower(state)) %>% # replace with lowercase for joining 
  rename(lat = latitude) %>%
  rename(long = longitude)
View(cities)

city_most_deaths <- cities %>% 
  mutate(radius = (n_killed/max(n_killed) * 3)^2)

# Remake the map from above, specifying the `radius` column as the radius
death_distribution_by_city_in_washington <- leaflet(city_most_deaths) %>% 
  addTiles() %>%
  addCircleMarkers(
    lat = ~lat, 
    lng = ~long,
    popup = ~city_or_county,
    stroke = FALSE,
    radius = ~radius,
    fillOpacity = 0.5
  )
death_distribution_by_city_in_washington

