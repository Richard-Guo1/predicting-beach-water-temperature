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
end_year <- 2024

# Beach names
beaches <- c("Bluffer's", "Centre Island", "Gibraltar Point", 
             "Hanlan's Point", "Woodbine", "Other")


# Create a dataset by randomly assigning years, temperatures, and waterfowl 
# to beaches
analysis_data <- tibble(
  year = sample(
    start_year:end_year, size, replace = TRUE
  ),
  beach = sample(
    beaches, size, replace = TRUE
  ),
  air_temp = rpois(size, 25),
  water_temp = round(rnorm(size, 16, 5), 2),
  rain = sample(c('Yes', 'No'), size, replace = TRUE)
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")

