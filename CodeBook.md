Source Data Set used:
Human Activity Recognition Using Smartphones
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R Script File:
R code used to generate the tidy report can be found in "run_analysis.R" 
It performs the following steps (in accordance assigned task of course work):

0. Downloading dataset
0.1 Checking for existence of local working directory 
0.2 Storing the data set url into a variable
0.3 Downloading the data set from the url and storing that into a zip file in the local working directory
0.4 Unzip dataset to the local working directory

1. Merging the training and the test sets to create one data set
1.1 Reading downloaded and unzipped data files
1.1.1 Reading trainings tables using read.table() and storing them into respective variables 
1.1.2 Reading testing tables using read.table() and storing them into respective variables 
1.1.3 Reading feature vector using read.table() and storing it into a variable 
1.1.4 Reading activity labels using read.table() and storing it into a variable 
1.2 Assigning column names for better readability using colnames()
1.3 Merging all data in one set:
1.3.1 Merging training data in one merged set using cbind():
1.3.2 Merging test data in one merged set using cbind()
1.3.3 Combining the two merged data sets from training and test into one final merged data set setAllInOne 

2. Extracting only the measurements on the mean and standard deviation for each measurement
	2.1 Reading column names from the final merged data set setAllInOne:
	2.2 Create vector for defining ID, mean and standard deviation 
	2.3 Making necessary subset from final merged data set setAllInOne 

3. Using descriptive activity names to name the activities in the data set 

4. Appropriately labeling the data set with descriptive variable names 

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
5.1 Making second tidy data set 
5.2 Writing second tidy data set in txt file

PS: The code takes for granted all the data is present in the same folder, un-compressed and without names altered.

Variables used for the process:
Data from downloaded files:
–	x_train
–	y_train
–	x_test
–	y_test
–	subject_train 
–	subject_test

Merged data sets for further analysis:
–	x_data
–	y_data
–	subject_data

Correct labels for variable in x_data dataset
–	features
