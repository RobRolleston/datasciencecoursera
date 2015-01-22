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
  library(dplyr)
  # http://stackoverflow.com/questions/22028937/how-can-i-tell-select-in-dplyr-that-the-string-it-is-seeing-is-a-column-name-i 
  # https://github.com/hadley/dplyr/issues/333 
  
  data <- tbl_df(read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)) %>%
    filter(State == state) %>%
    select(Hospital.Name, get(cause))
  #data[,"Hospital.Name"] <- as.character(data[,"Hospital.Name"])
  #data$Hospital.Name <- as.character(data$Hospital.Name)
  #data[,cause] <- as.numeric(data[[ , cause]])
  data[,2] <- as.numeric(unlist(data[,2]))
  data <-   arrange(data, data[[cause]], Hospital.Name)
	
	## Return hospital name in that state with the lowest 30-day death rate
	as.character(data[[1,"Hospital.Name"]])
}