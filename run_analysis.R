##################################
########## Step 1 ################
## Merge training and test data ##
##################################

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

##################################
########### Step 2 ###############
#### Extract mean and SD data ####
##################################
Mean_SD_DF <- merged_DF[,c("Activity", "Subject", "V1", "V2", "V3", "V4", "V5", "V6", 
                           "V41", "V42", "V43", "V44", "V45", "V46", 
                           "V81", "V82", "V83", "V84", "V85", "V86",
                           "V121", "V122", "V123", "V124", "V125", "V126",
                           "V161", "V162", "V163", "V164", "V165", "V166",
                           "V201", "V202", "V214", "V215", "V227", "V228",
                           "V240", "V241", "V253", "V254",
                           "V266", "V267", "V268", "V269", "V270", "V271",
                           "V345", "V346", "V347", "V348", "V349", "V350",
                           "V424", "V425", "V426", "V427", "V428", "V429",
                           "V503", "V504", "V529", "V530", "V542", "V543",
                           "set")]

##################################
########## Step 3 ################
## Use descriptive activity names
##################################
Mean_SD_DF[, 1] <- activity_DF[Mean_SD_DF[,1], 2]

#####################################
############# Step 4 ################
## Label the variables in the dataset
#####################################

## Get variable names from features.txt
features <- read.table("features.txt")

## Assign column names from features DF to the final dataset
colnames(Mean_SD_DF)[3] <- as.character(features[1,2])
colnames(Mean_SD_DF)[4] <- as.character(features[2,2])
colnames(Mean_SD_DF)[5] <- as.character(features[3,2])
colnames(Mean_SD_DF)[6] <- as.character(features[4,2])
colnames(Mean_SD_DF)[7] <- as.character(features[5,2])
colnames(Mean_SD_DF)[8] <- as.character(features[6,2])
colnames(Mean_SD_DF)[9] <- as.character(features[41,2])
colnames(Mean_SD_DF)[10] <- as.character(features[42,2])
colnames(Mean_SD_DF)[11] <- as.character(features[43,2])
colnames(Mean_SD_DF)[12] <- as.character(features[44,2])
colnames(Mean_SD_DF)[13] <- as.character(features[45,2])
colnames(Mean_SD_DF)[14] <- as.character(features[46,2])
colnames(Mean_SD_DF)[15] <- as.character(features[81,2])
colnames(Mean_SD_DF)[16] <- as.character(features[82,2])
colnames(Mean_SD_DF)[17] <- as.character(features[83,2])
colnames(Mean_SD_DF)[18] <- as.character(features[84,2])
colnames(Mean_SD_DF)[19] <- as.character(features[85,2])
colnames(Mean_SD_DF)[20] <- as.character(features[86,2])
colnames(Mean_SD_DF)[21] <- as.character(features[121,2])
colnames(Mean_SD_DF)[22] <- as.character(features[122,2])
colnames(Mean_SD_DF)[23] <- as.character(features[123,2])
colnames(Mean_SD_DF)[24] <- as.character(features[124,2])
colnames(Mean_SD_DF)[25] <- as.character(features[125,2])
colnames(Mean_SD_DF)[26] <- as.character(features[126,2])
colnames(Mean_SD_DF)[27] <- as.character(features[161,2])
colnames(Mean_SD_DF)[28] <- as.character(features[162,2])
colnames(Mean_SD_DF)[29] <- as.character(features[163,2])
colnames(Mean_SD_DF)[30] <- as.character(features[164,2])
colnames(Mean_SD_DF)[31] <- as.character(features[165,2])
colnames(Mean_SD_DF)[32] <- as.character(features[166,2])
colnames(Mean_SD_DF)[33] <- as.character(features[201,2])
colnames(Mean_SD_DF)[34] <- as.character(features[202,2])
colnames(Mean_SD_DF)[35] <- as.character(features[214,2])
colnames(Mean_SD_DF)[36] <- as.character(features[215,2])
colnames(Mean_SD_DF)[37] <- as.character(features[227,2])
colnames(Mean_SD_DF)[38] <- as.character(features[228,2])
colnames(Mean_SD_DF)[39] <- as.character(features[240,2])
colnames(Mean_SD_DF)[40] <- as.character(features[241,2])
colnames(Mean_SD_DF)[41] <- as.character(features[253,2])
colnames(Mean_SD_DF)[42] <- as.character(features[254,2])
colnames(Mean_SD_DF)[43] <- as.character(features[266,2])
colnames(Mean_SD_DF)[44] <- as.character(features[267,2])
colnames(Mean_SD_DF)[45] <- as.character(features[268,2])
colnames(Mean_SD_DF)[46] <- as.character(features[269,2])
colnames(Mean_SD_DF)[47] <- as.character(features[270,2])
colnames(Mean_SD_DF)[48] <- as.character(features[271,2])
colnames(Mean_SD_DF)[49] <- as.character(features[345,2])
colnames(Mean_SD_DF)[50] <- as.character(features[346,2])
colnames(Mean_SD_DF)[51] <- as.character(features[347,2])
colnames(Mean_SD_DF)[52] <- as.character(features[348,2])
colnames(Mean_SD_DF)[53] <- as.character(features[349,2])
colnames(Mean_SD_DF)[54] <- as.character(features[350,2])
colnames(Mean_SD_DF)[55] <- as.character(features[424,2])
colnames(Mean_SD_DF)[56] <- as.character(features[425,2])
colnames(Mean_SD_DF)[57] <- as.character(features[426,2])
colnames(Mean_SD_DF)[58] <- as.character(features[427,2])
colnames(Mean_SD_DF)[59] <- as.character(features[428,2])
colnames(Mean_SD_DF)[60] <- as.character(features[429,2])
colnames(Mean_SD_DF)[61] <- as.character(features[503,2])
colnames(Mean_SD_DF)[62] <- as.character(features[504,2])
colnames(Mean_SD_DF)[63] <- as.character(features[529,2])
colnames(Mean_SD_DF)[64] <- as.character(features[530,2])
colnames(Mean_SD_DF)[65] <- as.character(features[542,2])
colnames(Mean_SD_DF)[66] <- as.character(features[543,2])

##################################
########## Step 5 ################
## Create a new tidy dataset with average of each variable for each activity and each subject
Mean_SD_DF.AVG <- aggregate(Mean_SD_DF[, 3:66], list(Mean_SD_DF$Activity, Mean_SD_DF$Subject), mean)

