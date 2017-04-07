# run_analysis.R
library(plyr)

# 0. Downloading dataset
# 0.1 Checking for existence of local working directory 	

if(!file.exists("./data")){dir.create("./data")}	

# 0.2 Storing the data set url into a variable
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"	

# 0.3 Downloading the data set from the url and storing that into a zip file in the local working directory
download.file(fileUrl,destfile="./data/Dataset.zip")	

# 0.4 Unzip dataset to the local working directory	
unzip(zipfile="./data/Dataset.zip",exdir="./data")	

# 1. Merging the training and the test sets to create one data set:	
# 1.1 Reading downloaded and unzipped data files	
# 1.1.1 Reading trainings tables using read.table() and storing them into respective variables

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")	
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")	
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")	

# 1.1.2 Reading testing tables using read.table() and storing them into respective variables:	
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")	
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")	
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")	

# 1.1.3 Reading feature vector using read.table() and storing it into a variable:	
features <- read.table('./data/UCI HAR Dataset/features.txt')	

# 1.1.4 Reading activity labels using read.table() and storing it into a variable::	
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')	

# 1.2 Assigning column names for better readability using colnames():	
colnames(x_train) <- features[,2] 	
colnames(y_train) <-"activityId"	
colnames(subject_train) <- "subjectId"	
colnames(x_test) <- features[,2] 	
colnames(y_test) <- "activityId"	
colnames(subject_test) <- "subjectId"	
colnames(activityLabels) <- c('activityId','activityType')	

# 1.3 Merging all data in one set:	
# 1.3.1 Merging training data in one merged set using cbind():	
mrg_train <- cbind(y_train, subject_train, x_train)	

# 1.3.2 Merging test data in one merged set using cbind():	
mrg_test <- cbind(y_test, subject_test, x_test)	

# 1.3.3 Combining the two merged data sets from training and test into one final merged data set setAllInOne:	
setAllInOne <- rbind(mrg_train, mrg_test)	

# 2. Extracting only the measurements on the mean and standard deviation for each measurement	
# 2.1 Reading column names from the final merged data set setAllInOne:	
colNames <- colnames(setAllInOne)	

# 2.2 Create vector for defining ID, mean and standard deviation:	
mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

# 2.3 Making necessary subset from final merged data set setAllInOne:	
setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]	

# 3. Using descriptive activity names to name the activities in the data set:	
setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

# 4. Appropriately labeling the data set with descriptive variable names.	
# This step was made in previous step: See 1.3, 2.2, 2.3.	

# 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:	
# 5.1 Making second tidy data set 	
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

# 5.2 Writing second tidy data set in txt file	
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)
