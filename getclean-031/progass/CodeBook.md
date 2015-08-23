---
title:  "CodeBook.md" for "run_analysis.R"
author: Carly Stoughton
class:  Getting and Cleaning Data 'getdata-031'
date:   August 2015
---

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

One R script called run_analysis.R has been created that does the following: 
* STEP 1. Merges the training and the test sets to create one data set.
* STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* STEP 3. Uses descriptive activity names to name the activities in the data set
* STEP 4. Appropriately labels the data set with descriptive variable names. 
* STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

SEE README.md FOR FULL DESCRIPTION OF FUNCTION, AS INSTRUCTED BY PROJECT DIRECTIONS. CODEBOOK EXPLAINS VARIABLES, README EXPLAINS HOW THE FUNCTION WORKS.

"subject" is the Subject ID 1 through 30 wearing the test devices.

"activity" is the Activity performed during test, represented by 1-6.
Information in file 'activity_labels.txt'
1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING_DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING

"tBodyAcc.mean...X" is the Timed(50hz) Body Acceleration Mean on the X axis

"tBodyAcc.mean...Y" is the Timed(50hz) Body Acceleration Mean on the Y axis

"tBodyAcc.mean...Z" is the Timed(50hz) Body Acceleration Mean on the Z axis

"tGravityAcc.mean...X" is the Timed(50hz) Gravity Acceleration Mean on the X axis

"tGravityAcc.mean...Y" is the Timed(50hz) Gravity Acceleration Mean on the Y axis

"tGravityAcc.mean...Z" is the Timed(50hz) Gravity Acceleration Mean on the Z axis

"tBodyAccJerk.mean...X" is the Timed(50hz) Body Acceleration Jerk Mean on the X axis

"tBodyAccJerk.mean...Y" is the Timed(50hz) Body Acceleration Jerk Mean on the Y axis

"tBodyAccJerk.mean...Z" is the Timed(50hz) Body Acceleration Jerk Mean on the Z axis

"tBodyGyro.mean...X" is the Timed(50hz) Body Gyro Mean on the X axis

"tBodyGyro.mean...Y" is the Timed(50hz) Body Gyro Mean on the Y axis

"tBodyGyro.mean...Z" is the Timed(50hz) Body Gyro Mean on the Z axis

"tBodyGyroJerk.mean...X" is the Timed(50hz) Body Gyro Jerk Mean on the X axis

"tBodyGyroJerk.mean...Y" is the Timed(50hz) Body Gyro Jerk Mean on the Y axis

"tBodyGyroJerk.mean...Z" is the Timed(50hz) Body Gyro Jerk Mean on the Z axis

"tBodyAccMag.mean.." is the Timed(50hz) Body Acceleration Magnitude Mean

"tGravityAccMag.mean.." is the Timed(50hz) Gravity Acc Magnitude Mean

"tBodyAccJerkMag.mean.." is the Timed(50hz) Body Acceleration Jerk Magnitude Mean

"tBodyGyroMag.mean.." is the Timed(50hz) Body Gyro Magnitude Mean

"tBodyGyroJerkMag.mean.." is the Timed(50hz) Body Gyro Jerk Magnitude Mean

"fBodyAcc.mean...X" is the Frequency Body Acceleration Mean on the X axis

"fBodyAcc.mean...Y" is the Frequency Body Acceleration Mean on the Y axis

"fBodyAcc.mean...Z" is the Frequency Body Acceleration Mean on the Z axis

"fBodyAcc.meanFreq...X" is the Frequency Body Acceleration Mean Frequency on the X axis

"fBodyAcc.meanFreq...Y" is the Frequency Body Acceleration Mean Frequency on the Y axis

"fBodyAcc.meanFreq...Z" is the Frequency Body Acceleration Mean Frequency on the Z axis

"fBodyAccJerk.mean...X" is the Frequency Body Acceleration Jerk Mean on the X axis

"fBodyAccJerk.mean...Y" is the Frequency Body Acceleration Jerk Mean on the Y axis

"fBodyAccJerk.mean...Z" is the Frequency Body Acceleration Jerk Mean on the Z axis

"fBodyAccJerk.meanFreq...X" is the Frequency Body Acceleration Jerk Mean Frequency on the X axis

"fBodyAccJerk.meanFreq...Y" is the Frequency Body Acceleration Jerk Mean Frequency on the Y axis

"fBodyAccJerk.meanFreq...Z" is the Frequency Body Acceleration Jerk Mean Frequency on the Z axis

"fBodyGyro.mean...X" is the Frequency Body Gyro Mean on the X axis

"fBodyGyro.mean...Y" is the Frequency Body Gyro Mean on the Y axis

"fBodyGyro.mean...Z" is the Frequency Body Gyro Mean on the Z axis

"fBodyGyro.meanFreq...X" is the Frequency Body Gyro Mean Frequency on the X axis

"fBodyGyro.meanFreq...Y" is the Frequency Body Gyro Mean Frequency on the Y axis

"fBodyGyro.meanFreq...Z" is the Frequency Body Gyro Mean Frequency on the Z axis

"fBodyAccMag.mean.." is the Frequency Body Acceleration Magnitude Mean

