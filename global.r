library(shiny)
library(tidyverse)
library(readxl)
#library(DT)
library(scales)
library(ggrepel)


#### import: bring in the nutrient data ####
food_nutrients <- 
  read_excel("AUSNUT_mfp.xlsx", sheet = "food nutrients")

food_list <- 
  read_excel("AUSNUT_mfp.xlsx", sheet = "food list") %>%
  select(-`Survey ID`)

nutrient_groups <-
  read_excel("AUSNUT_mfp.xlsx", sheet = "nutrient groups") %>%
  select(-c(Category, Unit, Relevant))


food_df_long <- 
  left_join(food_nutrients, food_list) %>%
  gather(Nutrient, Value, `Protein (g)`:`Total long chain omega 3 fatty acids (mg)`) %>%
  left_join(nutrient_groups)

# set the food names for the selction boxes
food_names <- sort(food_list$`Food Name`)

# clear the space
rm(food_list, food_nutrients, nutrient_groups)


#### import: bring in the rdi data ####
rdi_concord <- 
  read_excel("rdis.xlsx", sheet = "data_nut_concord") %>%
  select(-`nutrient_ptiles`)

rdis <- 
  read_excel("rdis.xlsx", sheet = "data_rdis") %>%
  filter(`intake type` == "AI" | `intake type` == "RDI") %>%
  inner_join(rdi_concord, by = c("Nutrient" = "nutrient_rdis"))


cols <- c("Condition", "Gender", "Age")
rdis[cols] <- lapply(rdis[cols], factor)


ages <- unique(rdis$Age)
genders <- unique(rdis$Gender)
conditions <- unique(rdis$Condition)

chart_options <- cbind("stack", "dodge")

rm(cols, rdi_concord)
gc()
