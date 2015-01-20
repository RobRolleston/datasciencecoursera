cat("Sourcing function... \n")
source("cachematrix.R")

cat("Testing cache: \n (will print 'gettign cache data' 100 times) \n")
source("test1.R")
cat("\n")

cat("testing solve: \n (will take a moment or two) \n")
source("test2.R")

cat("comparing results: \n (should be TRUE) \n")
source("test3.R")

cat("\nDone \n")