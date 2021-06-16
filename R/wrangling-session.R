
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

##summary statistics by group

nhanes_small %>%
    summarise(max_bmi= max(bmi, na.rm= T))

table(is.na(nhanes_small$bmi))

# calculating 2 summary statistics
nhanes_small %>%
    summarise(max_bmi= max(bmi,na.rm=T),
              min_bmi = min(bmi, na.rm=T ))

# calculating summary statistics by group

nhanes_small %>%
    group_by(diabetes) %>%
    summarise(mean_age= mean(age, na.rm=T),
              mean_bmi= mean(bmi, na.rm=T))



nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    group_by(diabetes) %>%
    summarise(mean_age= mean(age, na.rm=T),
              mean_bmi= mean(bmi, na.rm=T)) %>%
    ungroup()

## Saving datasets as files

## Saving daat as an.rda file in the data folder
usethis::use_data(nhanes_small, overwrite = T)

