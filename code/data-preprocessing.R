library(tidyverse)
library(stringr)
completedata <- read.csv("data/data.csv")
old.data <- read.csv("../Data Vignette [second iteration]/data/mggcompletedata.csv") # for comparison

#### Fix Lat/Long errors ####

# first observable error
completedata[146207, 12] <- "35.138866" # fix latitude value, previously "Madison & Cleveland"
completedata[146207, 13] <- "-90.016387" # adjust longitude value, previously "-90.01661"

# look for similar lat/lon errors
completedata$lat <- as.numeric(completedata$lat) # check if latitude only contain numeric values
completedata$lon <- as.numeric(completedata$lon) # check if longitude only contain numeric values
na_indices <- which(is.na(completedata$lat) | is.na(completedata$lon)) # find NA values in lat/lon
print(na_indices)
# 63 rows with NA lat/long values

for (i in na_indices) {
  print(paste("row ID =", completedata[i, 1],"; ", completedata[i, 7], ", ", completedata[i, 8]))
}

HartfordCT <- c(320, 31777, 53490)
completedata[HartfordCT, 12] <- "41.765804"
completedata[HartfordCT, 13] <- "-72.673372"

LasVegasNV <- c(13524, 13724, 51432, 51662)
completedata[LasVegasNV, 12] <- "36.171563"
completedata[LasVegasNV, 13] <- "-115.139101"

EastStroudsburgPA <- c(1381, 1382, 1383, 54758)
completedata[EastStroudsburgPA, 12] <- "41.003052"
completedata[EastStroudsburgPA, 13] <- "-75.181755"

MontgomeryvillePA <- c(1398, 33082, 54779, 54780)
completedata[MontgomeryvillePA, 12] <- "40.247329"
completedata[MontgomeryvillePA, 13] <- "-75.243785"

AtlantaGA <- c(2067, 35786, 57754, 58368, 58392, 58480, 60862)
completedata[AtlantaGA, 12] <- "33.750128"
completedata[AtlantaGA, 13] <- "-84.388521"

BurlingtonVT <- 2477
completedata[BurlingtonVT, 12] <- "44.475883"
completedata[BurlingtonVT, 13] <- "-73.212072"

ColumbusOH <- 2953
completedata[ColumbusOH, 12] <- "39.961176"
completedata[ColumbusOH, 13] <- "-82.998794"

DallasTX <- c(3025, 38892) 
completedata[DallasTX, 12] <- "32.776664"
completedata[DallasTX, 13] <- "-96.796988"

MadisonWI <- 4419
completedata[MadisonWI, 12] <- "43.072166"
completedata[MadisonWI, 13] <- "-89.40075"

CazaderoCA <- 51910
completedata[CazaderoCA, 12] <- "38.533234"
completedata[CazaderoCA, 13] <- "-123.085285"

LosAngelesCA <- 53258
completedata[LosAngelesCA, 12] <- "34.054908"
completedata[LosAngelesCA, 13] <- "-118.242643"

OlympiaWA <- c(5353, 39226, 55574)
completedata[OlympiaWA, 12] <- "47.037874"
completedata[OlympiaWA, 13] <- "-122.900695"

PhiladelphiaPA <- c(5581, 38522, 55483, 55654)
completedata[PhiladelphiaPA, 12] <- "39.952584"
completedata[PhiladelphiaPA, 13] <- "-75.165221"

RiverNorthIL <- c(6085,58043)
completedata[RiverNorthIL, 12] <- "41.892385"
completedata[RiverNorthIL, 13] <- "-87.634075"

SeattleWA <- c(6812, 39305, 55655)
completedata[SeattleWA, 12] <- "47.606139"
completedata[SeattleWA, 13] <- "-122.332848"

SedonaAZ <- 6838
completedata[SedonaAZ, 12] <- "34.86974"
completedata[SedonaAZ, 13] <- "-111.76099"

WesterlyRI <- 7549
completedata[WesterlyRI, 12] <- "41.37668"
completedata[WesterlyRI, 13] <- "-71.828808"

BakersfieldCA <- 33822
completedata[BakersfieldCA, 12] <- "35.373292"
completedata[BakersfieldCA, 13] <- "-119.018712"

SacramentoCA <- 34402
completedata[SacramentoCA, 12] <- "38.578134"
completedata[SacramentoCA, 13] <- "-121.494421"

SanFranciscoCA <-34660
completedata[SanFranciscoCA, 12] <- "37.77493"
completedata[SanFranciscoCA, 13] <- "-122.419415"

KeyWestFL <- 35412
completedata[KeyWestFL, 12] <- "24.555059"
completedata[KeyWestFL, 13] <- "-81.779987"

