
Getting and Cleaning Data Project:
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

GitHub Repository:
https://github.com/paragsengupta/Getting_n_Cleaning_Data_Project
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data" under the Data Science Specialization.

Files:
–	‘run_analysis.R’ contains all the code to perform the analyses described in the 5 steps under R Script File section of CodeBook.md.
–	‘CodeBook.md’ describes the how to use the data all this, variables, the data, and any transformations or work that was performed to clean up the data.
–	‘secTidySet.txt’ is the second independent tidy data set with the average of each variable for each activity and each subject.

Functioning of the script:
–	Relevant data sets were first downloaded from the given website
–	The data sets were unzipped into the working directory
–	The different data sets, training and test, were merged as per the project requirements into one final data set
–	The measurements on the mean and standard deviation for each measurement were performed on the final data set
–	Descriptive activity names were used to name the activities in the final data set with appropriate labeling
–	A second and independent data set was created at the end with the average of each variable for each activity and each subject
