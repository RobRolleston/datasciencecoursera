rankall <- function(outcome, num = "best") {
  keepCols = c("State", "Hospital.Name",
               "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia",
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
               "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
  ## Check that state and outcome are valid
  if (outcome == "pneumonia") {
    #cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    cause <- "P"
  }
  else if (outcome == "heart attack") {
    #cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    cause <- "A"
  }
  else if (outcome == "heart failure") {
    #cause <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    cause <- "F"
  } else { 
    stop("invalid outcome")
  }
 
  # Read the outcome data
  #data <- tbl_df(read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)) %>%
  #  select(State, Hospital.Name, get(cause))
  #colnames(data)[3] <- "death"
  #data[,3] <- suppressWarnings(as.numeric(unlist(data[,3])))
  #foo <- transmute(data, death=suppressWarnings(as.numeric(unlist(data[,death]))))
  #data <- na.omit(data)
  #colnames(data)[3] <- "death"
	
  
  tmp1 <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
  tmp2 <- tmp1[,keepCols]
  colnames(tmp2)[3] <- "P"
  colnames(tmp2)[4] <- "A"
  colnames(tmp2)[5] <- "F"
  tmp2$A <- suppressWarnings(as.numeric(tmp2$A))
  tmp2$F <- suppressWarnings(as.numeric(tmp2$F))
  tmp2$P <- suppressWarnings(as.numeric(tmp2$P))
  #tmp3 <- tmp2[complete.cases(tmp2),]
  data <- tbl_df(tmp2) %>%
    select(State, Hospital.Name, get(cause))
  data <- data[complete.cases(data),]
  colnames(data)[3] <- "D"
   
  
  #foo <- group_by(data, State, Hospital.Name)
  #bar <- summarise(foo, rank=first(D))
  #View(bar)
	## For each state, find the hospital of the given rank
  #foo <- group_by(data, State)
  #bar <- summarise(foo, rank=first(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  #bar <- summarise(foo, rank=first(D, order_by = State, default = NA))
  #bar1 <- summarise(foo, rank=first(D))
  #barn <- summarise(foo, rank=nth(D, 6))
  #iew(bar)
  
  foo <- data %>% 
    group_by(State) %>% 
    arrange(D) #%>% 
    #filter(D == nth(D, 20))
  
	## Return a data frame with the hospital names and the
	## (abbreviated) state name
  if (num == "worst") {
    data <- data %>% group_by(State) %>% arrange(desc(D), Hospital.Name)
    position <- 1
  } else if (num == "best"){
    data <- data %>% group_by(State) %>% arrange(D, Hospital.Name)
    position <- 1
  } else {
    data <- data %>% group_by(State) %>% arrange(D, Hospital.Name)
    position <- num
  }
  #data
  ## Return hospital name in that state with the given rank
  ### 30-day death rate
  #if (position > 0 & position <= nrow(data)) {
  #  data[[position,"Hospital.Name"]]
  #} else {
  #  NA
  #}
  data <- slice(data, position:position)
  #filter(data, D == nth(D, get(postion)))
	data <- select(data, Hospital.Name, State)
  colnames(data)[1] <- "hospital"
  colnames(data)[2] <- "state"
  data.frame(data)
}