MiamiBeachFL <- c(35573, 35593, 55573, 55582)
completedata[MiamiBeachFL, 12] <- "25.790654"
completedata[MiamiBeachFL, 13] <- "-80.130045"

VolcanoVillageHI <- 35898
completedata[VolcanoVillageHI, 12] <- "19.428232"
completedata[VolcanoVillageHI, 13] <- "-155.235163"

BoiseID <- c(35989, 55684)
completedata[BoiseID, 12] <- "43.615019"
completedata[BoiseID, 13] <- "-116.202314"

CentrevilleIL <- 36024
completedata[CentrevilleIL, 12] <- "38.929256"
completedata[CentrevilleIL, 13] <- "-90.571541"

ChicagoIL <- 36147
completedata[ChicagoIL, 12] <- "41.878114"
completedata[ChicagoIL, 13] <- "-87.629798"

GaryIN <- 36227
completedata[GaryIN, 12] <- "41.60204"
completedata[GaryIN, 13] <- "-87.337152"

NewOrleansLA <- 36476
completedata[NewOrleansLA, 12] <- "29.950894"
completedata[NewOrleansLA, 13] <- "-90.075836"

LincolnNE <- 37333
completedata[LincolnNE, 12] <- "40.813663"
completedata[LincolnNE, 13] <- "-96.702576"

ManchesterVT <- 39129
completedata[ManchesterVT, 12] <- "43.163539"
completedata[ManchesterVT, 13] <- "-73.072082"

YborCityFL <- 55319
completedata[YborCityFL, 12] <- "27.970312"
completedata[YborCityFL, 13] <- "-82.422306"

SalemOR <- 55423
completedata[SalemOR, 12] <- "44.942898"
completedata[SalemOR, 13] <- "-123.035096"

LittleRockAK <- 55474
completedata[LittleRockAK, 12] <- "34.744462"
completedata[LittleRockAK, 13] <- "-92.288016"

GuernevilleCA <- 55482
completedata[GuernevilleCA, 12] <- "38.501858"
completedata[GuernevilleCA, 13] <- "-122.99611"

DetroitMI <- 55511
completedata[DetroitMI, 12] <- "42.331427"
completedata[DetroitMI, 13] <- "-83.045754"

CharlotteNC <- 55543
completedata[CharlotteNC, 12] <- "35.227087"
completedata[CharlotteNC, 13] <- "-80.843127"

WashingtonDC <- 55626
completedata[WashingtonDC, 12] <- "38.907192"
completedata[WashingtonDC, 13] <- "-77.036871"

WilmingtonDE <- 55639
completedata[WilmingtonDE, 12] <- "39.744655"
completedata[WilmingtonDE, 13] <- "-75.548391"

EugeneOR <- 55682
completedata[EugeneOR, 12] <- "44.052069"
completedata[EugeneOR, 13] <- "-123.086754"

GalvestonTX <- 55683
completedata[GalvestonTX, 12] <- "29.301348"
completedata[GalvestonTX, 13] <- "-94.797696"

SanJoseCA <- 56956
completedata[SanJoseCA, 12] <- "37.33874"
completedata[SanJoseCA, 13] <- "-121.885252"

PortlandOR <- 60670
completedata[PortlandOR, 12] <- "45.515232"
completedata[PortlandOR, 13] <- "-122.678385"

new_na_indices <- which(is.na(completedata$lat) | is.na(completedata$lon)) # check if NA values in lat/lon are removed
print(new_na_indices)

#### Collapse types into new categories ####

##Hierarchy of Analytic Categories
## 1. Religious Institutions
### 1.1. Spiritual Groups
### 1.2. Church
## 2. Accommodations
### 2.1. Hotels
## 3. Bars
## 4. Restaurants
### 4.1. Cafes
## 5. Gyms
### 5.1. Health Clubs
## 6. Bath Houses
## 7. Businesses
### 7.1. Travel; Tour
### 7.2. Shops; Erotica; Bookstores
### 7.3. Theaters
### 7.4. Services (including Info Lines)
## 8. Organizations
#### 8.1. Community Centers
#### 8.2. Publications
### 8.3. Hotlines
### 8.4. Men's Club
## 9. Cruising Areas
### 9.1. Cruisy + Cruising
## 10. Entertainment
### 10.1. Entertainment & Recreation
### 10.2. Nightclubs
### 10.3. Sex Clubs

# account for typos in type
completedata <- completedata %>% mutate(type = fct_collapse(type, "Accommodations" = c("Accommodations", "Accomodations", "Stage Door")))

completedata <- completedata %>% mutate(type = fct_collapse(type, "Organizations" = c("Organization", "Organizations")))

