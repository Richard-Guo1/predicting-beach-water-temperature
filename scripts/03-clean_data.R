#### Preamble ####
# Purpose: Cleans the Toronto Beach Observational data accessed from Open Data 
  #Toronto
# Author: Richard Guo
# Date: 26 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # The `tidyverse` and `arrow` packages must be installed
  # 02-download_data.R must have been run

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

# Manually remove rows with 'N/A' in rain column
raw_data <- raw_data[raw_data$rain != "N/A",]

# Clean rest of data
cleaned_data <- raw_data |>
  select(dataCollectionDate, beachName, airTemp, rain, waterTemp) |>
  dplyr::mutate(year = lubridate::year(dataCollectionDate), 
                rain = recode(rain, Yes = 1, No = 0)) |>
  subset(select = -c(dataCollectionDate)) |>
  na.omit()

  
# Remove the rows with outlying waterTemp data
cleaned_data <- cleaned_data[cleaned_data$waterTemp <= 
                               mean(cleaned_data$waterTemp) +
                               3*sd(cleaned_data$waterTemp),]

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/analysis_data.parquet")
