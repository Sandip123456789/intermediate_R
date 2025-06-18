'Date and Time'

# Get the current date: today
today <- Sys.Date()

# See what today looks like under the hood
unclass(today)

# Get the current time: now
now <- Sys.time()

# See what now looks like under the hood
unclass(now)
#******************************************************************************

'Create and format dates'

'%Y: 4-digit year (1982)
%y: 2-digit year (82)
%m: 2-digit month (01)
%d: 2-digit day of the month (13)
%A: weekday (Wednesday)
%a: abbreviated weekday (Wed)
%B: month (January)
%b: abbreviated month (Jan)'

#******************************************************************************

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")


# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")

#******************************************************************************

'Create and format Times'

'%H: hours as a decimal number (00-23)
%I: hours as a decimal number (01-12)
%M: minutes as a decimal number
%S: seconds as a decimal number
%T: shorthand notation for the typical format %H:%M:%S
%p: AM/PM indicator'

#******************************************************************************

'Calculation with Dates'

day1 <- "2025-05-31"
day2 <- "2025-06-02"
day3 <- "2025-06-07"
day4 <- "2025-06-13"
day5 <- "2025-06-18"

# day1, day2, day3, day4 and day5 are already available

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)


#******************************************************************************

'Calculation with Times'

login <- c("2025-06-04 10:56:29 UTC", "2025-06-09 09:14:52 UTC",
           "2025-06-09 12:35:48 UTC", "2025-06-09 13:17:22 UTC", 
           "2025-06-11 22:08:47 UTC")
logout <- c("2025-06-04 10:56:29 UTC", "2025-06-09 09:14:52 UTC",
            "2025-06-09 12:35:48 UTC", "2025-06-09 13:17:22 UTC",
            "2025-06-11 22:08:47 UTC")

# login and logout are already defined
# Calculate the difference between login and logout: time_online
time_online <- logout - login

# Inspect the variable time_online
time_online

# Calculate the total time online
sum(time_online)

# Calculate the average time online
mean(time_online)

#******************************************************************************

'Create and Format Times'

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))