# Getting-Cleaning-Data-Course-Project

In this project Human Activity Recognition Using Smartphone Dataset is used

Data can the downloaded using the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A file of R script called run_analysis.R in which the following task are performed:

1)  Download data set if the data set does not exist in the working directory
2) Unzip data set if it's not already unzipped
3) First read six files(X_train,y_train,subject_train,X_test,y_test,subject_test) from train, test folders and feature and activity_labels from UCI HAR Dataset folder
4) Merge all the test and train
5) Extracts only the measurements on the mean and standard deviation for each measurement.
6) Uses descriptive activity names to name the activities in the data set
7) Appropriately labels the data set with descriptive variable names.
8) Melted data frame is created using activity label and subject as ids
9) Mean values for each variable is calculated
10) Tidy data frame is created by grouping above values based on activity and subject
