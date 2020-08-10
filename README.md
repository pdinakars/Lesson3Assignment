# Lesson3Assignment
Mean of Activity data performed by different Volunteer groups

Steps Performed to complete project

#Read TRAIN Data path from "/UCI HAR Dataset/train/*_train.txt"
#Read TEST Data path from "/UCI HAR Dataset/test/*_test.txt"
#Read features path which has the column names for Training and Test data -> converted to lowe case and removed commas and substituted with - for band columns
#Read Activity data from "UCI HAR Dataset/activity_labels.txt"path
#The XTrain and XTest data column names are provided in features file
#Merge the Test data which is Xtest,Subject or Volunteer and Activity performed
#Merge the Training data which is Xtest,Subject or Volunteer and Activity performed
#Merge Training and Test Data
#load library dplyr to create Tidyset which is mean of activities grouped by Volunteer Id, Activity Id and Activity Typr

