# Defining temp
temp <- list(
  c(3, 7, 9, 6, -1),
  c(6, 9, 12, 13, 5),
  c(4, 8, 3, -1, -3),
  c(1, 4, 7, 2, -2),
  c(5, 7, 9, 4, 2),
  c(-3, 5, 8, 9, 4),
  c(3, 6, 9, 4, 1))


# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))