Source Data Set used:

Human Activity Recognition Using Smartphones
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Set Description – Variables:

–	"subject" 
o	Integer
o	Identifies one of the of 30 volunteers that were part of the experiment.

–	"activity"
o	Character
o	Identifies one of the six activities that each of the 30 volunteers of the experiment performed
o	“laying”, “sitting”, “standing”, “walking”, “walking_downstairs”, “walking_upstairs”

–	"measurement"
o	Character 
o	fBodyAcc, fBodyAccJerk, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroJerkMag, fBodyBodyGyroMag, fBodyGyro, tBodyAcc, tBodyAccJerk, tBodyAccJerkMag, tBodyAccMag, tBodyGyro, tBodyGyroJerk, tBodyGyroJerkMag. tBodyGyroMag, tGravityAcc, tGravityAccMag
o	"tAcc-XYZ"" and "tGyro-XYZ"" are raw signals coming from the accelerometer and gyroscope 3-axial. 
o	Prefix 't' denote the time domain of the measurement. "tBodyAcc"" and "tGravityAcc", derived from the separation into a body and a gravity part of the acceleration signals. 
o	Jerk signals "tBodyAccJerk" and "tBodyGyroJerk" are obtained by deriving in time the body linear acceleration and the angular velocity. 
o	"tBodyAccMag", "tGravityAccMag", "tBodyAccJerkMag", "tBodyGyroMag", "tBodyGyroJerkMag" are the magnitude of these three-dimensional signals and are calculated using the Euclidean norm (). 
o	"fBodyAcc", "fBodyAccJerk", "fBodyGyro", "fBodyAccJerkMag", "fBodyGyroMag", "fBodyGyroJerkMag" are the Fast Fourier Transform (FFT) of these signals. (Note the 'f' to indicate frequency domain signals).

–	"stat": variables estimated from the signals
o	mean: mean value
o	std: standard deviation

–	"axis":
o	X,Y,Z: for three dimensional signals specifies the relevant axis
o	NA: identifies "magnitude" values

–	"value": 
o	The statistical values of mean and standard deviations based on the subject, activity, measurements and the axis

Global Environment Variables

Data:

–	x_train : training data set : 7352 observations of 561 variables
–	y_train : training labels : 7352 observations of 1 variable
–	y_test : test data set : 2947 observations of 561 variables
–	x_test : test labels : 2947 observations of 1 variable
–	subject_train : subjects participating in the training study : 7352 observations of 1 variable
–	subject_test : subjects participating in the test study : 2947 observations of 1 variable
–	train : merged x_train and y_train data sets : 7352 observations of 563 variables
–	test : merged x_test and y_test data sets : 2947 observations of 563 variables
–	df : merged single data set with both training and test data : 10299 observations of 68 variables
–	activities : various activities performed by the subjects : 6 observations of 2 variables
–	tidyDataFrame : complete tidy data set : 679734 observations of 6 variables
–	summary_tidyDataFrame : 11880 observations of 6 variables

Values:

–	fileurl : the website url for the source dataset
–	cnames : column names for the source data set : chr[1:563]
–	toKeepMeanStd : summarized data set with only mean and standard deviation values : chr[1:68]

How the script (‘run_analysis.R’) performed the analysis and cleaning of the data

–	Initialized the libraries required
–	Set the working directory and the url which has the source dataset
–	Downloaded the dataset from the url as a zipped file and unzipped that into the working directory
–	Read the relevant files from the dataset and stored them accordingly into x_train, y_train, x_test, x_test, subject_train, subject_test
–	Merged the dataset and labels of each of training and test data into one train and test dataset
–	Merged using cbind both the training and test dataset into one single data frame
–	Worked with the column names and activity names to create a clean data frame with assigned column names
–	Extract a subset of only the mean and standard deviations from the data frame
–	Assigned descriptive names to the extracted subset
–	Tidy up with extracted subset
–	Create a second tidy data set

Sample of the final tidy data set:

Random:

"subject" "activity" "measurement" "stat" "axis" "value"
1 "laying" "fBodyAcc" "mean" "X" -0.9390990524
1 "standing" "fBodyAcc" "std" "Y" -0.972293102075472
1 "walking" "fBodyAcc" "mean" "Z" -0.331560117789474
1 "walking_downstairs" "fBodyAccJerk" "std" "Z" -0.401721464285714
1 "walking_upstairs" "fBodyAccJerk" "std" "Y" -0.381777065283019

Head:

1 "laying" "fBodyAcc" "mean" "X" -0.9390990524
1 "laying" "fBodyAcc" "mean" "Y" -0.86706520518
1 "laying" "fBodyAcc" "mean" "Z" -0.8826668762
1 "laying" "fBodyAcc" "std" "X" -0.9244374346
1 "laying" "fBodyAcc" "std" "Y" -0.8336255561
1 "laying" "fBodyAcc" "std" "Z" -0.81289155944

Tail:

30 "walking_upstairs" "tGravityAcc" "mean" "Z" -0.0221401100714154
30 "walking_upstairs" "tGravityAcc" "std" "X" -0.954033624307692
30 "walking_upstairs" "tGravityAcc" "std" "Y" -0.914933936
30 "walking_upstairs" "tGravityAcc" "std" "Z" -0.862402791230769
30 "walking_upstairs" "tGravityAccMag" "mean" NA -0.137627857227385
30 "walking_upstairs" "tGravityAccMag" "std" NA -0.327410815861538


