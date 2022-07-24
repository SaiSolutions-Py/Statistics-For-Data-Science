# Assignment: ASSIGNMENT 5
# Name: Madsen, Justin
# Date: 2022-01-16

# import the boys
library(dplyr)
library(readxl)
library(purrr)
library(stringr)
theme_set(theme_minimal())

# set wd
setwd("C:\\Users\\MyDir\\Documents\\GitHub\\dsc520\\")

# read the excel
housing_df <- read_excel("data/week-7-housing.xlsx")

# GroupBy
by_bedrooms <- housing_df %>% group_by(bedrooms)

# Summarize
summary_salesprice <- housing_df %>% summarise(`Sale Price` = mean(`Sale Price`))

# Mutate
mutate_price <- housing_df %>% select(`Sale Date`, `Sale Price`) %>%
  mutate(new_price = `Sale Price` * 1.08)

# Filter
filter_bedrooms <- by_bedrooms %>% filter(bedrooms > 2)

# Select
select_houses <- select(housing_df, starts_with("zip"))

# Arrange
arrange_housing_byprice <- arrange(housing_df, `Sale Price`)

# purrr
# keep only houses above a certain amount
keep_prices <- keep(housing_df$`Sale Price`, housing_df$`Sale Price` > 1000000)

#discard/inverse of above
discard_prices <- discard(housing_df$`Sale Price`, housing_df$`Sale Price` < 1000000)

# for the following sections, I chose to create a new data frame due to the
# size of the housing file, creating a new row/column to add would be extensive
gum_brand <- c('Five','Hubba Bubba','Red Hot')
flavor <- c('Spearmint','Regular','Cinnamon')
flavor_length_minutes <- c(5, 2, 12)
gum_frame <- data.frame(gum_brand, flavor, flavor_length_minutes)

# cbind
rating_out_of_10 <- c(9, 1, 3) 
cbind(gum_frame, rating_out_of_10)

# rbind
new_entry1 <- c('Five', 'Winter Mint', 7, 5) 
rbind(gum_frame, new_entry1)

# string
full_string <- "nachos, cheese"

# split
cut_string <- strsplit(a, split = ",")

# concatenate
string1 = "nachos"
string2 = "cheese"
combined = paste(string1, string2, sep = ", ")
