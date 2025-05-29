# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables
avg_sum
avg_sum_trimmed

#******************************************************************************

'Use a Function'

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)
#mean(facebook)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)
#mean(facebook, na.rm = TRUE)
#******************************************************************************

'Write your own function'

'
1. Create a function pow_two(): it takes one argument and returns that number 
 squared (that number times itself).
2. Call this newly defined function with 12 as input.
3. Next, create a function sum_abs(), that takes two arguments and returns 
 the sum of the absolute values of both arguments.
4. Finally, call the function sum_abs() with arguments -2 and 3 afterwards.
'

# Create a function pow_two()
pow_two <- function(x){
  return(x**2)
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(arg1, arg2){
  return(abs(arg1) + abs(arg2))
}

# Use the function
sum_abs(-2, 3)
#*****************************************************************************

'
1. Add an optional argument, named print_info, that is TRUE by default.
2. Wrap an if construct around the print() function: this function should only
 be executed if print_info is TRUE.
3. Feel free to experiment with the pow_two() function you\'ve just coded.
'
# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}
#******************************************************************************

'increment <- function(x, inc = 1) {
  x <- x + inc
  x
}
count <- 5
a <- increment(count, 2)
b <- increment(count)
count <- increment(count, 2)'

#******************************************************************************

'WORKING ON INTERPRET() FUNCTION'

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum=TRUE) {
  count <- 0
  
  for (v in views) {
    count <- count + interpret(v)
    print(count)
  }
  
  if (return_sum == TRUE) {
    return(count)
    
  } else {
    return(NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)
