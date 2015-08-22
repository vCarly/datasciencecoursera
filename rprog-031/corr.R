corr <- function(directory, threshold = 0) {

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations required to compute 
  ## the correlation between nitrate and sulfate; the default is 0
  ## Return a numeric vector of correlations.  <-- ALLVALS!!!
  
  allvals = numeric()

  for( currentfile in 1:332 ) 
  {
    if( currentfile < 10 ) { file = paste0(directory, "/00", currentfile, ".csv") } 
    else if ( currentfile < 100 ) { file = paste0( directory, "/0", currentfile, ".csv") }
    else { file = paste0( directory, "/", currentfile, ".csv") }
    
    data = read.csv(file, header=TRUE)
    validrow = numeric()
    
    for( r in 1:nrow(data) ) {
      if( !is.na(data[r,2]) && !is.na(data[r,3]) ) {
        validrow = c(validrow, r)
      }
    }
    
    if( threshold == 0 && length(validrow) != 0 ) {
      allvals = c( allvals, cor(data[validrow,2], data[validrow,3]) )
    } else if( length(validrow) > threshold ) {
      allvals = c( allvals, cor(data[validrow,2], data[validrow,3]) ) }
  }
  print(allvals)
}