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

'Full Duplicate (Count and Drop)'

# Count the number of full duplicates
sum(duplicated(bike_share_rides))

# Remove duplicates
bike_share_rides_unique <- distinct(bike_share_rides)

# Count the full duplicates in bike_share_rides_unique
sum(duplicated(bike_share_rides_unique))

#******************************************************************************

'Removing Partial Duplicates'

# Find duplicated ride_ids
bike_share_rides %>% 
  # Count the number of occurrences of each ride_id
  count(ride_id) %>% 
  # Filter for rows with a count > 1
  filter(n > 1)

# Remove full and partial duplicates
bike_share_rides_unique <- bike_share_rides %>%
  # Only based on ride_id instead of all cols
  distinct(ride_id, .keep_all = TRUE)

# Find duplicated ride_ids in bike_share_rides_unique
bike_share_rides_unique %>%
  # Count the number of occurrences of each ride_id
  count(ride_id) %>%
  # Filter for rows with a count > 1
  filter(n > 1)

#*******************************************************************************

'Aggregating Partial Duplicates'

bike_share_rides %>%
  # Group by ride_id and date
  group_by(ride_id, date) %>%
  # Add duration_min_avg column
  mutate(duration_min_avg = mean(duration_min) ) %>%
  # Remove duplicates based on ride_id and date, keep all cols
  distinct(ride_id, date, .keep_all = TRUE) %>%
  # Remove duration_min column
  select(-duration_min)

#*****************************************************************************

'Checking Membership / Membership Constraints'

'Not a member'

'
1. Use the correct type of filtering join on the sfo_survey data frame and the 
  dest_sizes data frame to get the rows of sfo_survey with invalid dest_size values.
2. Get the id, airline, destination, and dest_size columns.
'
# Find bad dest_size rows
sfo_survey %>% 
  # Join with dest_sizes data frame to get bad dest_size rows
  anti_join(dest_sizes, by = "dest_size") %>%
  # Select id, airline, destination, and dest_size cols
  select(id, airline, destination, dest_size)

'
1. Use the correct filtering join on sfo_survey and dest_sizes to get the rows 
  of sfo_survey that have a valid dest_size.
2. Count the number of times that each dest_size occurs to make sure there are no
  invalid values left behind.
'
# Remove bad dest_size rows
sfo_survey %>% 
  # Join with dest_sizes
  semi_join(dest_sizes, by = "dest_size") %>%
  # Count the number of each dest_size
  count(dest_size)

#******************************************************************************

'*Case Inconsistency*'

'Correcting/Removing inconsistency'

'
1. Add a column to sfo_survey called dest_size_trimmed that contains the values
  in the dest_size column with all leading and trailing whitespace removed.
2. Add another column called cleanliness_lower that contains the values in the 
  cleanliness column converted to all lowercase.
3. Count the number of occurrences of each category in dest_size_trimmed.
4. Count the number of occurrences of each category in cleanliness_lower.
'

# Add new columns to sfo_survey
sfo_survey <- sfo_survey %>%
  # dest_size_trimmed: dest_size without whitespace
  mutate(dest_size_trimmed = str_trim(dest_size),
         # cleanliness_lower: cleanliness converted to lowercase
         cleanliness_lower = str_to_lower(cleanliness))

# Count values of dest_size_trimmed
sfo_survey %>%
  count(dest_size_trimmed)

# Count values of cleanliness_lower
sfo_survey %>%
  count(cleanliness_lower)

#***************************************************************************

'Collapsing Categories'

# Count categories of dest_region
sfo_survey %>%
  count(dest_region)

'Note: Here "EU", "eur", and "Europ" need to be collapsed to "Europe".'

'
1. Create a vector called europe_categories containing the three values of 
  dest_region that need to be collapsed.
2. Add a new column to sfo_survey called dest_region_collapsed that contains the 
  values from the dest_region column, except the categories stored in 
  europe_categories should be collapsed to Europe.
3. Count the categories of dest_region_collapsed.
'

# Count categories of dest_region
sfo_survey %>%
  count(dest_region)

# Categories to map to Europe
europe_categories <- c("EU", "eur", "Europ")

# Add a new col dest_region_collapsed
sfo_survey %>%
  # Map all categories in europe_categories to Europe
  mutate(dest_region_collapsed = fct_collapse(dest_region, 
                                              Europe = europe_categories)) %>%
  # Count categories of dest_region_collapsed
  count(dest_region_collapsed)