#### Preamble ####
# Purpose: Cleans the Toronto Beach Observational data accessed from Open Data 
  #Toronto
# Author: Richard Guo
# Date: 26 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # The `tidyverse` package must be installed and loaded
  # 02-download_data.R must have been run

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <-
  na.omit(raw_data) |>
  select(dataCollectionDate, beachName, airTemp, waterTemp, waterFowl) 

#### Save data ####
write_rds(cleaned_data, "data/02-analysis_data/analysis_data.rds")
