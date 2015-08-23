---
title:  "README.md" for "run_analysis.R"
author: Carly Stoughton
class:  Getting and Cleaning Data 'getdata-031'
date:   August 2015
---

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

One R script called run_analysis.R has been created that does the following: 
* STEP 1. Merges the training and the test sets to create one data set.
* STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* STEP 3. Uses descriptive activity names to name the activities in the data set
* STEP 4. Appropriately labels the data set with descriptive variable names. 
* STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

LINE BY LINE DESCRIPTION OF "run_analysis.R" FUNCTION:

* run_analysis.R function accepts no inputs
* Assumes 'plyr' and 'dplyr' are installed, but the libraries have not necessarily been loaded.
* Ensure 'plyr' and 'dplyr' libraries are loaded. 
* Read in 'subject_test.txt' and 'subject_train.txt' Subject IDs to tbl_df, data.frame variable 'subject'
* Name column 'Subject' in 'subject' DF
* Read in 'y_test.txt' and 'y_train.txt' Activity IDs to tbl_df, data.frame variable 'y'
* Name column 'Activity' in 'y' DF
* Save current timestamp to note time data read per best practices, into 'DataTimestamp'
* Swap Activity ID numbers 1-6 with Activity Names (i.e. WALKING, SITTING, etc.) per 'activity_labels.txt'
* Read in 'X_test.txt' and 'X_train.txt' feature measurements to tbl_df, data.frame variable 'x'
* Read in feature labels to 'feature_labels' from 'features.txt'
* Pass names of feature labels into 'names(x)' to label columns with feature names
* Make names unique so 'dplyr' functions can handle appropriately
* Only select mean() and std() calculations into x
* select() with '-' variable names was used instead of selecting based on 'mean()' and 'std()' so that order of columns is preserved. If 'select(x, contains("mean()"), contains("std()"))' was used, select() first iterates over the columns and pulls all 'mean()'-containing columns, and then iterates a second complete time for 'std()'-containing columns. Therefore the columns get reordered so that all 'mean()'s are first, and then all 'std()'. I saw that as dirty data, and did not want column reorderding - I wanted it preserved per the order laid out in 'features.txt', hence why select() with '-' was used to leave the desired columns in place, and remove the undesired ones. 
* NOTE: mean() and std() were selected exclusively. Features like 'fBodyBodyGyroJerkMag-meanFreq()' were not included since it is not a direct mean() or std() calculation.
* Appropriately label the data set with descriptive Feature variable names using regular expressions
* "-mean()" and "-std()" replaced with ", Mean", and ", StD"
* From "features_info.txt" : "prefix 't' to denote time" - time domain signals
* Also, "Fast Fourier Transform (FFT) was applied to some of these signals" prefix "f__" (frequency), "t" replaced with "Time-", "f" replaced with "Freq-"
* Bind 'subject', 'x', and 'y' into one data frame to product output for step 4: tidy data set
* One variable per column. The feature names look like they could have multiple variables within, however, they represent a SINGLE measurement or calculation, with a SINGLE value. Therefore it is tidy. One observation includes one activity, and the feature measurements/calculations for that observation.
* For step 5, group tbl_df data.frame 'data5' by Subject, then Activity
* Sort 'data5' by Subject, then Activity
* From 'data5', take the mean of the features for each Activity for each Subject to generate the resulting tidy data stored in 'data5' for step 5, uploaded to the course submission page.
* Function returns 'data5'
* Last line can be uncommented to generate a text file containing the tidy data set 'step5'