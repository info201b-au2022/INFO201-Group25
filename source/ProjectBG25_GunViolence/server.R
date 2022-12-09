#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(leaflet)
library(mapdata)
library(mapproj)

geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")

state_deaths <- geographics %>%
  group_by(state) %>%
  summarise(total_state_deaths = sum(n_killed)) 

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  output$chart1 <- renderPlot({
    
    state_data <- state_deaths %>%
      filter(state %in% input$Country_1) 
    
    state_bar_chart <- ggplot(
      data = state_data, 
      aes(x = state, 
          y = total_state_deaths)) +
      geom_col(fill = "#dd0a35") +
      labs(y = "Total State Deaths", x = "State") +
      geom_col(fill = "navy blue") +
      geom_col(fill = "#dd0a35") +
      ylim(0, 6000) + 
      ggtitle("State Death Chart ")
    
    return (state_bar_chart)
  })
  
  output$chart2 <- renderLeaflet({
    
    cities <- geographics %>%
      filter(state %in% input$state_var) %>%
      rename(lat = latitude) %>%
      rename(long = longitude)
    
    city_most_deaths <- cities %>% 
      mutate(radius = (n_killed/max(n_killed) * 3)^2)
    
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
    return(death_distribution_by_city_in_washington)
  })
  
  output$chart3 <- renderPlot({
    
    year_col <- geographics %>%
      mutate(year =  format(as.Date(date, format="%m/%d/%Y"),"%Y"))
    
    geo <- year_col %>%
      filter(year %in% input$year_var) %>% # filters by the year input
      mutate(state = tolower(state)) %>% # replace with lowercase for joining 
      group_by(state) %>%
      summarize(total_deaths_per_state = sum(n_killed))
    
    # Join eviction data to the U.S. shapefile
    state_shape <- map_data("state") %>% # load state shapefile
      rename(state = region) %>% # rename for joining
      left_join(geo, by="state") # join eviction data
    
    # Draw the map setting the `fill` of each state using its eviction rate
    death_distribution_by_state_per_year <- ggplot(state_shape) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group, fill = total_deaths_per_state),
        color = "black", # show state outlines
        size = .1        # thinly stroked
      ) +
      coord_map() + # use a map-based coordinate system
      scale_fill_continuous(low = "white", high = "#dd0a35") +
      labs(fill = "Deaths") +
      scale_fill_continuous(low = "Light Blue", high = "Navy") +
      scale_fill_continuous(low = "White", high = "#dd0a35") +
      labs(fill = "Number of Deaths") +
      ggtitle("State death distribution in 2016")
    return(death_distribution_by_state_per_year)
    
  })

})
