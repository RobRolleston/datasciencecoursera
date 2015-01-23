#Part-4 Rank All
library("dplyr")
source("rankall.R")


head(rankall("heart attack", 10), 10)
tail(rankall("pneumonia", "wprst"), 3)
tail(rankall("heart failure"), 10)
