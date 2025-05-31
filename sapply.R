# Defining temp
temp <- list(
  c(3, 7, 9, 6, -1),
  c(6, 9, 12, 13, 5),
  c(4, 8, 3, -1, -3),
  c(1, 4, 7, 2, -2),
  c(5, 7, 9, 4, 2),
  c(-3, 5, 8, 9, 4),
  c(3, 6, 9, 4, 1))

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

#*****************************************************************************

'sapply with your own function'

# temp is already defined in the workspace

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

#*****************************************************************************

'sapply with the function returning vector'

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)

#******************************************************************************

'sapply can\'t simplify, now what?'

# temp is already prepared for you in the workspace

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s, freezing_l)

# Output: Given that the length of the output of below_zero() changes for
# different input vectors, sapply() is not able to nicely convert the output
# of lapply() to a nicely formatted matrix. Instead, the output values of
# sapply() and lapply() are exactly the same, as shown by the TRUE output of
# identical().

#*****************************************************************************

'Reverse engineering sapply'

sapply(list(runif (10), runif (10)), 
       function(x) c(min = min(x), mean = mean(x), max = max(x)))
