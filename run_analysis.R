## Step 1 Merge training and test data
## Read the training data from the files.
## Measurements
X_trainDF <- read.table("train/X_train.txt")
## Activities 
y_trainDF <- read.table("train/y_train.txt")
# Subject Data
subject_trainDF <- read.table("train/subject_train.txt")

## Combine the measurements with the activity and subject data
train_DF <- cbind(y_trainDF, subject_trainDF, X_trainDF)

## Set the names of the first two columns to Activity and Subject
colnames(train_DF)[1] <- "Activity"
colnames(train_DF)[2] <- "Subject"

## Add a new column set to the training data to identify it as training after merging 
train_DF$set <- "training"

## Read the test data from the files.
## Measurements
X_testDF <- read.table("test/X_test.txt")
## Activities 
y_testDF <- read.table("test/y_test.txt")
# Subject Data
subject_testDF <- read.table("test/subject_test.txt")

## Combine the measurements with the activity and subject data
test_DF <- cbind(y_testDF, subject_testDF, X_testDF)

## Set the names of the first two columns to Activity and Subject
colnames(test_DF)[1] <- "Activity"
colnames(test_DF)[2] <- "Subject"

## Add a new column set to the training data to identify it as training after merging 
test_DF$set <- "test"

## Merge the data using merge command setting all=TRUE to get all data from both DF
merged_DF <- merge(train_DF, test_DF, all=TRUE)

## Step 2 Extract mean and SD data which are the first 6 columns in the training and test data files.
Mean_SD_DF <- merged_DF[,c("Activity", "Subject", "V1", "V2", "V3", "V4", "V5", "V6", "set")]

## Step 3 Use descriptive activity names
Mean_SD_DF[, 1] <- activity_DF[Mean_SD_DF[,1], 2]

## Step 4 Label the variables in the dataset
## Get variable names from features.txt
features <- read.table("features.txt")

## First 6 variables in the features are mean and SD, assign those values as column names to the final dataset
colnames(Mean_SD_DF)[3] <- features[1,2]
colnames(Mean_SD_DF)[4] <- features[2,2]
colnames(Mean_SD_DF)[5] <- features[3,2]
colnames(Mean_SD_DF)[6] <- features[4,2]
colnames(Mean_SD_DF)[7] <- features[5,2]
colnames(Mean_SD_DF)[8] <- features[6,2]

## Step 5 Create a new tidy dataset with average of each variable for each activity and each subject
Mean_SD_DF.AVG <- aggregate(Mean_SD_DF[, 3:8], list(Mean_SD_DF$Activity, Mean_SD_DF$Subject), mean)

