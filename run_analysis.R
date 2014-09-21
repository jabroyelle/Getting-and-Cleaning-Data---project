## R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function () {

#### 1) Load the Labels to later name the columns tables
features = read.table("features.txt")
ActivityLabel = read.table("activity_labels.txt")


#### 2) For 'test ' measurements
## Load the data from files
## and Appropriately labels the data set with descriptive variable names. 
testVolunter <- read.table ("test/subject_test.txt", colClasses = "numeric",col.names=c("Volunters"))
testDataSet <- read.table ("test/X_test.txt", colClasses = "numeric", col.names=as.vector(features$V2))
testActivityLabel <- read.table ("test/y_test.txt", colClasses = "numeric",col.names=c("Activities"))

## create data.frame with descriptive activity names to name the activities in the data set
testActivityNames <- sapply(testActivityLabel, function(x) ActivityLabel$V2[x])

## bind the 3 data.frames by column  
testAllData <- cbind(testVolunter,testActivityNames,testDataSet)


#### 3) For 'train ' measurements
## Load the data from files
## and Appropriately labels the data set with descriptive variable names. 
trainVolunter <- read.table ("train/subject_train.txt", colClasses = "numeric",col.names=c("Volunters"))
trainDataSet <- read.table ("train/X_train.txt", colClasses = "numeric", col.names=as.vector(features$V2))
trainActivityLabel <- read.table ("train/y_train.txt", colClasses = "numeric",col.names=c("Activities"))

## create data.frame with descriptive activity names to name the activities in the data set
trainActivityNames <- sapply(trainActivityLabel, function(x) ActivityLabel$V2[x])

## bind the 3 data.frames by column  
trainAllData <- cbind(trainVolunter,trainActivityNames,trainDataSet)

#### 4)  Merges the training and the test sets to create one data set
allData = rbind (testAllData, trainAllData)

