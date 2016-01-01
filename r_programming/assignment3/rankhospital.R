rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate

    # state is 7
    # hospital is 2
    # heart attack is 11
    # heart failure is 17
    # pneumonia is 23

    out <- 0
    if(outcome == "heart attack") out<-11
    else if(outcome == "heart failure") out<-17
    else if(outcome == "pneumonia") out<-23
    else stop("invalid outcome")

    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses="character")
    
    state <- outcomes[outcomes$State == state,]
    if(nrow(state) == 0) stop("invalid state")

    state[,out] = as.numeric(state[,out])
    good <- !is.na(state[out])
    rates <- state[good,]
     
    if(nrow(rates) == 0) stop("invalid outcome")

    sorted <- rates[order(rates[out], rates[2]),]
    idx <- 0
    if(num == "best") idx <- 1
    else if(num == "worst") idx <- nrow(sorted)
    else idx <- as.numeric(num)

    sorted[idx, 2]
}
