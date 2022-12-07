#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  output$chart1 <- renderPlot({
    state_bar_chart <- ggplot(
      data = state_deaths, 
      aes(x = state, 
          y = total_state_deaths)) +
      geom_col(fill = "navy blue") +
      ylim(0, 6000) + 
      ggtitle("State Death Chart ")
    return (state_bar_chart)
  })

})
