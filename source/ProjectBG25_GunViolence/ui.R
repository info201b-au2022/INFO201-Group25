library(shiny)
source("server.R")

# Introduction ----
# Define UI for application that draws a histogram 
Introduction <- tabPanel(
  "Introduction",
  titlePanel("Gun Violence in the United States"),
  p("In this project, we will examine the distribution of gun violence – including “homicide, violent crime, attempted suicide, suicide, and unintentional death and injury” (AAFP, 2018) across the United States geographically in terms of state, city, and date. Gun violence threatens the health and safety of all Americans: “Every day in the United States, 93 people die from gunshot wounds and an additional 240 sustain gunshot injuries”. Therefore, this is an extremely important issue to all Americans, and so, through this project, we hope to break things down to better understand which locations within the US are more severely affected by gun violence. There is no solution to this problem yet, so we would like to shed some light on the severity of the gun violence situation within the US." ),
  tags$img(src = '', align = 'left')
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