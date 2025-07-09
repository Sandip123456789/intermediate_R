'Date Uniformity'

# Check out the accounts data frame
head(accounts)

# Define the date formats
formats <- c("%Y-%m-%d", "%B %d, %Y")

# Convert dates to the same format
accounts %>%
  mutate(date_opened_clean = parse_date_time(date_opened, orders = formats))

#******************************************************************************

'Currency Uniformity'

# Scatter plot of opening date and total amount
accounts %>%
  ggplot(aes(x = date_opened, y = total)) +
  geom_point()

# Left join accounts to account_offices by id
accounts %>%
  left_join(account_offices, by = "id") %>%
  # Convert totals from the Tokyo office to USD
  mutate(total_usd = ifelse(office == "Tokyo", total / 104, total)) %>%
  # Scatter plot of opening date vs total_usd
  ggplot(aes(x = date_opened, y = total_usd)) +
  geom_point()

#******************************************************************************

'Validating totals'

# Find invalid totals
accounts %>%
  # theoretical_total: sum of the three funds
  mutate(theoretical_total = fund_A + fund_B + fund_C) %>%
  # Find accounts where total doesn't match theoretical_total
  filter(total != theoretical_total)

'Validating age'

# Find invalid acct_age
accounts %>%
  # theoretical_age: age of acct based on date_opened
  mutate(theoretical_age = floor(as.numeric(date_opened %--% today(), "years"))) %>%
  # Filter for rows where acct_age is different from theoretical_age
  filter(theoretical_age != acct_age)

#******************************************************************************

'Visualizing missing data'

# Visualize the missing values by column
vis_miss(accounts)

accounts %>%
  # missing_inv: Is inv_amount missing?
  mutate(missing_inv = is.na(inv_amount)) %>%
  # Group by missing_inv
  group_by(missing_inv) %>%
  # Calculate mean age for each missing_inv group
  summarize(avg_age = mean(age))

# Sort by age and visualize missing vals
accounts %>%
  arrange(age) %>%
  vis_miss()

#*****************************************************************************

'Treating Missing Data'

# Create accounts_clean
accounts_clean <- accounts %>%
  # Filter to remove rows with missing cust_id
  filter(!is.na(cust_id)) %>%
  # Add new col acct_amount_filled with replaced NAs
  mutate(acct_amount_filled = ifelse(is.na(acct_amount), inv_amount * 5, acct_amount))

# Assert that cust_id has no missing vals
assert_all_are_not_na(accounts_clean$cust_id)

# Assert that acct_amount_filled has no missing vals
assert_all_are_not_na(accounts_clean$acct_amount_filled)

#*****************************************************************************

'Comparing Strings'

'Calculating strings distance using different methods'

# Calculate Damerau-Levenshtein distance
stringdist("las angelos", "los angeles", method = "dl")

# Calculate LCS distance
stringdist("las angelos", "los angeles", method = "lcs")

# Calculate Jaccard distance
stringdist("las angelos", "los angeles", method = "jaccard")

#******************************************************************************

'Fixing typos with string distance'

# Count the number of each city variation
zagat %>%
  count(city)

# Join zagat and cities and look at results
zagat %>%
  # Left join based on stringdist using city and city_actual cols
  stringdist_left_join(cities, by = c("city" = "city_actual")) %>%
  # Select the name, city, and city_actual cols
  select(name, city, city_actual)

#****************************************************************************

'Pair Blocking'

#1. Load reclin
#1. Generate all possible pairs of records between the zagat and fodors datasets.

# Load reclin
library(reclin)

# Generate all possible pairs
pair_blocking(zagat, fodors)

#2. Use pair blocking to generate only pairs that have matching values in the city column.

# Generate pairs with same city
pair_blocking(zagat, fodors, blocking_var = "city")

#******************************************************************************

'Comparing Pairs'

'1. Compare pairs by name using lcs() distance'

# Generate pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # Compare pairs by name using lcs()
  compare_pairs(by = "name",
                default_comparator = lcs())

'Compare pairs by name, phone, and addr using jaro_winkler().'

# Generate pairs
pair_blocking(zagat, fodors, blocking_var = "city") %>%
  # Compare pairs by name, phone, addr
  compare_pairs(by = c("name", "phone", "addr"),
                default_comparator = jaro_winkler())