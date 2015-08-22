pollutantmean <- function(directory, pollutant, id = 1:332) {

        ## Carly Stoughton, August 2015
  
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
  
        ## get and set first value of id vector as iteration number
        itnum = id[1]
        
        ## initialize numeric vector of all pollutant values
        allvals = numeric()
  
        ##  Loop for number of iterations in id
        while( itnum >= id[1] && itnum <= last(id) ) {
          
            ## coerse correct filename from iteration number
            if( itnum < 10 ) {
              file = paste0( directory, "/", "00", itnum, ".csv" )
            } else if ( itnum < 100 )
              file = paste0( directory, "/", "0", itnum, ".csv" )
            else { file = paste0( directory, "/", itnum, ".csv") }
          
            ## read file
            data = read.csv(file, header=TRUE)

            ## add pollutant data from this file to vector with data from all files
            allvals = c(allvals, data[,pollutant])
            
            ## increment iteration number
            itnum = itnum+1
        }
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        mean(allvals, na.rm=TRUE)
}