library(ggplot2)
library(qqplotr)
library(pastecs)
library(moments)
theme_set(theme_minimal())

setwd("C:\\Users\\MyDir\\Documents\\GitHub\\dsc520\\")

acs_df <- read.csv("data/acs-14-1yr-s0201.csv")

str(acs_df)

nrow(acs_df)

ncol(acs_df)

ggplot(acs_df, aes(x = HSDegree)) + geom_histogram(bins = 100) + 
  ggtitle("HS Degree Status") + xlab("HS Degree (%)")

ggplot(acs_df, aes(x = HSDegree)) +
  geom_histogram(aes(y = ..density..), color = "gray", fill = "white", bins = 100) +
  geom_density(fill = "black", alpha = 0.2) 

ggplot(mapping = aes(sample = acs_df$HSDegree)) + stat_qq_point(size = 2) + 
  stat_qq_point(color="blue") + xlab("HS Degree") + ylab("Probability")

stat.desc(acs_df$HSDegree)
skewness(acs_df$HSDegree)
kurtosis(acs_df$HSDegree)
