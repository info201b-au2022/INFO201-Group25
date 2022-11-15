library(ggplot2)
library(dplyr)

geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# Create a data frame of city coordinates to display
# cities <- data.frame(
#   city = c("Seattle", "Denver"),
#   lat = c(47.6062, 39.7392),
#   long = c(-122.3321, -104.9903)
# )

cities <- geographics %>%
  filter(state == "Washington") %>%
  mutate(state = tolower(state)) %>% # replace with lowercase for joining 
  rename(lat = latitude) %>%
  rename(long = longitude)
View(cities)

state_shape <- map_data("state") %>% # load state shapefile
  rename(state = region) %>% # rename for joining
  left_join(cities, by="state") # join eviction data
View(state_shape)

# Draw the state outlines, then plot the city points on the map
death_distribution_by_city_in_washington <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group)) +
  geom_point(
    data = cities, # plots own data set
    mapping = aes(x = long, y = lat), # points are drawn at given coordinates
    color = "red"
  ) +
  coord_map() # use a map-based coordinate system
death_distribution_by_city_in_washington

