#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Richard Guo
# Date: 25 November 2024
# Contact: richard.guo@mail.utoronto.ca
# License: MIT
# Pre-requisites: opendatatoronto, tidyverse, dplyr packages must be installed


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####

# The following code was taken from Open Data Toronto API access sample

# get package
package <- show_package("toronto-beaches-observations")

# get all resources for this package
resources <- list_package_resources("toronto-beaches-observations")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
raw_data <- filter(datastore_resources, row_number()==1) %>% get_resource()

#### Save data ####
write_csv(raw_data, "data/01-raw_data/raw_data.csv") 

         
