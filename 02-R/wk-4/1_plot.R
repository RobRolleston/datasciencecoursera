# Part-1 Plotting
outcome <- read.csv("outcome-of-care-measures.csv")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
