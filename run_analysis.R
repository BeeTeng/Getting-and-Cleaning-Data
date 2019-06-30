

# Download data and assign the variable names

getwd()

setwd('C:/Coursera')


filename <- "UCI HAR Dataset.zip"

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./UCI HAR Dataset.zip")


# Unzip the folder
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}



activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("n", "Activity"))

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","Functions"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Functions)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "n")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Functions)

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "n")


# 1.Merges the training and the test sets to create one data set.

x <- rbind(x_train,x_test)

y <- rbind(y_train,y_test)

subject <- rbind(subject_train,subject_test) 

single_df <- cbind(subject,x,y)


# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

library(dplyr)


single_df2 <- single_df %>% select(Subject, n, contains("mean"), contains("std"))


# 3.Uses descriptive activity names to name the activities in the data set

single_df2$Activity_Description <- activity_labels[single_df2$n, 2]


# 4.Appropriately labels the data set with descriptive variable names. 

colnames(single_df2)

single_df2 <- rename(single_df2, Activity = n)
names(single_df2)<-gsub("Acc", "Accelerometer", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("Gyro", "Gyroscope", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("BodyBody", "Body", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("Mag", "Magnitude", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("^t", "Time", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("^f", "Frequency", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("mean", "Mean", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("std", "Standard_Deviation", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("angle", "Angle", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("gravity", "Gravity", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("tBody", "TimeBody", names(single_df2), ignore.case = TRUE)
names(single_df2)<-gsub("MeanFreq.", "MeanFrequency.", names(single_df2), ignore.case = TRUE)


# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

final_df <- single_df2 %>%
  group_by(Subject, Activity_Description) %>%
  summarise_all(funs(mean))
write.table(final_df, "final_df.txt", row.name=FALSE)


