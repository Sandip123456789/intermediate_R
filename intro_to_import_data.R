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