#### 5)  Extracts only the measurements on the mean and standard deviation for each measurement.
allSelectedData <- cbind(Volunters=allData$Volunters, Activities=allData$Activities,
tBodyAcc.mean.X=allData$tBodyAcc.mean...X,
tBodyAcc.mean.Y=allData$tBodyAcc.mean...Y,
tBodyAcc.mean.Z=allData$tBodyAcc.mean...Z,
tBodyAcc.std.X=allData$tBodyAcc.std...X,
tBodyAcc.std.Y=allData$tBodyAcc.std...Y,
tBodyAcc.std.Z=allData$tBodyAcc.std...Z,
tGravityAcc.mean.X=allData$tGravityAcc.mean...X,
tGravityAcc.mean.Y=allData$tGravityAcc.mean...Y,
tGravityAcc.mean.Z=allData$tGravityAcc.mean...Z,
tGravityAcc.std.X=allData$tGravityAcc.std...X,
tGravityAcc.std.Y=allData$tGravityAcc.std...Y,
tGravityAcc.std.Z=allData$tGravityAcc.std...Z,
tBodyAccJerk.mean.X=allData$tBodyAccJerk.mean...X,
tBodyAccJerk.mean.Y=allData$tBodyAccJerk.mean...Y,
tBodyAccJerk.mean.Z=allData$tBodyAccJerk.mean...Z,
tBodyAccJerk.std.X=allData$tBodyAccJerk.std...X,
tBodyAccJerk.std.Y=allData$tBodyAccJerk.std...Y,
tBodyAccJerk.std.Z=allData$tBodyAccJerk.std...Z,
tBodyGyro.mean.X=allData$tBodyGyro.mean...X,
tBodyGyro.mean.Y=allData$tBodyGyro.mean...Y,
tBodyGyro.mean.Z=allData$tBodyGyro.mean...Z,
tBodyGyro.std.X=allData$tBodyGyro.std...X,
tBodyGyro.std.Y=allData$tBodyGyro.std...Y,
tBodyGyro.std.Z=allData$tBodyGyro.std...Z,
tBodyGyroJerk.mean.X=allData$tBodyGyroJerk.mean...X,
tBodyGyroJerk.mean.Y=allData$tBodyGyroJerk.mean...Y,
tBodyGyroJerk.mean.Z=allData$tBodyGyroJerk.mean...Z,
tBodyGyroJerk.std.X=allData$tBodyGyroJerk.std...X,
tBodyGyroJerk.std.Y=allData$tBodyGyroJerk.std...Y,
tBodyGyroJerk.std.Z=allData$tBodyGyroJerk.std...Z,
tBodyAccMag.mean=allData$tBodyAccMag.mean..,
tBodyAccMag.std=allData$tBodyAccMag.std..,
tGravityAccMag.mean=allData$tGravityAccMag.mean..,
tGravityAccMag.std=allData$tGravityAccMag.std..,
tBodyAccJerkMag.mean=allData$tBodyAccJerkMag.mean..,
tBodyAccJerkMag.std=allData$tBodyAccJerkMag.std..,
tBodyGyroMag.mean=allData$tBodyGyroMag.mean..,
tBodyGyroMag.std=allData$tBodyGyroMag.std..,
tBodyGyroJerkMag.mean=allData$tBodyGyroJerkMag.mean..,
tBodyGyroJerkMag.std=allData$tBodyGyroJerkMag.std..,
fBodyAcc.mean.X=allData$fBodyAcc.mean...X,
fBodyAcc.mean.Y=allData$fBodyAcc.mean...Y,
fBodyAcc.mean.Z=allData$fBodyAcc.mean...Z,
fBodyAcc.std.X=allData$fBodyAcc.std...X,
fBodyAcc.std.Y=allData$fBodyAcc.std...Y,
fBodyAcc.std.Z=allData$fBodyAcc.std...Z,
fBodyAcc.meanFreq.X=allData$fBodyAcc.meanFreq...X,
fBodyAcc.meanFreq.Y=allData$fBodyAcc.meanFreq...Y,
fBodyAcc.meanFreq.Z=allData$fBodyAcc.meanFreq...Z,
fBodyAccJerk.mean.X=allData$fBodyAccJerk.mean...X,
fBodyAccJerk.mean.Y=allData$fBodyAccJerk.mean...Y,
fBodyAccJerk.mean.Z=allData$fBodyAccJerk.mean...Z,
fBodyAccJerk.std.X=allData$fBodyAccJerk.std...X,
fBodyAccJerk.std.Y=allData$fBodyAccJerk.std...Y,
fBodyAccJerk.std.Z=allData$fBodyAccJerk.std...Z,
fBodyAccJerk.meanFreq.X=allData$fBodyAccJerk.meanFreq...X,
fBodyAccJerk.meanFreq.Y=allData$fBodyAccJerk.meanFreq...Y,
fBodyAccJerk.meanFreq.Z=allData$fBodyAccJerk.meanFreq...Z,
fBodyGyro.mean.X=allData$fBodyGyro.mean...X,
fBodyGyro.mean.Y=allData$fBodyGyro.mean...Y,
fBodyGyro.mean.Z=allData$fBodyGyro.mean...Z,
fBodyGyro.std.X=allData$fBodyGyro.std...X,
fBodyGyro.std.Y=allData$fBodyGyro.std...Y,
fBodyGyro.std.Z=allData$fBodyGyro.std...Z,
fBodyGyro.meanFreq.X=allData$fBodyGyro.meanFreq...X,
fBodyGyro.meanFreq.Y=allData$fBodyGyro.meanFreq...Y,
fBodyGyro.meanFreq.Z=allData$fBodyGyro.meanFreq...Z,
fBodyAccMag.mean=allData$fBodyAccMag.mean..,
fBodyAccMag.std=allData$fBodyAccMag.std..,
fBodyAccMag.meanFreq=allData$fBodyAccMag.meanFreq..,
fBodyBodyAccJerkMag.mean=allData$fBodyBodyAccJerkMag.mean..,
fBodyBodyAccJerkMag.std=allData$fBodyBodyAccJerkMag.std..,
fBodyBodyAccJerkMag.meanFreq=allData$fBodyBodyAccJerkMag.meanFreq..,
fBodyBodyGyroMag.mean=allData$fBodyBodyGyroMag.mean..,
fBodyBodyGyroMag.std=allData$fBodyBodyGyroMag.std..,
fBodyBodyGyroMag.meanFreq=allData$fBodyBodyGyroMag.meanFreq..,
fBodyBodyGyroJerkMag.mean=allData$fBodyBodyGyroJerkMag.mean..,
fBodyBodyGyroJerkMag.std=allData$fBodyBodyGyroJerkMag.std..,
fBodyBodyGyroJerkMag.meanFreq=allData$fBodyBodyGyroJerkMag.meanFreq..)

write.table (allSelectedData, file="Data1.txt")

### 2nd  second, independent tidy data is missing (no time left !) 
}
