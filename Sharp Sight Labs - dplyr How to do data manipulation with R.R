## Tutorial http://sharpsightlabs.com/blog/dplyr-intro-data-manipulation-with-r/

#dplyr: the essential data manipulation toolset
#In data wrangling, what are the main tasks?
#– Filtering rows (to create a subset)
#– Selecting columns of data (i.e., selecting variables)
#– Adding new variables
#– Sorting
#– Aggregating


library(tidyverse)
library(ggplot2)

#filter() - Row selection from your data.
#filter() subsets your data by keeping rows that meet specified conditions.
df.diamonds_ideal <- filter(diamonds, cut=="Ideal")

#select()
#Select allows you to select specific columns from your data.

df.diamonds_ideal <- select(df.diamonds_ideal, carat, cut, color, price, clarity)

#mutate()
#Mutate allows you to add variables to your dataset.
df.diamonds_ideal  <-  mutate(df.diamonds_ideal, price_per_carat = price/carat)

#arrange()
#Arrange sorts your data.

arrange(df.disordered_data, num_var)
arrange(df.disordered_data, desc(num_var))

#summarize()
#Summarize allows you to compute summary statistics.
#summarize() becomes extremely useful when combined with group_by().

summarize(df.diamonds_ideal, avg_price = mean(price, na.rm = TRUE) )

# “Chaining” in dplyr
#The %>% operatorIn the dplyr syntax, we “chain” commands together using the %>% operator.
#We use the %>% operator to connect one command to another. The output of one command becomes the input for the next command.

df.diamonds_ideal_chained <- diamonds %>% 
  filter(cut=="Ideal") %>% 
  select(carat, cut, color, price, clarity) %>%
  mutate(price_per_carat = price/carat)

#Example 1: Boxplot, dplyr + ggplot

# dplyr + ggplot
# PRICE DISTRIBUTION, Ideal-cut diamonds
diamonds %>% # Start with the 'diamonds' dataset
  filter(cut == "Ideal") %>% # Then, filter down to rows where cut == Ideal
  ggplot(aes(x=color,y=price)) + # Then, plot using ggplot
  geom_boxplot() # with and create a boxplot


#Example 2: Small Multiple Histogram, dplyr + ggplot

# dplyr + ggplot
# HISTOGRAM of price, ideal cut diamonds
diamonds %>% # Start with the 'diamonds' dataset
  filter(cut == "Ideal") %>% # Then, filter down to rows where cut == Ideal
  ggplot(aes(price)) + # Then, plot using ggplot
  geom_histogram() + # and plot histograms
  facet_wrap(~ color) # in a 'small multiple' plot, broken out by 'color'





