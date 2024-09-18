#### Preamble ####
# Purpose: Cleans the marriage data to create an analysis dataset.
# Author: Rohan Alexander
# Date: 18 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(-id) |>
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |>
  mutate(
    date = paste(year, month, "01", sep = "-"),
    date = lubridate::ymd(date)
  ) |> 
  select(-year, -month)


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
