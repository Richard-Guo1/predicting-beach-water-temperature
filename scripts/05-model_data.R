#### Preamble ####
# Purpose: Models the amount of water fowl observed as a linear regression with 
  # predictors of beach, water temperature, and air temperature.
# Author: Richard Guo
# Date: 27 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- readRDS("data/02-analysis_data/analysis_data.rds")

### Model data ####
first_model <-
  stan_glm(
    formula = waterFowl ~ airTemp + isCentreIsland + isCherry
              + isGibraltarPoint + isHanlansPoint + isKewBalmy + isMarieCurtis 
              + isSunnyside + isWardsIsland + isWoodbine,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


