# Assignment: ASSIGNMENT 4.2
# Name: Madsen, Justin
# Date: 2022-01-08

# import the boys
library(ggplot2)
library(qqplotr)
library(readxl)
library(plyr)
theme_set(theme_minimal())

# set wd
setwd("C:\\Users\\MyDir\\Documents\\GitHub\\dsc520\\")

# import scores.csv
scores_df <- read.csv("data/scores.csv")

# printing scores_df shows student count, score, and section with no
# identifiable information.
scores_df

# ids the variable as a dataframe with 38 objects of 3 variables.
str(scores_df)

# Count = Quantitative, numerical expression
# Score = Quantitative, numerical expression
# Sections = Categorical, strings that put the students into categories

# 38 columns
nrow(scores_df)

# 3 rows
ncol(scores_df)

# set variables to subset the data based on section
section_regular <- subset(scores_df, Section == "Regular")
section_sports <- subset(scores_df, Section == "Sports")

ggplot(section_regular, aes(x = Score)) + geom_histogram(bins = 40) + 
  ggtitle("Regular Class Scores") + xlab ("Scores") + ylab("Number of Students")

ggplot(section_sports, aes(x = Score)) + geom_histogram(bins = 40) + 
  ggtitle("Sport Class Scores") + xlab ("Scores") + ylab("Number of Students")

mean(section_regular$Score)
# 327.6316
min(section_regular$Score)
# 265
max(section_regular$Score)
# 380

mean(section_sports$Score)
# 307.3684
min(section_sports$Score)
# 200
max(section_sports$Score)
# 395

# On average, Regular students score 20 points higher than those in Sports. However, the range of scores is wider in
# Sports. Regular students score in a tighter cluster, where as Sports students score either much higher or much lower. 

# Students in one section didn't score higher than students in the other. The statistical tendency here is similar to
# the comment above. The variability of the Sports scores has a much wider range, while the Regular students are
# more clumped together.

# A helpful variable here would've been what attendance. A student who doesn't show up will obviously earn
# less points than others in their class. 

housing_df <- read_excel("data/week-7-housing.xlsx")
# read the excel

section_price <- housing_df[,2]
# select the price column as a new variable

all_sales <- apply(section_price, 2, sum)
# Combine all sales and store as a new variable

aggregate(housing_df$year_built, by = list(housing_df$square_feet_total_living), FUN = length)
#aggregate function

llply(llply(housing_df), table)
# llply to entire df. This printed alot and I didn't know what I was reading.

llply(section_price, summary)
# llply a summary for the sale price subset I made. Here I can see some statistical information.
      
ggplot(section_price, aes(x = `Sale Price`)) + geom_histogram(bins = 100) + 
  ggtitle("Sales Prices") + xlab ("Price") + ylab("NUmber of Sales")
# Histogram of prices

# It would appear that there are a few outliers towards rthe end of the data.
# These appear to be almost 500K+ in price higher than other sales on file.
# the distribution also a majority of the sales under $1M, suggesting anything over
# 2.5M could be considered an outlier.
