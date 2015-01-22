rankhospital <- function(state, outcome, num = "best") {
 
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
  data <- tbl_df(read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)) %>%
    filter(State == state) %>%
    select(Hospital.Name, get(cause))
  data[,2] <- suppressWarnings(as.numeric(unlist(data[,2])))
  if (num == "worst") {
    data <-   arrange(data, desc(data[[cause]]), Hospital.Name)
    position <- 1
  } else if (num == "best"){
    data <-   arrange(data, data[[cause]], Hospital.Name)
    position <- 1
  } else {
    data <-   arrange(data, data[[cause]], Hospital.Name)
    position <- num
  }
	
	## Return hospital name in that state with the given rank
	## 30-day death rate
  if (position > 0 & position <= nrow(data)) {
    data[[position,"Hospital.Name"]]
  } else {
    NA
  }
    

  
	
}