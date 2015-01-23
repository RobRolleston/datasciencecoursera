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
  data <- tbl_df(read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)) %>%
    select(State, Hospital.Name, get(cause))
  data[,3] <- suppressWarnings(as.numeric(unlist(data[,3])))
  data <- na.omit(data)
	
	## For each state, find the hospital of the given rank
	
	## Return a data frame with the hospital names and the
	## (abbreviated) state name
	
}