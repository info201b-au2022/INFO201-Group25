library(shiny)
source("server.R")

# Introduction ----
# Define UI for application that draws a histogram 
Introduction <- tabPanel(
  "Introduction",
  titlePanel("Gun Violence in the United States"),
  p("In this project, we will examine the distribution of gun violence – including “homicide, violent crime, attempted suicide, suicide, and unintentional death and injury” (AAFP, 2018) across the United States geographically in terms of state, city, and date. Gun violence threatens the health and safety of all Americans: “Every day in the United States, 93 people die from gunshot wounds and an additional 240 sustain gunshot injuries”. Therefore, this is an extremely important issue to all Americans, and so, through this project, we hope to break things down to better understand which locations within the US are more severely affected by gun violence. There is no solution to this problem yet, so we would like to shed some light on the severity of the gun violence situation within the US." ),
  tags$img(src = 'https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/gun_violence_image_for_intro.jpg', align = 'center', width = '75%', height = 'auto' )
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
      plotOutput("chart1"),
      h3("Analysis"),
      tags$br(),
      p("This data visualization demonstrates the gun violence deaths distribution between the different U.S. states from 2013 to 2018. The user is able to select multiple states and display them on the bar chart. This way, the user can compare the deaths by gun violence from any state(s) they desire. Allowing user to experiment with the data, enables them to select whichever state they desire, enables them to gain a better understanding of the data overall. While comparing states, user can compare which regions have a higher or lower deaths and evaluate whether certain locational factors lead to an increase or decrease in gun violence deaths.")
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
      leafletOutput("chart2"),
      h3("Analysis"),
      tags$br(),
      p("This data visulationation allows audience to gain insight into the general vulnerability of their geographic area to gun violence. By letting user interact with the map, they can develop a more personal interest and have a more in depth understanding of the geographic distribution of gun violence deaths in their local area."),
      p("Overall trends reveal that large cities have more gun violence deaths than rural areas. Another pattern that can be analyze is that the red dots that displays the gun violence deaths often appear near interstate or highways. "),
      p("This chart goes even deeper by showing the spread of gun violence throughout the different cities within the states. You can select a state first, then you will see the state pullled up on the chart with the cities labeled out, you can also see that the exact locations where gun violence has happened is marked in red. This is to further analyze where this gun violence is taking place and what specific locations are at higher risk than others. This can help inform those who are in these areas to be more cautious of their environment so they are able to stay safe.")
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
      plotOutput("chart3"),
      h3("Analysis"),
      tags$br(),
      p("This last chart shows the deaths from gun violence by year. You are able to select which year you want to take a look at and it will display the amount of deaths nationwide that are from gun violence. By looking at the charts you will be able to see that some years have been more deadly than others. This data allows more people to understand the sheer volume of lives we lose to gun violence every year. We can also use this to find patterns to why there is a rise in violence some years. ")
    )
  )
)


