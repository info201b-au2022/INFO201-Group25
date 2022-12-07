library(shiny)
source("server.R")

# Introduction ----
# Define UI for application that draws a histogram 
Introduction <- tabPanel(
  "Introduction",
  titlePanel("CO2 Emission from 1921 - 2021"),
  h3("Background"),
  p(""),
  h3("Objective"),
  p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
  tags$ul(
    tags$li(tags$strong("coal_co2: "), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	"),
    tags$li(tags$strong("gas_co2: "), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    tags$li(tags$strong("oil_co2: "), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	")
  ),
  h3("Analyzing the Trend"),
  p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. " )
)

# Chart 1 ----
Chart1 <- tabPanel(
  "Chart 1",
  titlePanel("Comparison of Gun Violence Deaths between States"),
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        selectInput(inputId = "Country_1", 
                    label = h3("Select Country"),
                    choices = state_deaths$state,
                    #choices = list("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"), 
                    selected = "Alabama",
                    multiple = TRUE)
      )
    ),
    mainPanel(
      plotOutput("chart1")
    )
  )
)

# Chart 2 ----
Chart2 <- tabPanel(
  "Chart 2",
  titlePanel("Gun Violence Deaths by Cities"),
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        selectInput(
          inputId = "state_var",
          label = "State Name",
          choices = state_deaths$state,
          selected = "Alabama"
        )
      )
    ),
    mainPanel(
      leafletOutput("chart2")
    )
  )
)

# Chart 3 ----
Chart3 <- tabPanel(
  "Chart 3",
  titlePanel("Distribution of Gun Violence Deaths by Year"),
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        selectInput(
          inputId = "year_var",
          label = "Year Variable",
          choices = list("2013", "2014", "2015", "2016", "2017", "2018"),
          selected = "2013"
        )
      )
    ),
    mainPanel(
      plotOutput("chart3")
    )
  )
)


# Report ----
Report <- tabPanel(
  "Report",
  titlePanel("Gun Violence in the United States (2013-2018)"),
  h2("Abstract"),
  p("Our main question is: “How is gun violence distributed throughout the United States?” This question is important because it allows us to see what locations are most affected by gun violence. To address this question, we will compare the deaths of individuals in different states, cities, and the overall trend throughout the years."),
  h2("Problem Domain"),
  h3("Problem Framing"),
  p("The problem domain in this project is gun violence. Gun violence has long been a social issue in the United States. It is experienced everywhere in the U.S. and “homicide increases” are “driven predominantly by increases in neighborhoods where gun violence has long been a persistent fixture of daily life, alongside systemic disinvestment, segregation, and economic inequality.” (Rowlands, 2022). By analyzing the data set, we aim to find the trend of gun violence geographically throughout the United States and over time."),
  h3("Human Values"),
  p("Human values that are within and/or connected to gun violence are protection, self-defense, quality of life, and safety. Having access to guns is a right provided to people in the US for self-defense and protection. Yet some take advantage of these rights to cause harm to others which affects their quality of life and safety."),
  h3("Stakeholders"),
  tags$ul(
    tags$li("The ", tags$strong("direct stakeholders"), " of this project are the people that are living in regions where gun violence incidents are most prone to happen.  "),
    tags$li("The", tags$strong("indirect stakeholders"), "of this project are everyone who is not physically involved but have the risk of experiencing gun violence"),
  ),
  h3("Benefits & Harm"),
  p(""),
  h2("Research Questions"),
  p(""),
  h2("The Dataset"),
  p(""),
  h2("Expected Implications"),
  p(""),
  h2("Limitations"),
  p(""),
  h2("Conclusions"),
  p(""),
  h2("References"),
  p(""),
)

# All Tabs ----

# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- shinyUI(navbarPage(
  "CO2 Emissions",
  Introduction,
  Chart1, 
  Chart2,
  Chart3,
  Report
))