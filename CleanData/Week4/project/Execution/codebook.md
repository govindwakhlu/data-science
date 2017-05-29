Code Book

This summarizes the data fields in tidy_data.txt. See the README for more information on how this output was derived.


Assumptions:
- Data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is already downloaded
- The working directory is set to the parent directory
- The assignment suggested to "extract only the measurements on the mean and standard deviation...". This was not explained in more detail. For the sake of this project, we assumed this only meant the measurements like "tBodyAcc-mean()-X" and does not include "fBodyBodyGyroMag-meanFreq()". A full list of extracted measurements in listed below.

Variables:
subject_id - The ID of the test subject
activity - The activity performed when the corresponding measurements were taken.
Measurements - A list of values that contain the average/mean value of that measurement, grouped by the subject_id and activity pair.


List of Activitities (numbers indicate Activity ID in original data set)
1: WALKING
2: WALKING_UPSTAIRS
3: WALKING_DOWNSTAIRS
4: SITTING
5: STANDING
6: LAYING


List of Measurements
"tBodyAcc-mean()-X",
"tBodyAcc-mean()-Y",
"tBodyAcc-mean()-Z",
"tBodyAcc-std()-X",
"tBodyAcc-std()-Y",
"tBodyAcc-std()-Z",
"tGravityAcc-mean()-X",
"tGravityAcc-mean()-Y",
"tGravityAcc-mean()-Z",
"tGravityAcc-std()-X",
"tGravityAcc-std()-Y",
"tGravityAcc-std()-Z",
"tBodyAccJerk-mean()-X",
"tBodyAccJerk-mean()-Y",
"tBodyAccJerk-mean()-Z",
"tBodyAccJerk-std()-X",
"tBodyAccJerk-std()-Y",
"tBodyAccJerk-std()-Z",
"tBodyGyro-mean()-X",
"tBodyGyro-mean()-Y",
"tBodyGyro-mean()-Z",
"tBodyGyro-std()-X",
"tBodyGyro-std()-Y",
"tBodyGyro-std()-Z",
"tBodyGyroJerk-mean()-X",
"tBodyGyroJerk-mean()-Y",
"tBodyGyroJerk-mean()-Z",
"tBodyGyroJerk-std()-X",
"tBodyGyroJerk-std()-Y",
"tBodyGyroJerk-std()-Z",
"tBodyAccMag-mean()",
"tBodyAccMag-std()",
"tGravityAccMag-mean()",
"tGravityAccMag-std()",
"tBodyAccJerkMag-mean()",
"tBodyAccJerkMag-std()",
"tBodyGyroMag-mean()",
"tBodyGyroMag-std()",
"tBodyGyroJerkMag-mean()",
"tBodyGyroJerkMag-std()",
"fBodyAcc-mean()-X",
"fBodyAcc-mean()-Y",
"fBodyAcc-mean()-Z",
"fBodyAcc-std()-X",
"fBodyAcc-std()-Y",
"fBodyAcc-std()-Z",
"fBodyAccJerk-mean()-X",
"fBodyAccJerk-mean()-Y",
"fBodyAccJerk-mean()-Z",
"fBodyAccJerk-std()-X",
"fBodyAccJerk-std()-Y",
"fBodyAccJerk-std()-Z",
"fBodyGyro-mean()-X",
"fBodyGyro-mean()-Y",
"fBodyGyro-mean()-Z",
"fBodyGyro-std()-X",
"fBodyGyro-std()-Y",
"fBodyGyro-std()-Z",
"fBodyAccMag-mean()",
"fBodyAccMag-std()",
"fBodyBodyAccJerkMag-mean()",
"fBodyBodyAccJerkMag-std()",
"fBodyBodyGyroMag-mean()",
"fBodyBodyGyroMag-std()",
"fBodyBodyGyroJerkMag-mean()",
"fBodyBodyGyroJerkMag-std()"