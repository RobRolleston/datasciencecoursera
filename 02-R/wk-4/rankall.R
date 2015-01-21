rankall <- function(outcome, num = "best") {
  
  ## Check that state and outcome are valid
  if (outcome == "pneumonia") {
    cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
  }
  else if (outcome == "heart attack") {
    cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack" 
  }
  else if (outcome == "heart failure") {
    cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
  } else { 
    stop("invalid outcome")
  }
 
  # Read the outcome data
  data <- read.csv("outcome-of-care-measures.csv")
	
	## For each state, find the hospital of the given rank
	
	## Return a data frame with the hospital names and the
	## (abbreviated) state name
	
}