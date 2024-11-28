#### Preamble ####
# Purpose: Models the expected beach water temperature as a linear regression 
` # with air temperature, recent rainfall, and beach location as predictors
# Author: Richard Guo
# Date: 27 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # 03-clean_data.R must have been run
  # The 'tidyverse' package must be installed


#### Workspace setup ####
library(tidyverse)

#### Read data ####
analysis_data <- readRDS("data/02-analysis_data/analysis_data.rds")

### Model data ####
first_model <-
  lm(
    formula = waterTemp ~ rain * airTemp + isCentreIsland + isCherry
              + isGibraltarPoint + isHanlansPoint + isKewBalmy + isMarieCurtis 
              + isSunnyside + isWardsIsland + isWoodbine,
    data = analysis_data,
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


