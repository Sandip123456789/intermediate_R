# Import swimming_pools.csv: pools
pools <- read.csv("swimming_pools.csv")

# Print the structure of pools
str(pools)

# Define the path
path <- file.path("~", "datasets", "swimming_pools.csv")
'~ means home directory'

path

#*****************************************************************************

'Assigning column names'

# Finish the read.delim() call
hotdogs <- read.delim("hotdogs.txt", header = FALSE, 
                      col.names = c("types", "calories", "sodium"))

# Print the first 6 rows of hotdogs
head(hotdogs)

#*****************************************************************************

'Column Classes'

# Previous call to import hotdogs.txt
hotdogs <- read.delim("hotdogs.txt", header = FALSE, col.names = c("type", "calories", "sodium"))

# Display structure of hotdogs
str(hotdogs)

# Edit the colClasses argument to import the data correctly: hotdogs2
hotdogs2 <- read.delim("hotdogs.txt", header = FALSE, 
                       col.names = c("type", "calories", "sodium"),
                       colClasses = c("character", "NULL", "numeric"))


# Display structure of hotdogs2
str(hotdogs2)

#********************************************************************

'read.table'

# Path to the hotdogs.txt file: path
path <- file.path("data", "hotdogs.txt")

# Import the hotdogs.txt file: hotdogs
hotdogs <- read.table(path, 
                      sep = "\t", 
                      col.names = c("type", "calories", "sodium"))

# Call head() on hotdogs
head(hotdogs)

#******************************************************************************

'read_tsv'

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.txt: potatoes
potatoes <- read_tsv("potatoes.txt", col_names = "properties")

# Call head() on potatoes
head(potatoes)

#******************************************************************************

'read_delim'

'read_delim() takes two mandatory arguments:
  file: the file that contains the data
  delim: the character that separates the values in the data file
'
# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import potatoes.txt using read_delim(): potatoes
potatoes <- read_delim("potatoes.txt", delim = "\t", col_names = properties)

# Print out potatoes
potatoes

#******************************************************************************

'skip and n_max'

'
Question: Import observations 7, 8, 9, 10 and 11 from potatoes.txt
'

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import 5 observations from potatoes.txt: potatoes_fragment
potatoes_fragment <- read_tsv("potatoes.txt", skip = 6, n_max = 5, col_names = properties)

#******************************************************************************

'col_types'

# Column names
properties <- c("area", "temp", "size", "storage", "method",
                "texture", "flavor", "moistness")

# Import all data, but force all columns to be character: potatoes_char
potatoes_char <- read_tsv("potatoes.txt", col_types = "cccccccc", col_names = properties)

# Print out structure of potatoes_char
str(potatoes_char)

#*****************************************************************************

'col_types with collectors'

# Import without col_types
hotdogs <- read_tsv("hotdogs.txt", col_names = c("type", "calories", "sodium"))

# Display the summary of hotdogs
summary(hotdogs)

# The collectors you will need to import the data
fac <- col_factor(levels = c("Beef", "Meat", "Poultry"))
int <- col_integer()

# Edit the col_types argument to import the data correctly: hotdogs_factor
hotdogs_factor <- read_tsv("hotdogs.txt",
                           col_names = c("type", "calories", "sodium"),
                           col_types = list(fac, int, int))

# Display the summary of hotdogs_factor
summary(hotdogs_factor)

#*******************************************************************************

'fread() with with arguments: drop and select'

# Import columns 6 and 8 of potatoes.csv: potatoes
#potatoes <- fread("potatoes.csv", select = c(6, 8))
potatoes1 <- fread("potatoes.csv", drop = c(1:5, 7))

# Plot texture (x) and moistness (y) of potatoes
#plot(potatoes$texture, potatoes$moistness, xlab = "Textures", ylab = "Moistnesses")
plot(potatoes1$texture, potatoes1$moistness, xlab = "Textures", ylab = "Moistnesses")