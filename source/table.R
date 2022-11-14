library(dplyr)
library(tidyverse)
library(lubridate)
geographics <- read.csv("https://raw.githubusercontent.com/info201b-au2022/INFO201-Group25/main/data/geographics.csv")
View(geographics)

# summary_info.R 
# A source file that takes in a dataset and returns a list of info about it:

source("https://github.com/info201b-au2022/INFO201-Group25/blob/main/source/summary.R")


df <- data.frame(Total_Deaths=c('total_deaths'),
                 f=c(14, 19, 22, 15, 30, 40),
                 )
View(df)
