complete <- function(directory, id = 1:332) {
    
        ## Carly Stoughton, August 2015
  
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
  
    row = 1
    allvals = data.frame(id=numeric(), nobs=numeric())
    
    for( currentfile in id ) {

        if( currentfile < 10 ) {
            file = paste0( "00", currentfile, ".csv" )
        } 
        else if ( currentfile < 100 ) {
            file = paste0( "0", currentfile, ".csv" )
        }
        else { file = paste0( currentfile, ".csv") }
      
        path = paste0( directory, "/", file )
        data = read.csv(path, header=TRUE)
        
        count = 0

        for( r in 1:nrow(data) ) {
            if( !is.na(data[r,2]) && !is.na(data[r,3]) ) {
                count = count + 1
            }
        }
        
        allvals[row,1] = currentfile
        allvals[row,2] = count
            row = row + 1

    }
    print(allvals)
}