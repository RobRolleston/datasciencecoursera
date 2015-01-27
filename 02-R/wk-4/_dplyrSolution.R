require(dplyr)

#Dummy data
StateA <- rep("StateA", 5)
CityA <- paste0("cityA",seq(1:5))
ValueA <- paste0("1.", seq(1:5))
StateB <- rep("StateB", 3)
CityB <- paste0("cityB",seq(1:3))
ValueB <- paste0("2.", seq(1:3))
df <- data.frame(
  State=c(StateB, StateA),
  City=c(CityB, CityA),
  Value=c(ValueB, ValueA))
df$State <- as.character(df$State)
df$City <- as.character(df$City)
df$Value <- as.numeric(as.character(df$Value))

df

#This is OK
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 3))
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 4))

# Now add a "tie" in Value
df[7,3] <- df[[6,3]]
df

# And things go wrong....
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 3))
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 4))

# So how to get just the first occurance (since rows are sorted) of that value.... ???
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 3)) %>% slice(1)
df %>% group_by(State) %>% arrange(Value, City, State) %>% filter(Value == nth(Value, 4)) %>% slice(1)

