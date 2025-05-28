'# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
}

# Print out the speed variable
speed'

#**************************************************************************

'# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is", speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}'
#*************************************************************************

'# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}'

#******************************************************************************

#Initialize i as 1
i <- 1

while(i <= 10){
  print(3 * i)
  if(i %% 8 == 0){
    break
  }
  i <- i + 1
}
#****************************************************************************

'Loop over Vector'

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (l in linkedin){
  print(l)
}


# Loop version 2
for (i in 1:length(linkedin)){
  print(linkedin[i])
}
#******************************************************************************

'Loop over List'
# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (i in nyc){
  print(i)
}

# Loop version 2
# [[ ]] - to select the list elements in loop version 2
for (i in 1:length(nyc)){
  print(nyc[[i]])
}

#***************************************************************************

'Loop over Matrix'

# Defining the tic-tac-toe matrix to ttt
ttt <- matrix(c("O", NA, "X", NA, "O", "O", "X", NA, "X"), nrow = 3, ncol = 3, byrow = TRUE)

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row i =", i, "and column j =", j, "the board contains x =", ttt[i, j]))
  }
}

#*******************************************************************************

'Using break and next statement'

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16){
    print("This is ridiculous, I'm outta here!")
    break
  }
  
  # Add if statement with next
  if (li < 5){
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}
#************************************************************************

'Build a for Loop from scratch'

## Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == "r"){
    rcount = rcount + 1
  }
  if (char == "u"){
    break
  }
  
}

# Print out rcount
print(rcount)