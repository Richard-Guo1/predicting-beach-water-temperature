#### Preamble ####
# Purpose: Models the expected beach water temperature as a linear regression 
` # with air temperature, recent rainfall, and beach location as predictors
# Author: Richard Guo
# Date: 27 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # 03-clean_data.R must have been run
  # The 'tidyverse', 'arrow' and 'fastdummies' packages must be installed


#### Workspace setup ####
library(tidyverse)
library(fastDummies)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

### Turn beach name column into dummy variables ###
analysis_data <- analysis_data |>
  fastDummies::dummy_cols(select_columns = "beachName")

analysis_data <- analysis_data |>
  subset(select = -c(beachName, `beachName_Bluffer's Beach Park`)) |>
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


