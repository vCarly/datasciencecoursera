q1 = function() 
{
    myurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    z <- tempfile()
    download.file(myurl,z,mode="wb")
    pic <- readJPEG(z,native=TRUE)
    quantile(pic,probs=c(0.3,0.8))
}