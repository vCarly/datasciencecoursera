rankhospital <- function(state, outcome, num = "best")
{
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    ## Validate input and get subset of data for state and outcome
    subset = validate_read(state, outcome)
    
    ## Order data by outcome [3], then by hospital name [1]
    subset = subset[ order(subset[,3], subset[,1]), ]
    
    if( class(num) == "numeric" )
    {
        ## Check if num rank is out of bounds of subset row indices - if yes return "NA"
        if( (num > nrow(subset)) || (num<=0) ) { return("NA") }
        
        ## Return hospital with input rank num
        return(subset[num,1])
    }
    else if( num == "best" )  { return(subset[1,1]) } ## Return best (first) hospital
    else if( num == "worst" ) { return(subset[nrow(subset),1]) } ## Return worst (last) hospital
    else                      { stop("invalid rank (num)") } ## Invalid input (e.g. misspelled)
    
}

validate_read <- function(state, outcome)
{
    outcome_col = integer()
    
    ## Set appropriate 30-day mortality rate column based on input outcome.
    ## If input outcome is invalid, throw stop error.
    outcome_col =   ifelse(outcome=="heart attack", 11, 
                           ifelse(outcome=="heart failure", 17, 
                                  ifelse(outcome=="pneumonia", 23, stop("invalid outcome"))))
    
    ## Read in outcome CSV as characters
    data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check validity of input "state". If invalid throw stop error.
    if( state %in% unique(data$State) == FALSE ) {
        stop( "invalid state")
    }
    
    ## Only select hostpital name, filter state by input, and input outcome
    ## Remove full data file - don't need it in memory anymore
    ## Remove hospitals with data "Not Available" in input outcome column
    ## Transform character outcome to numeric
    subset = select(data, Hospital.Name, State, outcome_col=outcome_col) %>% filter(State==state)
    rm(data)
    subset = subset[ !(subset$outcome_col=="Not Available"), ]
    subset = transform( subset, outcome_col=as.numeric(outcome_col) )
}