"fBodyAccMag.meanFreq.." is the Frequency Body Acceleration Magnitude Mean Frequency

"fBodyBodyAccJerkMag.mean.." is the Frequency Body Acceleration Jerk Magnitude Mean

"fBodyBodyAccJerkMag.meanFreq.." is the Frequency Body Acceleration Jerk Magnitude Mean Frequency

"fBodyBodyGyroMag.mean.." is the Frequency Body Gyro Magnitude Mean

"fBodyBodyGyroMag.meanFreq.." is the Frequency Body Gyro Magnitude Mean Frequency

"fBodyBodyGyroJerkMag.mean.." is the Frequency Body Gyro Jerk Magnitude Mean

"fBodyBodyGyroJerkMag.meanFreq.." is the Frequency Body Gyro Jerk Magnitude Mean Frequency

"angle.tBodyAccMean.gravity." is the Angle between Timed Body Acceleration Mean and Gravity.

"angle.tBodyAccJerkMean..gravityMean." is the Angle between Timed Body Acceleration Jerk Mean and Gravity Mean.

"angle.tBodyGyroMean.gravityMean." is the Angle between Timed Body Gyro Mean and Gravity Mean.

"angle.tBodyGyroJerkMean.gravityMean." is the Angle between Timed Body Gyro Jerk Mean and Gravity Mean.

"angle.X.gravityMean." is the Angle between X and Gravity Mean.

"angle.Y.gravityMean." is the Angle between Y and Gravity Mean.

"angle.Z.gravityMean." is the Angle between Z and Gravity Mean.

"tBodyAcc.std...X" is the Timed(50hz) Body Acceleration Standard Deviation on the X axis

"tBodyAcc.std...Y" is the Timed(50hz) Body Acceleration Standard Deviation on the Y axis

"tBodyAcc.std...Z" is the Timed(50hz) Body Acceleration Standard Deviation on the Z axis

"tGravityAcc.std...X" is the Timed(50hz) GravityAcc Standard Deviation on the X axis

"tGravityAcc.std...Y" is the Timed(50hz) GravityAcc Standard Deviation on the Y axis

"tGravityAcc.std...Z" is the Timed(50hz) GravityAcc Standard Deviation on the Z axis

"tBodyAccJerk.std...X" is the Timed(50hz) Body Acceleration Jerk Standard Deviation on the X axis

"tBodyAccJerk.std...Y" is the Timed(50hz) Body Acceleration Jerk Standard Deviation on the Y axis

"tBodyAccJerk.std...Z" is the Timed(50hz) Body Acceleration Jerk Standard Deviation on the Z axis

"tBodyGyro.std...X" is the Timed(50hz) Body Gyro Standard Deviation on the X axis

"tBodyGyro.std...Y" is the Timed(50hz) Body Gyro Standard Deviation on the Y axis

"tBodyGyro.std...Z" is the Timed(50hz) Body Gyro Standard Deviation on the Z axis

"tBodyGyroJerk.std...X" is the Timed(50hz) Body Gyro Jerk Standard Deviation on the X axis

"tBodyGyroJerk.std...Y" is the Timed(50hz) Body Gyro Jerk Standard Deviation on the Y axis

"tBodyGyroJerk.std...Z" is the Timed(50hz) Body Gyro Jerk Standard Deviation on the Z axis

"tBodyAccMag.std.." is the Timed(50hz) Body Acceleration Magnitude Standard Deviation

"tGravityAccMag.std.." is the Timed(50hz) Gravity Acc Magnitude Standard Deviation

"tBodyAccJerkMag.std.." is the Timed(50hz) Body Acceleration Jerk Magnitude Standard Deviation

"tBodyGyroMag.std.." is the Timed(50hz) Body Gyro Magnitude Standard Deviation

"tBodyGyroJerkMag.std.." is the Timed(50hz) Body Gyro Jerk Magnitude Standard Deviation

"fBodyAcc.std...X" is the Frequency Body Acceleration Standard Deviation on the X axis

"fBodyAcc.std...Y" is the Frequency Body Acceleration Standard Deviation on the Y axis

"fBodyAcc.std...Z" is the Frequency Body Acceleration Standard Deviation on the Z axis

"fBodyAccJerk.std...X" is the Frequency Body Acceleration Jerk Standard Deviation on the X axis

"fBodyAccJerk.std...Y" is the Frequency Body Acceleration Jerk Standard Deviation on the Y axis

"fBodyAccJerk.std...Z" is the Frequency Body Acceleration Jerk Standard Deviation on the Z axis

"fBodyGyro.std...X" is the Frequency Body Gyro Standard Deviation on the X axis

"fBodyGyro.std...Y" is the Frequency Body Gyro Standard Deviation on the Y axis

"fBodyGyro.std...Z" is the Frequency Body Gyro Standard Deviation on the Z axis

"fBodyAccMag.std.." is the Frequency Body Acceleration Magnitude Standard Deviation

"fBodyBodyAccJerkMag.std.." is the Frequency Body Acceleration Jerk Magnitude Standard Deviation

"fBodyBodyGyroMag.std.." is the Frequency Body Gyro Magnitude Standard Deviation

"fBodyBodyGyroJerkMag.std.." is the Frequency Body Gyro Jerk Magnitude Standard Deviation