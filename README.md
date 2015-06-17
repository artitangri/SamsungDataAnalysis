# SamsungDataAnalysis
This repository holds the files for the project for Getting and Cleaning Data for Coursera Data Scientist Certification

features.txt contains the name of all 561 variables that are measured here
activity_labels.txt contains the details on what the numbers mean for the activities in the data files.
X_train.txt file contains training data for all the variables
y_train.txt file contains the activity information for training data
subject_train.txt contains the subject information for training data
X_test.txt file contains test data for all the variables
y_test.txt file contains the subject information for test data
subject_test.txt contains the subject information for training data

The run_analysis.R script contains the code that does the following
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

