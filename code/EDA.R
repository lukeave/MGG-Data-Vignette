library(ggplot2)
library(tidyverse)
library(stringr)

# note: for the analysis I need to create a df grouped by city, state, and year, with the total locations for each city-state-year combo, the relative percentage of cruisy areas for each city-state-year combo, and the relative percentage of risky areas for each city-state-year combo.

# load data
data <- read.csv("data/data.csv")

#### First Inspections ####
str(data) # check the variable types

data$lat <- as.numeric(data$lat) # make latitude numeric
data$lon <- as.numeric(data$lon) # make longitude numeric
na_indices <- which(is.na(data$lat) | is.na(data$lon)) # find NA values in lat/lon
print(na_indices) # no NAs

table(data$Year) # check if all years are present

locations_count_per_year <- data %>%  # check total count of locations per year
  group_by(Year) %>% 
  summarize(count = n())
table(locations_count_per_year$count)

write.csv(locations_count_per_year, "data/location_count.csv") # store locations count as new file


#### Exploratory Questions ####

# how many entries are simultaneously cruisy and risky?
cruisy_and_risky <- data %>% 
  filter(cruisy == "TRUE" & risky == "TRUE") # 10147 observations

# how many entries are cruisy but not risky?
cruisy_NOT_risky <- data %>% 
  filter(cruisy == "TRUE" & risky == "FALSE") # 25128 observations

# how many entries are risky but not cruisy?
risky_NOT_cruisy <- data %>% 
  filter(cruisy == "FALSE" & risky == "TRUE") # 583 observations

# TEST GROUPS ####

#data("mtcars") 
#test <- mtcars %>% group_by(cyl)

#test <- test %>% summarise(
#  disp = mean(disp),
#  hp = mean(hp)
#)

statistics <- data %>%  # create statistics data frame
  select(city, state, Year, lat, lon, unclear_address, category, cruisy, risky) 

statistics %>% filter(city == "")
