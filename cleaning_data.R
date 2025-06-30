'Converting data types'

# Glimpse at bike_share_rides
glimpse(bike_share_rides)

# Summary of user_birth_year
summary(bike_share_rides$user_birth_year)

# Convert user_birth_year to factor: user_birth_year_fct
bike_share_rides <- bike_share_rides %>%
  mutate(user_birth_year_fct = as.factor(user_birth_year))

# Assert user_birth_year_fct is a factor
assert_is_factor(bike_share_rides$user_birth_year_fct)

# Summary of user_birth_year_fct
summary(bike_share_rides$user_birth_year_fct)

#******************************************************************************

'Trimming Strings'

'
1. Use str_remove() to remove "minutes" from the duration column of bike_share_rides.
  Add this as a new column called duration_trimmed.
2. Convert the duration_trimmed column to a numeric type and add this as a new 
  column called duration_mins.
3. Glimpse at bike_share_rides and assert that the duration_mins column is numeric.
4. Calculate the mean of duration_mins.
'

bike_share_rides <- bike_share_rides %>%
  # Remove 'minutes' from duration: duration_trimmed
  mutate(duration_trimmed = str_remove(duration, "minutes"),
         # Convert duration_trimmed to numeric: duration_mins
         duration_mins = as.numeric(duration_trimmed))

# Glimpse at bike_share_rides
glimpse(bike_share_rides)

# Assert duration_mins is numeric
assert_is_numeric(bike_share_rides$duration_mins)

# Calculate mean duration
mean(bike_share_rides$duration_mins)

#******************************************************************************

'Range Constraints'

'
1. Create a three-bin histogram of the duration_min column of bike_share_rides 
  using ggplot2 to identify if there is out-of-range data.
2. Replace the values of duration_min that are greater than 1440 minutes 
  (24 hours) with 1440. Add this to bike_share_rides as a new column called duration_min_const.
3. Assert that all values of duration_min_const are between 0 and 1440.
'

# Create breaks
breaks <- c(min(bike_share_rides$duration_min), 0, 1440, max(bike_share_rides$duration_min))

# Create a histogram of duration_min
ggplot(bike_share_rides, aes(duration_min)) +
  geom_histogram(breaks = breaks)

# duration_min_const: replace vals of duration_min > 1440 with 1440
bike_share_rides <- bike_share_rides %>%
  mutate(duration_min_const = replace(duration_min, duration_min > 1440, 1440))

# Make sure all values of duration_min_const are between 0 and 1440
assert_all_are_in_closed_range(bike_share_rides$duration_min_const, lower = 0, upper = 1440)

#**************************************************************************************

'
1. Convert the date column of bike_share_rides from character to the Date data type.
2. Assert that all values in the date column happened sometime in the past and 
  not in the future.
3. Filter bike_share_rides to get only the rides from the past or today, and 
  save this as bike_share_rides_past.
4. Assert that the dates in bike_share_rides_past occurred only in the past.
'
library(lubridate)
# Convert date to Date type
bike_share_rides <- bike_share_rides %>%
  mutate(date = as.Date(bike_share_rides$date))

# Make sure all dates are in the past
assert_all_are_in_past(bike_share_rides$date)

# Filter for rides that occurred before or on today's date
bike_share_rides_past <- bike_share_rides %>%
  filter(date <= today() )

# Make sure all dates from bike_share_rides_past are in the past
assert_all_are_in_past(bike_share_rides_past$date)

#*******************************************************************************
