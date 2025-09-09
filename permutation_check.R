rm(list=ls())

library(readr)
load('team_data.RData')
load('functions.RData')

# read in perms
perms <- read_csv('data/9perms.csv', col_names = F) %>% as.matrix()

# get number of permutations
n = 9 # set size
r = 3 # subset size
nperms = factorial(n) / (factorial(r)*factorial(n-r))

# initialise vector for identifying cases of zero matches found
all_no_match = rep(999,npools)

for(i in 1:npools){
  # filter data and create match vector
  no_match = rep(0,nperms)
  
  # loop through all possible perms and filter non-matched cars
  for(j in 1:nperms){
    idx <- perms[j,] %>% unname()
    tmp <- getCars(data, idx, i)
    if(nrow(tmp)==0){
      no_match[j] <- 1
      print(names(select(tmp,-1)))
    }
  }
  all_no_match[i] <- sum(no_match)
}
