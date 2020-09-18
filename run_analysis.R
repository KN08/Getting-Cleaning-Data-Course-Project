
library(dplyr)
# download data files from web

file <-"UCI HAR Dataset.zip"
if(!file.exists(file)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url,file,method = "curl")
}
# unzip data files
folder_name<-"UCI HAR Dataset"
if(!file.exists(folder_name)){
  unzip("file")
}

# Read train folder files 
 x_train_file <- read.table("F:Getting and cleaning data with R project/UCI HAR Dataset/train/X_train.txt")
 y_train_file <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/train/y_train.txt")
 subject_train_file <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/train/subject_train.txt")

 # Read test folder files
 
 x_test_file <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/test/X_test.txt")
 y_test_file <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/test/y_test.txt")
 subject_test_file <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/test/subject_test.txt")
# read features and labels file
 
  features <- read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/features.txt")
 activity_labels <-read.table("F:/Getting and cleaning data with R project/UCI HAR Dataset/activity_labels.txt")
# merge test and train files
X_merged_data <- rbind(x_train_file,x_test_file)
y_merged_data <- rbind(y_train_file,y_test_file)
Subject_merged_data <-rbind( subject_train_file , subject_test_file )

#naming the columns

colnames(X_merged_data) <- as.character(features$V2)
colnames(y_merged_data) <- "Activity"
colnames(Subject_merged_data) <- "Subject"

# merge whole data set
Whole_data_set <-cbind(X_merged_data,y_merged_data,Subject_merged_data)

# view the dimension of whole data set
dim(Whole_data_set)  #(10299 ,563)
col_names<- colnames(Whole_data_set)
dim(col_names)

# Extracts only the measurements on the mean and standard deviation for each measurement
col_with_Mean_STD <- grep("*mean*|*std*|Subject|Activity",col_names,ignore.case = TRUE)
Extracted_col <- Whole_data_set[,col_with_Mean_STD]

# view the dim of the extracted data 
dim(Extracted_col) # (10299,88)

# Uses descriptive activity names to name the activities in the data set

Extracted_col$Activity <- as.character(Extracted_col$Activity)
for (itr in 1:6){
  Extracted_col$Activity[Extracted_col$Activity == itr] <- as.character(activity_labels[itr,2])
}

Extracted_col$Activity <- as.factor(Extracted_col$Activity)
Extracted_col$Subject <- as.factor(Extracted_col$Subject)
colnames(Extracted_col)


# ACC, Mag, tBody, -std(), -freq(),-mean(), ^f,gravity,Gyro, ^t, BodyBody are  reaplced with following
names(Extracted_col)<-gsub("Acc", "Accelerometer", names(Extracted_col))
names(Extracted_col)<-gsub("Mag", "Magnitude", names(Extracted_col))
names(Extracted_col)<-gsub("tBody", "TimeBody", names(Extracted_col))
names(Extracted_col)<-gsub("-std()", "STD", names(Extracted_col), ignore.case = TRUE)
names(Extracted_col)<-gsub("Freq()", "Frequency", names(Extracted_col), ignore.case = TRUE)
names(Extracted_col)<-gsub("-mean()", "Mean", names(Extracted_col), ignore.case = TRUE)
names(Extracted_col)<-gsub("^f", "Frequency", names(Extracted_col))
names(Extracted_col)<-gsub("gravity", "Gravity", names(Extracted_col))
names(Extracted_col)<-gsub("Gyro", "Gyroscope", names(Extracted_col))
names(Extracted_col)<-gsub("^t", "Time", names(Extracted_col))
names(Extracted_col)<-gsub("BodyBody", "Body", names(Extracted_col))
names(Extracted_col)<-gsub("angle", "Angle", names(Extracted_col))

names(Extracted_col)

## create the tidydata text file 

Data_set<-aggregate(. ~Subject + Activity, Extracted_col, mean)
Data_set<-Data_set[order(Data_set$Subject,Data_set$Activity),]
write.table(Data_set, file = "tidydata.txt",row.name=FALSE)
