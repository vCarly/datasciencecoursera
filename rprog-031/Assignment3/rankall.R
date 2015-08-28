rankall <- function( outcome, num = "best" )
{
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    ## Load libraries
    library(plyr)
    library(dplyr)
    
    ## Initialize variables
    ranked = data.frame( hospital=character(), state=character() )
    missing = data.frame()

    ## Validate input and get data of data for state and outcome
    data = validate_all(outcome)
    
    ## Order data by state [2], outcome [3], then by hospital name [1]; remove rows with NA outcome
    data = data[ order(data[,2], data[,3], data[,1]), ]
    data = data[ !(is.na(data$outcome)), ]
    
    ## Rank outcome when grouped by state - add rank column to data.frame
    data = ddply(data, .(state), transform, ranking=rank(outcome, ties.method="first"))

    ## If looking for best hospital, set num-rank to '1'
    if ( num == "best") { num = 1 }

    if( class(num) == "numeric" )
    {
        ## Check for num-best per state, insert TRUE/FALSE if exists/does not exist
        ranked = ddply(data, .(state), mutate, ranking=(ranking==num))

        ## Only return rows that have num-ranking for each state - order columns per requirements
        ranked = ranked[ !(ranked$ranking==FALSE), 1:2 ]

            ## Handle any states with hospitals out of num-rank bounds
            if( nrow(ranked) < length(unique(data$state)))
            {
                ## Check for missing states (did not have rank specified)
                ## Insert states without specified rank as NA
                missing = as.data.frame(cbind("NA", setdiff(unique(data$state), ranked$state)))
                names(missing) = c( "hospital", "state" )
                
                ## Add states without num-ranked hospitals as "NA", order by state
                ranked = rbind(ranked, missing)
                ranked = ranked[ order(ranked[,2]), ]
            }
            return(ranked)
    }
    else if ( num == "worst")
    {
        ranked = ddply(data, .(state), filter, outcome==max(outcome))
        ranked = ranked[ , 1:2 ]
        return(ranked)
    }
    else{ stop("invalid rank (num)") }
    
}

validate_all <- function(outcome)
{
    outcome_col = integer()
    
    ## Set appropriate 30-day mortality rate column based on input outcome.
    ## If input outcome is invalid, throw stop error.
    outcome_col =   ifelse( outcome=="heart attack", 11, 
                           ifelse( outcome=="heart failure", 17, 
                                  ifelse( outcome=="pneumonia", 23, stop("invalid outcome") )))
    
    ## Read in outcome CSV as characters
    full_data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Only select hostpital name, filter state by input, and input outcome
    ## Remove full data file - don't need it in memory anymore
    ## Remove hospitals with data "Not Available" in input outcome column
    ## Transform character outcome to numeric
    sub_data = select(full_data, hospital=Hospital.Name, state=State, outcome=outcome_col)
    rm(full_data)
    sub_data = transform( sub_data, outcome=as.numeric(outcome) )
}