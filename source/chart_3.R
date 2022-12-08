library(tidyverse)
library(ggplot2)

# Load evictions data
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv") #%>%
View(geographics)

year_col <- geographics %>%
  mutate(year =  format(as.Date(date, format="%m/%d/%Y"),"%Y"))
View(year_col)

geo <- year_col %>%
  filter(year == 2018) %>% # keep only 2016 data
  mutate(state = tolower(state)) %>% # replace with lowercase for joining 
  group_by(state) %>%
  summarize(total_deaths_per_state = sum(n_killed))
View(geo)

# Join eviction data to the U.S. shapefile
state_shape <- map_data("state") %>% # load state shapefile
  rename(state = region) %>% # rename for joining
  left_join(geo, by="state") # join eviction data
View(state_shape)

# Draw the map setting the `fill` of each state using its eviction rate
death_distribution_by_state_per_year <- ggplot(state_shape) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = total_deaths_per_state),
    color = "white", # show state outlines
    size = .1        # thinly stroked
  ) +
  coord_map() + # use a map-based coordinate system
  scale_fill_continuous(low = "White", high = "#dd0a35") +
  labs(fill = "Deaths") +
  ggtitle("State death distribution in 2018")
death_distribution_by_state_per_year

