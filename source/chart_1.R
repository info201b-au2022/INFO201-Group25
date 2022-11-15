library(tidyverse)
library(ggplot2)
library(dplyr)
#Read in the geographics csv dataset
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

#pull the deaths for each state into a table
state_deaths <- geographics %>%
  group_by(state) %>%
  summarise(total_state_deaths = sum(n_killed)) 
View(state_deaths)

# Create histogram displaying the deaths in each state
state_bar_chart <- state_deaths %>%
  #filter(state == "Washington") %>%
  ggplot(aes(x = state, y = total_state_deaths)) +
  geom_bar(stat = "identity", fill = "navy blue") +
  ylim(0, 6000) + 
  ggtitle("State Death Chart ")
state_bar_chart

