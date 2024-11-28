#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Toronto Beach
  #observations dataset.
# Author: Richard Guo
# Date: 26 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run

#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 500 rows
if (nrow(analysis_data) == 500) {
  message("Test Passed: The dataset has 500 rows.")
} else {
  stop("Test Failed: The dataset does not have 500 rows.")
}

# Check if the dataset has 5 columns
if (ncol(analysis_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}

# Check if the 'beach' column contains only valid Toronto beach names
valid_beaches <- c("Bluffer's", "Centre Island", "Gibraltar Point", 
             "Hanlan's Point", "Woodbine", "Other")

if (all(analysis_data$beach %in% valid_beaches)) {
  message("Test Passed: The 'beach' column contains only valid Torontonian beach names.")
} else {
  stop("Test Failed: The 'beach' column contains invalid beach names.")
}

# Check if the 'air_temp' column contains only integers
if (all(analysis_data$air_temp == floor(analysis_data$air_temp))) {
  message("Test Passed: The 'air_temp' column contains only integers.")
} else {
  stop("Test Failed: The 'air_temp' column contains non-integer values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if the 'water_temp' column contains only doubles
if (all(is.double(analysis_data$water_temp))) {
  message("Test Passed: The 'water_temp' column contains only doubles.")
} else {
  stop("Test Failed: The 'water_temp' column does not contain only doubles.")
}

# Check if the 'rain' column contains only 'Yes' and 'No'
if (all(analysis_data$rain %in% c('Yes', 'No'))) {
  message("Test Passed: The 'rain' column only contains 'Yes' and 'No' values.")
} else {
  stop("Test Failed: The 'rain' column contains unexpected values.")
}

