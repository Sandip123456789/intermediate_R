# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)


# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(social_vec, decreasing=TRUE)

#*********************************************************************
  
# Fix me
rep(seq(1, 7, by = 2), times = 7)
#*****************************************************************************

'Beat Gauss Using R'

# Create first sequence: seq1
seq1 <- seq(1, 500, 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, -7)

# Calculate total sum of the sequences
print(sum(seq1) + sum(seq2))

#*****************************************************************************

"'grepl() and grep()'"

'1. Use grepl() to generate a vector of logicals that indicates whether these 
    email addresses contain "edu". Print the result to the output.
2. Do the same thing with grep(), but this time save the resulting indexes
    in a variable hits.
3. Use the variable hits to select from the emails vector only the emails that
    contain "edu".'
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"
grepl(pattern = "edu", emails)

# Use grep() to match for "edu", save result to hits
hits <- grep(pattern="edu", emails)

# Subset emails using hits
emails[hits]

#*******************************************************************************
'
1. @, because a valid email must contain an at-sign.
2. .*, which matches any character (.) zero or more times (*). Both the dot and 
   the asterisk are metacharacters. You can use them to match any character 
   between the at-sign and the ".edu" portion of an email address.
3. \\.edu$, to match the ".edu" part of the email at the end of the string. 
   The \\ part escapes the dot: it tells R that you want to use the . as an 
   actual character.
'
'
1. Use grepl() with the more advanced regular expression to return a logical 
  vector. Simply print the result.
2. Do a similar thing with grep() to create a vector of indices. Store the 
  result in the variable hits.
3. Use emails[hits] again to subset the emails vector.
'

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern = "@.*\\.edu$", x=emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep(pattern = "@.*\\.edu$", x=emails)

# Subset emails using hits
emails[hits]

#**************************************************************************

'
1) .*: A usual suspect! It can be read as "any character that is matched zero
  or more times".
2) \\s: Match a space. The "s" is normally a character, escaping it (\\) 
  makes it a metacharacter.
3) [0-9]+: Match the numbers 0 to 9, at least once (+).
4) ([0-9]+): The parentheses are used to make parts of the matching string 
  available to define the replacement. The \\1 in the replacement argument of 
  sub() gets set to the string that is captured by the regular expression [0-9]+
'

awards <- c("Won 1 Oscar.",
            "Won 1 Oscar. Another 9 wins & 24 nominations.",
            "1 win and 2 nominations.",
            "2 wins & 3 nominations.",
            "Nominated for 2 Golden Globes. 1 more win & 2 nominations.",
            "4 wins & 1 nomination.")

sub(".*\\s([0-9]+)\\snomination.*$", "\\1", awards)
