#### Preamble ####
# Purpose: Simulates a dataset of logged observations of Toronto 
# beaches, including year, which beach, air and water temperature, 
# and the number of waterfowl observed.
# Author: Richard Guo
# Date: 26 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed


#### Workspace setup ####
library(tidyverse)
set.seed(777)


#### Simulate data ####
# Generate 500 samples
size <- 500

# Define the start and end date
start_year <- 2010
end_year <- 2023

# Beach names
beaches <- c("Bluffer's", "Centre Island", "Gibraltar Point", 
             "Hanlan's Point", "Woodbine", "Other")

# Define minimum and maximum air temperature
min_air_temp <- 15
max_air_temp <- 35

# Define minimum and maximum water temperature
min_water_temp <- as.double(19.0)
max_water_temp <- as.double(26.0)

# Create a dataset by randomly assigning years, temperatures, and waterfowl 
# to beaches
analysis_data <- tibble(
  year = sample(
    start_year:end_year, size, replace = TRUE
  ),
  beach = sample(
    beaches, size, replace = TRUE
  ),
  air_temp = sample(
    min_air_temp:max_air_temp, size, replace = TRUE
  ),
  water_temp = round(runif(
    size, min_water_temp, max_water_temp
  ), 1),
  waterfowl = rpois(size, 30)
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")

