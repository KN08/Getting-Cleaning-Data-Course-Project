Data description
The data set is taken from UCI HAR Dataset. The dataset is based on the human activity recognition using smart phones. The dataset contains types six activities
	1.   WALKING
	2.   WALKING_UPSTAIRS
	3.   WALKING_DOWNSTAIRS
	4.   SITTING
	5.   STANDING
	6.   LYING
The Following two columns are the identifier:
	1.   subject - ID of participant
	2.   activity - ID of activity type
Mean and standard deviation for the following features are used:
1.   tBodyAccMag
2.   tGravityAccMag
3.   tBodyAccJerkMag
4.   tBodyAcc-XYZ
5.   tGravityAcc-XYZ
6.   tBodyAccJerk-XYZ
7.   tBodyGyroMag
8.   tBodyGyroJerkMag
9.   tBodyGyro-XYZ
10.  tBodyGyroJerk-XYZ
11.  fBodyAccMag
12.  fBodyAccJerkMag
13.  fBodyGyroMag
14.  fBodyAcc-XYZ
15.  fBodyAccJerk-XYZ
16.  fBodyGyro-XYZ
17.  fBodyGyroJerkMag

In these features prefix’t’ to denote and prefix ‘f’ dente the frequency and axial signals  are denoted using ‘XYZ’ in 3 directions

Modification:
The following modifications are done to clean up original data:
	1.   To create one data set the training and the test sets are merged.
	2.   For each measurement only mean and standard deviation based measurements are extracted.
	3.   Uses descriptive activity names to name the activities in the data set.
	4.   Appropriately labels the data set with descriptive variable names. Rename the column 
	5.   Find average of each variable 
	6.   Tidy data frame is created by grouping above values based on activity and subject

