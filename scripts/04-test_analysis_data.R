#### Preamble ####
# Purpose: Tests the analysis data for sanity
# Author: Richard Guo
# Date: 26 November 2024 
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # The `tidyverse`, `arrow` and `testthat` packages must be installed
  # 03-clean_data.R must have been run


#### Workspace setup ####
library(tidyverse)
library(arrow)
library(testthat)


analysis_data <- 
  read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))

#### Test data ####
# Test that the dataset has 5 columns
test_that("dataset has 5 columns", {
  expect_equal(ncol(analysis_data), 5)
})

# Test that the 'airTemp' column is double type
test_that("'airTemp' is double", {
  expect_type(analysis_data$airTemp, "double")
})

# Test that the 'waterTemp' column is double type
test_that("'waterTemp' is double", {
  expect_type(analysis_data$waterTemp, "double")
})

# Test that 'rain' column is a dummy variable
test_that("'rain' is a dummy column", {
  expect_true(all(analysis_data$rain >= 0 & analysis_data$rain <= 1))
})


# Test that the 'year' column is integer type
test_that("'year' is integer", {
  expect_true(all(analysis_data$year == floor(analysis_data$year)))
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Test that 'beach' column contains only valid Toronto beach names
valid_beaches <- c("Bluffer's Beach Park", "Centre Island Beach", 
                    "Cherry Beach", "Gibraltar Point Beach", 
                    "Hanlan's Point Beach", "Kew Balmy Beach", 
                    "Marie Curtis Park East Beach", "Sunnyside Beach", 
                    "Ward's Island Beach", "Woodbine Beaches")
test_that("'beach' contains only valid beaches",{
  expect_true(all(analysis_data$beachName %in% valid_beaches))
})