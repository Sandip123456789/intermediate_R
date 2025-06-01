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