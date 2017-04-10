# Initializing the required libraries
library(plyr)
library(dplyr)
library(tidyr)
# Setting the working directory
setwd("d:/data Science John Hopkins/Getting and Cleaning Data/data")
# Setting the source url and downloading the data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Dataset.zip")
unzip(zipfile="./Dataset.zip")
# Read the relevant files from the downloaded dataset
x_train <- read.table(file.path("./UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(file.path("./UCI HAR Dataset/train/y_train.txt"))
subject_train <- read.table(file.path("./UCI HAR Dataset/train/subject_train.txt"))
x_test <- read.table(file.path("./UCI HAR Dataset/test/X_test.txt"))
y_test <- read.table(file.path("./UCI HAR Dataset/test/y_test.txt"))
subject_test <- read.table(file.path("./UCI HAR Dataset/test/subject_test.txt")) 
# Merge the various training and test data sets to create one training and one test data set
# Add the subject and activity columns to the respective training and test data sets
train <- cbind(subject_train, x_train, y_train)
test  <- cbind(subject_test, x_test, y_test)
# Merge the two data sets training and test into one single data frame 'df'
df <- rbind(train, test)
# Read the column names from 'features'
cnames <- read.table(file.path("./UCI HAR Dataset/features.txt"))
cnames <- as.character(cnames$V2)
# Add names for the extra columns
cnames <- c('subject', cnames, 'activity')
head(cnames)
# Clean and assign column names of the data frame
cnames <- gsub("[()]", "", cnames)
colnames(df) <- cnames
# Extract and retain only mean for each measurement
toKeepMeanStd <- grep('mean',colnames(df), value = TRUE)
# Remove unwanted column meanFreq
toKeepMeanStd <- Filter(function(x) !any(grepl("meanFreq", x)), toKeepMeanStd)
# Add the standard deviation columns
toKeepMeanStd <- c(toKeepMeanStd, grep('std',colnames(df), value = TRUE))
toKeepMeanStd <- c('subject', toKeepMeanStd, 'activity')
df <- df[toKeepMeanStd]
names(df)
# Assign descriptive names to activities
activities <- read.table(file.path("./UCI HAR Dataset/activity_labels.txt"))
activities <- mutate(activities, V2 = tolower(V2))
# data frame 'activities' created with new names to activities
class(activities)
activities
df = merge(df, activities, by.x="activity", by.y="V1", all=TRUE)
# Remove old column 'activity'
df <- subset(df, select = -1)
names(df)[names(df) == 'V2'] <- 'activity'
# Tidy the data set with the required values
tidyDataFrame <-  df %>% gather(measure, value, (2:67)) %>% separate(measure, c("measurement", "stat", "axis"))
# Replace missing values NA for measurements without 'axis'
summary_tidyDataFrame <- tidyDataFrame %>%
        group_by(subject, activity, measurement, stat, axis) %>%
        summarize_all(funs(mean)) 
# summary_tidyDataFrame contains 11880 observations of 39 variables
summary_tidyDataFrame
write.table(summary_tidyDataFrame, 'secTidyDataset.txt', row.names = FALSE)
