
# 9.3 Load the packages and the dataset
library(tidyverse)
library(NHANES)

## # Load up the packages
## source(here::here("R/package-loading.R"))

# Briefly glimpse contents of dataset
glimpse(NHANES)

# Load the packages
source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

#Select one colomn by its name

select(NHANES,Age)

# Select two or more columns by thier name select(df,v)

select(NHANES,Age,BMI,Height)

