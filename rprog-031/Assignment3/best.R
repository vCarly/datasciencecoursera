## Carly Stoughton, August 2015
## R Programming (rprog-031)

## NOTE: In "Hospital_Revised_Flatfiles.pdf", #19 (outcomes) skips column labels
## from 30. to 32., skipping the number 31. Therefore there ARE 46 columns in 
## the data, even though the PDF lists 47 entries (since 31. is skipped).

best <- function( state, outcome )
{
    ## Initialize variables
    best_mortality_rate = character()
    outcome_row = integer()
    
    ## Validate input and get subset of data for state and outcome
    subset = validate_read(state, outcome)
    
    ## Sort by ranking and return best hospital(s) row into outcome_row
    outcome_row = which(rank(subset$outcome_col, ties.method='min') <= 1)
    
    ## Check for a tie - if so, sort by hospital name and return first alphabetical tie
    if( length(outcome_row) != 1 ) 
    {
        ## A tie has occurred
        ties = subset[outcome_row,] %>% arrange(Hospital.Name)
        best_mortality_rate = ties[1,1]
    }
    else{ best_mortality_rate = subset[outcome_row,1] }
    
    ## Return hospital with the lowest 30-day mortality for 'outcome' in 'state'
    return( best_mortality_rate )
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
