#### Preamble ####
# Purpose: Tests the analysis data for sanity
# Author: Richard Guo
# Date: 26 November 2024 
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # The `tidyverse` and 'testthat' packages must be installed and loaded
  # 03-clean_data.R must have been run


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
# Test that the dataset has 13 columns
test_that("dataset has 13 columns", {
  expect_equal(ncol(analysis_data), 13)
})

# Test that the 'airTemp' column is integer type
test_that("'airTemp' is integer", {
  expect_type(analysis_data$airTemp, "integer")
})

# Test that the 'waterTemp' column is double type
test_that("'waterTemp' is double", {
  expect_type(analysis_data$waterTemp, "double")
})

# Test that the 'waterFowl' column is integer type
test_that("'waterFowl' is integer", {
  expect_type(analysis_data$waterFowl, "integer")
})

# Test that there are no negative values in the 'waterFowl' column
test_that("no negative values in 'waterFowl'", {
  expect_true(all(analysis_data$waterFowl >= 0))
})


# Test that the 'year' column is integer type
test_that("'year' is integer", {
  expect_type(analysis_data$year, "integer")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(analysis_data)))
})



