#### Preamble ####
# Purpose: Cleans the Toronto Beach Observational data accessed from Open Data 
  #Toronto
# Author: Richard Guo
# Date: 26 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # The `tidyverse` and 'fastDummies' packages must be installed and loaded
  # 02-download_data.R must have been run

#### Workspace setup ####
library(tidyverse)
library(fastDummies)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <- raw_data |>
  na.omit() |>
  select(dataCollectionDate, beachName, airTemp, waterTemp, waterFowl) |>
  dplyr::mutate(year = lubridate::year(dataCollectionDate)) |>
  fastDummies::dummy_cols(select_columns = "beachName") |>
  subset(select = -c(dataCollectionDate, beachName, 
                     `beachName_Bluffer's Beach Park`)) |>
  rename(
    isCentreIsland = `beachName_Centre Island Beach`,
    isCherry = `beachName_Cherry Beach`,
    isGibraltarPoint = `beachName_Gibraltar Point Beach`,
    isHanlansPoint = `beachName_Hanlan's Point Beach`,
    isKewBalmy = `beachName_Kew Balmy Beach`,
    isMarieCurtis = `beachName_Marie Curtis Park East Beach`,
    isSunnyside = `beachName_Sunnyside Beach`,
    isWardsIsland = `beachName_Ward's Island Beach`,
    isWoodbine = `beachName_Woodbine Beaches`
  )
  

#### Save data ####
write_rds(cleaned_data, "data/02-analysis_data/analysis_data.rds")
