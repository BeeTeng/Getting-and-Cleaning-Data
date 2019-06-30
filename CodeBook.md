Peer-graded Assignment: Getting and Cleaning Data Course Project
Human Activity Recognition Using Smartphones Dataset
======================================================================================================================================================
Submitted by : Lim Bee Teng


run_analysis.R script is the data preparation script, which includes the 5 steps as required.


Prior to the 5 Steps: 
======================================================================================================================================================
Downloads data and assigns the variable names
  
i) Downloads data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips the data

ii) Creates the data frames by reading the text files in the zip folder and assigns the data frame names based on respective text file names
      
    List down the description of respective Activities:
      - activity_labels: 6 obs. of 2 variables
      
    List down the variable names:
      - features: 561 obs. of 2 variables
    
    70% set as training dataset: 
      - subject_train: 7352 obs of 1 variable
      - x_train: 7352 obs of 561 variables
      - y_train: 7352 obs of 1 variable
    
    30% set as training dataset: 
      - subject_test: 2947 obs of 1 variable
      - x_test: 2947 obs of 561 variables
      - y_test: 2947 obs of 1 variable



Step 1: Merges the training and the test sets to create one data set
======================================================================================================================================================
Creates following data frames, by combining respective train and test data frames

i) x: 10299 obs of 561 variables
    - Append the observations from x_train and x_test
    
ii) y: 10299 obs of 1 variable
    - Append the observations from y_train and y_test
    
iii) subject: 10299 obs of 1 variable
    - Append the observations from subject_train and subject_test
    
iv) single_df: 10299 obs of 563 variables
    - Append the observations from x, y and subject
    


Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
======================================================================================================================================================
Creates new data frame which only keep the mean and standard deviation variables

single_df2: 10299 obs of 88 variables



Step 3: Uses descriptive activity names to name the activities in the data set
======================================================================================================================================================
Creates new variable (Activity_Description) by mapping with the "n" variable from activity_labels data frame

single_df2: 10299 obs of 89 variables



Step 4: Appropriately labels the data set with descriptive variable names
======================================================================================================================================================
Extracts the column names from the data frame and identifies the naming to be converted to full description

Following are the rename done, regardless of the case:

- Rename "n" to "Activity"
- Rename variables with "Acc" to "Accelerometer"
- Rename variables with "Gyro" to "Gyroscope"
- Rename variables with "BodyBody" to "Body"
- Rename variables with "Mag" to "Magnitude"
- Rename variables begins with "t" to "Time"
- Rename variables begins with "f" to "Frequency"
- Rename variables with "mean" to "Mean"
- Rename variables with "std" to "Standard_Deviation"
- Rename variables with "angle" to "Angle"
- Rename variables with "gravity" to "Gravity"
- Rename variables with "tBody" to "TimeBody"
- Rename variables with "MeanFreq" to "MeanFrequency"



Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
======================================================================================================================================================
i) Creates final data frame (final_df), by getting the average for each variables

ii) Exports final_df to text file and names it as "final_df.txt"
