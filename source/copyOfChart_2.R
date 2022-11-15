# Libraries
library(ggplot2)
library(dplyr)

# Get the world polygon and extract UK
library(usmap)
US <- map_data("usa") %>% filter(region=="state")

#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#install.packages("plotly")
library(plotly)
library(ggplot2)
library(dplyr)
library(maps)
library(viridis)

#create state chart
city_death_by_state_chart <- 
  plot_usmap(
    include = c("WA"),
    fill = "light blue") +
  labs(title = "Gun Violence distribution by Cities in different States")
city_death_by_state_chart

UK <- map_data("state") %>% filter(region=="WA")
#data <- world.cities %>% filter(country.etc=="USA")

p <- ggplot() +
  geom_polygon(data = UK, aes(x=long, y = lat, group = group), fill="grey", alpha=0.3) +
  geom_point( data=geographics, aes(x=longitude, y=latitude, size=n_killed, color=n_killed)) +
  scale_size_continuous(range=c(1,12)) +
  scale_color_viridis(trans="log") +
  theme_void() + ylim(50,59) + coord_map() 

ggplotly(p)

