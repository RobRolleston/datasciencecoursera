best <- function(state, outcome) {
  
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

  if (is.na(match(state, state.abb))) {
    stop("invalid state")
  } 

	# Read the outcome data
  data <- read.csv("outcome-of-care-measures.csv")
	
	## Return hospital name in that state with the lowest 30-day death rate
	
}