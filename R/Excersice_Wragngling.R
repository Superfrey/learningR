# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
? NHANES

#Select one colomn by its name

select(NHANES, Age)

# Select two or more columns by thier name select(df,v)

select(NHANES, Age, BMI, Height)

# To *exclude* a column, use minus (-)
select(NHANES,-HeadCirc)

# All columns starting with letters "BP" (blood pressure)
select(NHANES, starts_with("BP"))

#Some commonly used helpers are:
? select_helpers
#   starts_with(): Select columns that begin with a pattern.
#   ends_with(): Select columns that end with a pattern.
#   contains(): Select columns that contain a pattern.
# All columns ending in letters "Day"
select(NHANES, ends_with("Day"))

# All columns containing letters "Age"
select(NHANES, contains("Age"))

# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(
    NHANES,
    Age,
    Gender,
    Height,
    Weight,
    BMI,
    Diabetes,
    DiabetesAge,
    PhysActiveDays,
    PhysActive,
    TotChol,
    BPSysAve,
    BPDiaAve,
    SmokeNow,
    Poverty
)

# View the new data frame
nhanes_small

# Use of snake case to keep  matching the styl guide
snakecase::to_snake_case()
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)
nhanes_small


#Renaming specific columns 9.7
# rename gender to sex (df, new name= old name)
rename(nhanes_small, sex = gender)

nhanes_small

nhanes_small <- rename(nhanes_small, sex = gender)

nhanes_small

# 9.8 Chaining functions with the pipe

# These two ways are the same
colnames(nhanes_small)

nhanes_small %>%
    colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active = phys_active)

nhanes_small %>%
    select(tot_chol, bp_sys_ave, poverty)

nhanes_small %>%
    rename(diabetes_dianogsis_age = diabetes_age)

nhanes_small %>%
    select(bmi, contains("age"))

physical_activity <-
    select(nhanes_small, phys_active_days, phys_active)
rename(physical_activity, days_phys_active = phys_active_days)


nhanes_small %>%
    select(phys_active_days, phys_active) %>%
    rename(days_phys_active = phys_active_days)

#lecture mutate in pipes
nhanes_small %>%
    mutate(height = height / 100)

nhanes_small %>%
    mutate(logged_height = log(height))

nhanes_small %>%
    mutate(height = height / 100,
           logged_height = log(height))

nhanes_small %>%
    mutate(highly_active = if_else(phys_active_days >= 5, "yes", "no"))

nhanes_update <- nhanes_small %>%
    mutate(
        height = height / 100,
        logged_height = log(height),
        highly_active = if_else(phys_active_days >= 5, "Yes", "No")
    )

# Exercise
# 1. BMI between 20 and 40 with diabetes
nhanes_small %>%
    # Format should follow: variable >= number or character
    filter(bmi >= 20 & 40 <= bmi & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # Specifying dataset
    mutate(
        # 2. Calculate mean arterial pressure
        mean_arterial_pressure = ((bp_dia_ave * 2) + bp_sys_ave) / 3,
        # 3. Create young_child variable using a condition
        young_child = if_else(age <= 6, "Yes", "No")
    )

nhanes_modified


# Exerciser 9.16 summary statistics assignments

# 1.
nhanes_small %>%
    summarise(mean_weight = mean(weight, na.rm = T),
              mean_age = mean(age, na.rm = T))

# 2.
nhanes_small %>%
    summarise(max_height = max(height, na.rm = T),
              min_height = min(height, na.rm = T))

# 3.
nhanes_small %>%
    summarise(
        med_age = median(age, na.rm = T),
        med_phys_act = median(phys_active_days, na.rm = T)
    )


#9.18 Exercise: Answer some statistical questions with group by and summarise
# 1.
nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    ___(___,  ___) %>%
    ___(
        ___,
        ___,
        ___
    )

# 2.
nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    ___(___,  ___) %>%
    ___(
        ___,
        ___,
        ___,
        ___,
        ___,
        ___
    )
