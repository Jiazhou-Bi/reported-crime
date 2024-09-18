#### Preamble ####
# Purpose: Simulates some marriage data for Toronto
# Author: Rohan Alexander
# Date: 18 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(555)

number_of_dates <- 50

data <- 
  tibble(
    date = seq.Date(from = as.Date("2021-01-01"), 
                    by = "month", 
                    length.out = number_of_dates),
    number_of_marriages = sample(x = c(0:100), 
                                 size = number_of_dates,
                                 replace = TRUE),
    marriages = rpois(n = number_of_dates,
                      lambda = 10)
  )