# Report ----
Report <- tabPanel(
  "Report",
  titlePanel("Gun Violence in the United States (2013-2018)"),
  p(tags$strong("Project Code Name:"), "De Fab",),
  p(tags$strong("Author:"), "Delaney Wu (delaneyw@uw.edu),  Bich Ngoc (Jada) Nguyen (bndn13@uw.edu), Felix Ung (felixung@uw.edu), Anna Voloshina (aev01@uw.edu)"),
  p("INFO-201: Technical Foundations of Informatics"),
  p("The Information School"),
  p("University of Washington"),
  p("Autumn 2022"),
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
  p("Through the visualization and analysis of gun violence data, we can inform and educate people about the consequences of ignorant and unlawful use of guns and firearms. By presenting these data to people living in regions and communities with frequent gun violence occurring, we can help provide them with information to better understand and minimize future incidences of gun violence. Allowing people to view the data for themselves can help reduce misconceptions that hinder our ability, as a nation, to develop effective gun violence prevention efforts."),
  h2("Research Questions"),
  tags$ul(
    tags$li("How is gun violence distributed geographically across the states in the US?"),
    tags$br(),
    tags$p("Through the question and dataset, we are trying to find out which states are more prone to gun violence. This question is important because it allows us to see which states encounter more violence. Using this data, the government would be able to hone in on certain states in an effort to lower the number of deaths in that state caused by gun violence. By analyzing and interpreting the information produced by this data, people can have a better understanding and be able to gauge the safety of each state. In addition, this analysis and data can aid other research and studies related to gun violence. One way that the analysis of gun violence in each state can aid research progress is by correlating it with gun laws and deaths within a state. For example, studies have shown that the stricter the gun laws, the lower the gun deaths within the state, while the weaker the gun laws, the higher the number of gun deaths. According to CNN news, Mississippi currently leads the US with the weakest gun laws and the highest gun deaths (Tucker, 2022)."),
    tags$li("How is gun violence distributed across all the cities of all the states?"),
    tags$br(),
    tags$p("Through the question and dataset, we are trying to find out which cities are more prone to gun violence. This question is important because it allows us to see which cities encounter more violence. Using this data, the local state government would be able to hone in on certain cities in an effort to lower the number of deaths in that city caused by gun violence and create more localized policies aimed to address the issue. By analyzing the information produced by this data, people can have a better understanding about the frequency of gun violence in their area and pursue measures that can keep them and their local community safe. Similar to how data about gun violence in states can be used to aid research, analysis about gun violence in cities can result in studies such as those reported by backgroundchecks.org. It reports that the city that has the highest mortality rate due to gun violence is St. Louis city, MO, with Hinds County, MS hot on its tail."),
    tags$li("How has gun violence changed over time? Has it increased or decreased? Does a certain area in the US have an increase or decrease in gun violence? Is there a trend in gun violence over time?"),
    tags$br(),
    tags$p("Through this question, we would like to find the trend of gun violence deaths over the years in different regions within the US. This is important because it allows us to see in what direction the US is heading. Depending on the trend shown through our analysis, we would be able to shed light on the severity of the gun violence situation and potentially the overall direction gun violence is moving in."),
  ),
  h2("The Dataset"),
  p("The data set we chose shows the different geographic location of gun violence incidents by types such as by state, by city, and even by congressional district. Through these variables, we can identify regions where gun violence incidents of gun violence have occurred the most between 2013 and 2018. It also allows us to see how the frequency of gun violence changes over time in different areas using the dates provided by the data table."),
  tags$a(href="https://www.kaggle.com/datasets/jameslko/gun-violence-data?resource=download", "Link to Data Set"),
  p("The data set was provided by the Gun Violence Archive (GVA) and published by James Ko through Kaggle. The data specific to this data set was collected from 2013 to 2018. The purpose of this set is to visualize the number of deaths that happen as a result of gun violence, and to help people understand the causes of gun violence and find evidence-based solutions to help with the gun crisis in America. The information provided by the dataset can help communities who frequently face the danger of gun violence It is meant to help find evidence to prove that laws around guns in America need to be changed. The data that GVA collects are from over 7,500  law enforcement, media, government and commercial sources. The sources are government based and collected through national agencies so most would believe it would be closest to accurate. The dataset that would be used in the project  was obtained by searching through the web for data sets related to gun violence."),
  h2("Expected Implications"),
  p("Possible implications of this project may include findings that show how certain regions or locations within the United States are more targeted by gun violence compared to others. By analyzing the geographical location of gun violence incidents, policymakers can use the data to create better policies that can aid and prevent the harm being done to the groups that are affected by the violence. Technologists can also use the data to understand and create more accessible information and services concerning gun safety that can be understood by people of diverse backgrounds. Gun users can view the data and reflect on how they use guns and stay informed with safety precautions and measures of gun and firearm usage in the future. General viewers can use this data to see if they are located in the danger zone so they can better prepare for gun encounters in the future."),
  h2("Limitations"),
  p("Some limitations we might face in this project concerns the data that we use. Our data sets only span four years, from 2013-2018. This means that our data set might not reflect the most recent impact of gun violence in different regions in the United States. In addition, the data set might not include or account for every single gun violence incidence and therefore could make our analysis somewhat less accurate. Another way that our project might have limitations is that the data set only includes the 50 states in the United States and District of Columbia, which means that other U.S. territories will not be represented in our analysis. Without these data points, our analysis might create a skewed visualization of gun violence which in turn can affect how people interpret our data."),
  h2("Findings"),
  p("Findings:
    How does gun violence deaths compare between different states within the US?
    Through the dataset and the first chart we created, we can see that gun violence is distributed diversely throughout the states in the US. According to our data and chart 1 and 3, we can see that California State and Texas State have the highest gun violence deaths compared to other areas of the US. The general trend seems to show that gun violence tends to be higher on the East Coast of the US, with the exception of California State on the West Coast. 
    How is gun violence distributed across all the cities of all the states in the US?
    Through chart 2, we are able to see the distribution of deaths by gun violence across all the cities within a specific state in the US. After going through a few of the options, we found that the gun violence deaths seems to cluster around certain areas/cities of the state and is not distributed evenly throughout the state. Most states only have a few large clusters of deaths with little ones scattered around like outliers on a scatter plot. 
    How has gun violence changed over time? Has it increased or decreased? Does a certain area in the US have an increase or decrease in gun violence? Is there a trend in gun violence over time? 
    Gun violence has increased over time, as we can see through the third chart of our project. All the states seem to have an increase in gun violence and the East Coast of the US seemed to have a more significant increase compared to the West Coast. Once again, the only exception is California. Out of all the States, Texas and Florida seem to have increased the most over the years as can be seen through the color change in our third chart. These three states are all a bright red meaning they hold the highest gun violence deaths out of all the other states in the US. 
  "),
  h2("Discussion"),
  p("Observing gun violence by state it brings to question what kind of laws and policies are currently put into place and how do they differ from other states? As a society this information needs to be brought into the eyes to those in the positions of policymakers in order to stop this trend of gun violence as we have seen the negative implications in our society today. "),
  h2("Conclusions"),
  p("Gun violence has been on the rise over the years and with no solution in sight as a society we must bring awareness to the policymakers of our nation. It is shown that the states with high rates of gun violence are also states with weaker policies set into place and in order to stop gun violence there must be action taken.  "),
  h2("References"),
  tags$ul(
    tags$li("Ko, James. “Gun Violence Data.” Kaggle, 15 Apr. 2018, https://www.kaggle.com/datasets/jameslko/gun-violence-data?resource=download"),
    tags$li("“Gun Violence, Prevention of (Position Paper).” AAFP, 12 Dec. 2019, https://www.aafp.org/about/policies/all/gun-violence.html."),
    tags$li("Lawrence, H. (2022, March 29). Toxic masculinity and gender-based Gun Violence in America: A way forward. SSRN. Retrieved October 31, 2022, from https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4032043"),
    tags$li("Woodcome, Tricia, et al. “Gun Violence Disproportionately and Overwhelmingly Hurts Communities of Color.” Center for American Progress, 3 June 2022, https://www.americanprogress.org/article/gun-violence-disproportionately-and-overwhelmingly-hurts-communities-of-color/"),
    tags$li("Rowlands, DW, and Hanna Love. “Mapping Gun Violence: A Closer Look at the Intersection between Place and Gun Homicides in Four Cities.” Brookings, Brookings, 21 Apr. 2022, https://www.brookings.edu/2022/04/21/mapping-gun-violence-a-closer-look-at-the-intersection-between-place-and-gun-homicides-in-four-cities/"),
    tags$li("Tucker, Emma, and Priya Krishnakumar. “States with Weaker Gun Laws Have Higher Rates of Firearm Related Homicides and Suicides, Study Finds.” CNN, Cable News Network, 27 May 2022, https://www.cnn.com/2022/01/20/us/everytown-weak-gun-laws-high-gun-deaths-study/index.html#:~:text=Mississippi%20has%20the%20weakest%20gun,all%20states%2C%20the%20research%20shows"),
    tags$li("“Gun Ownership in America”. Objective Analysis Effective Solutions, https://www.rand.org/research/gun-policy/gun-ownership.html"),
    tags$li("“U.S. Counties with the Most Gun Deaths.” Background Checks.org, https://backgroundchecks.org/us-counties-with-the-most-gun-deaths.html")
  ),
)

# All Tabs ----
# your two pages defined above
ui <- shinyUI(navbarPage(
  header = tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
      body {
        background-color: #FFFCF6;
        color: #071c21;
      }
      h2 {
        font-weight: bold;
        color: #0f3057;
      }
      h3 {
      font-weight: bold;
      color: #00587a;
      }
      .navbar-default {
      background-color: #0f3057;
      color: white;
      }
      .tab {
      margin: 50%;
      }
                    "
      
    ))
  ),
  "CO2 Emissions",
  Introduction,
  Chart1, 
  Chart2,
  Chart3,
  Report
))