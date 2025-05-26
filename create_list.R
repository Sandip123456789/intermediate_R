# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Adapt list() call to give the components names
my_list <- list(vec = my_vector, mat = my_matrix, df = my_df)

# Print out my_list
my_list
#*******************************************************************

#Creating variables Movie, actors and reviews
comments <- c("Best Horror Film I Have Ever Seen", "A truly brilliant and scary film from Stanley Kubrick", "A masterpiece of psychological horror")
sources <- c("IMDb1", "IMDb2", "IMDb3")
scores <- c(4.5, 4.0, 5.0)
movie_title <- "The Shining"
actors <- c( "Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson" )
reviews_df <- data.frame(scores, sources, comments)

