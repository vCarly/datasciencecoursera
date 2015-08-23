##---------------------------------------------------------------------------------------------------
## Carly Stoughton, August 2015
## SEE README.MD FOR FULL DESCRIPTION OF FUNCTION IN THIS DIRECTORY
## DATA USED: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## run_analysis.R does the following: 
## STEP 1. Merges the training and the test sets to create one data set.
## STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## STEP 3. Uses descriptive activity names to name the activities in the data set
## STEP 4. Appropriately labels the data set with descriptive variable names. 
## STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
## FUNCTION HAS NO INPUT. 
## FUNCTION RETURNS TIDY DATASET OF CLASS data.frame NAMED 'data5'
##---------------------------------------------------------------------------------------------------

run_analysis <- function() {
  
    ## Function requires plyr and dplyr library - ensure dplyr is loaded
    library(plyr)
    library(dplyr)
    
    ## STEP 1: Merge 'test' and 'train' data sets
    ## Read in and combine subject IDs for test and train; label column
    subject = tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt")) %>%
              rbind(tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt")))
    names(subject) = "Subject"
    
    ## STEP 1: Merge 'test' and 'train' data sets
    ## Read in and combine activity IDs for test and train; label column
    y = tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt")) %>%
        rbind(tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt")))
    activity_labels = tbl_df(read.table("./UCI HAR Dataset/activity_labels.txt"))
    names(y) = "Activity"
    
    ## Note date and time data were read in by this function
    DataTimestamp = Sys.time()
    
    ## STEP 3: Use desciptive activity names
    ## Mutate activity numbers to activity names using activity_labels.txt
    y$Activity = factor(y$Activity, activity_labels$V1, activity_labels$V2)
      
    ## Read in and bind feature measurements for test and train
    x = tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt")) %>%
        rbind(tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt")))
    
    ## Read in feature labels; temporarily merge feature number and name to preserve 
    ## column ordering and make unique (original data set includes duplicates)
    feature_labels = tbl_df(read.table("./UCI HAR Dataset/features.txt"))

    ## Set feature names
    names(x) = feature_labels[[2]]
    names(x) = make.unique(names(x), sep = " ")
    
    ## STEP 2: Select only mean and std dev columns; update x
    ## x = select(x, contains("mean()"), contains("std()"))
    x = select(x, -contains("mad()"), -contains("max()"), -contains("min()"), -contains("sma()"), -contains("energy()"), -contains("iqr()"), -contains("entropy"), -contains("arCoeff()"), -contains("correlation()"), -contains("skewness"), -contains("kurtosis"), -contains("bandsEnergy"), -contains(",gravity"), -contains("meanFreq()"), -contains("maxInds"))
    
    ## STEP 4: Appropriately label the data set with descriptive variable names.
    ## "-mean()" and "-std()" replaced with ", Mean", and ", StD"
    ## From "features_info.txt" : "prefix 't' to denote time" - time domain signals
    ## Also, "Fast Fourier Transform (FFT) was applied to some of these signals" prefix "f__" (frequency)
    ## "t" replaced with "Time-", "f" replaced with "Freq-"
    names(x) = gsub('^([[:alpha:]]*)-std\\(\\)([[:graph:]]*)$', '\\1\\2, StD', names(x))
    names(x) = gsub('^([[:alpha:]]*)-mean\\(\\)([[:graph:]]*)$', '\\1\\2, Mean', names(x))
    names(x) = gsub("^t", "Time-", names(x))
    names(x) = gsub("^f", "Freq-", names(x))
    
    ## OUTPUT of STEP 4: MERGED DATA SET (data4)
    ## Build combined, final data set for PART 4
    
    data4 = cbind(subject, y) %>% cbind(x) %>% tbl_df
    
    ## STEP 5 - TIDY DATA SET (data5)
    ## Group and sort by Subject and Activity to clean up
    ## For each Subject's Activity, take the mean to summarize observations per Activity, per Subject

    data5 = group_by(data4, Subject, Activity) %>% arrange(Subject, Activity)
    data5 = ddply(data5, .variables=~Subject+Activity, .fun=colwise(mean))
    
    ## Can be uncommented to write a text file containing Part 5's data5 tidy data set
    ## write.table(data5, file="Stoughton_Tidy.txt", row.names = FALSE)
}