completedata <- completedata %>% mutate(type = fct_collapse(type, "Religious Institutions" = c("Religious Institution", "Religious Organizations", "Religious Organization")))


# collapse types in new variable "category"
completedata$category <- ifelse(grepl('Religious', completedata$type), "Religious Institutions",
                                      ifelse(grepl('Spiritual', completedata$type), "Religious Institutions",
                                             ifelse(grepl('Church', completedata$type), "Religious Institutions",
                                             ifelse(grepl('Hotel', completedata$type), "Accommodations",
                                                    ifelse(grepl('Accommodation', completedata$type), "Accommodations",
                                                           ifelse(grepl('Bar', completedata$type), "Bars",
                                                                  ifelse(grepl('Restaurant', completedata$type), "Restaurants",
                                                                         ifelse(grepl('Cafe', completedata$type), "Restaurants",
                                                                                ifelse(grepl('Gym', completedata$type), "Gyms",
                                                                                       ifelse(grepl('Health', completedata$type), "Gyms",
                                                                                              ifelse(grepl('Bath', completedata$type), "Bath Houses",
                                                                                                     ifelse(grepl('Business', completedata$type), "Businesses",
                                                                                                            ifelse(grepl('Travel', completedata$type), "Businesses",
                                                                                                                   ifelse(grepl('Tour', completedata$type), "Businesses",
                                                                                                                          ifelse(grepl('Shop', completedata$type), "Businesses",
                                                                                                                                 ifelse(grepl('Erotica', completedata$type), "Businesses",
                                                                                                                                        ifelse(grepl('Book', completedata$type), "Businesses",
                                                                                                                                               ifelse(grepl('Theat', completedata$type), "Businesses",
                                                                                                                                                      ifelse(grepl('Service', completedata$type), "Businesses",
                                                                                                                                                             ifelse(grepl('Community', completedata$type), "Organizations",
                                                                                                                                                                    ifelse(grepl('Publication', completedata$type), "Organizations",
                                                                                                                                                                           ifelse(grepl('Hotline', completedata$type), "Organizations",
                                                                                                                                                                                  ifelse(grepl('Men', completedata$type), "Organizations",
                                                                                                                                                                                         ifelse(grepl('Organization', completedata$type), "Organizations",
                                                                                                                                                                                                ifelse(grepl('Cruis', completedata$type), "Cruising Areas",
                                                                                                                                                                                                       ifelse(grepl('Crusi', completedata$type), "Cruising Areas", 
                                                                                                                                                                                                              ifelse(grepl("Entertainment", completedata$type), "Entertainment", 
                                                                                                                                                                                                                     ifelse(grepl("Nightclubs", completedata$type), "Entertainment", 
                                                                                                                                                                                                                            ifelse(grepl("Sex Club", completedata$type), "Entertainment", 
                                                                                                                                                                                                                                   ifelse(grepl("Campground", completedata$type), "Entertainment", "NA"))))))))))))))))))))))))))))))


na_indices <- which(grepl("NA", completedata$category)) # check if there are still NAs in category

# create a data frame with rows that need "type" fixed

raw_output <- character(0) # create an empty character vector
for (i in na_indices) { # loop through the NA categories and store them in raw_output
  raw_output <- c(raw_output, paste(
    "row ID =", completedata[i, 1],
    "; title =", completedata[i, 2],
    "; description =", completedata[i, 3],
    "; streetaddress =", completedata[i, 4],
    "; originaltype =", completedata[i, 5], 
    "; city =", completedata[i, 7], 
    "; state =", completedata[i, 8],
    "; year =", completedata[i, 9],
    "; notes =", completedata[i, 10]
  ))
}

# create df with raw_output data using RegEx
error.data <- data.frame(
  row_ID = as.integer(str_extract(raw_output, "(?<=row ID = )\\d+")),
  title = str_extract(raw_output, "(?<=title = ).*?(?=; description =)"),
  description = str_extract(raw_output, "(?<=description = ).*?(?=; streetaddress =)"),
  streetaddress = str_extract(raw_output, "(?<=streetaddress = ).*?(?=; originaltype =)"),
  originaltype = str_extract(raw_output, "(?<=originaltype = ).*?(?=; city =)"),
  city = str_extract(raw_output, "(?<=city = ).*?(?=; state =)"),
  state = str_extract(raw_output, "(?<=state = ).*?(?=; year =)"),
  year = as.integer(str_extract(raw_output, "(?<=year = )\\d+")),
  notes = str_extract(raw_output, "(?<=notes = )")
)

# trim white spaces
error.data <- data.frame(lapply(error.data, trimws), stringsAsFactors = FALSE)

# manually fix each type