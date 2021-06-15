r3::open_data_wrangling()

# Wrangling here refers to maneuvering, managing, controlling, and turning
# your data around to clean it up, better understand it, and prepare it for later analyses.
# Datasets come from tidyr
# Tidy:
library(tidyr)
table1

# Partly tidy:
table2

# Messier:
table3

# Messy:
table4a

# Messy:
table4b

# 9.3 Load the packages and the dataset
library(tidyverse)
library(NHANES)

## # Load up the packages
## source(here::here("R/package-loading.R"))

# Briefly glimpse contents of dataset
glimpse(NHANES)
