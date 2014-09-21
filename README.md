README.md
=========================

## Summary of this *README.md* file: ##

> This README.md file is for the course project of *Getting and Cleaning Data*
> provided through Coursera. This README.md file described\s the basic operation of the *run_analaysis.R* script.  This README.md file is divided into several sections defined by head header section.

## Scope of this *README.md* file: ##
This README.md file covers the operation of the scripts for this course project and how the scrip operates.  There is only executable script associated with this project is the *run_analaysis.R* script.

## Overview of the  *run_analysis.R* file.
The *run_analaysis.R* file is designed in sections where each section corresponds to a numbered item of the problem statement for the class assignment.  That is, the assignment required 5 steps and therefore, the run__analysis.R script is divided into 5 corresponding sections.

## Operation of the  *run_analysis.R* script.
### (1) Input Parameter for run_analysis.R:
run_analysis.R has one variable that should be set and that is the *workingdirectory* string. The *workingdirectory* string is the directory in which you want the script to download the data files, unzip the data files, and output the output files.
### (2) Output Data for run_analysis.R:
run_analysis.R will output a single text filed called *results.txt* which is the second data set as described int the algorithm section.
### (3) Operation of the run_analaysis.R script:
 - The data is downloaded and extracted from: http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
 - The test and train data are aggregated together using cbined() and rbind() functions.
 - The initial column names are added to the data in memory.
 - Mean and Standard Deviation values are extracted and the others are discarded by using a grep() command to identify the relevant columns.
 - Some false positives (columns) are manually removed using negative values in the column indexes.
 - The column names are modified as follows using greap() functions and sub() functions:

 String Removed:  | String Added:
 ------------- | ------------- 
 "BodyBody"	|	"Body" because of error in the original data files.
 "-mean()"    | "MeanOf" added to the beginning    
 "meanFreq()"    | "MeanFrequencyOf" added to the beginning
 "-std()"	|	"StandardDeviationOf" added to the beginning
"tBodyAcc" | "BodyLinearAcceleration"
"fBodyAcc" | "FrequencyOfBodyLinearAcceleration"
"tGravityAcc" | "GravityLinearAcceleration"
"tBodyGyroAcc" | "BodyRotationalAcceleration"
"tBodyGyro" | "BodyRotationalVelocity"
"fBodyGyro" | "FrequencyOfBodyRotationalVelocity"
"Mag" | "Magnitude"
"Jerk" | "Derivative"

- The resulting column name transformation resulted in the following changes:

 Original Column Name:  | New Column Name:
 ------------- | ------------- 
"tBodyAcc-mean()-X"|"MeanOfBodyLinearAcceleration-X"
"tBodyAcc-mean()-Y"|"MeanOfBodyLinearAcceleration-Y"
"tBodyAcc-mean()-Z"|"MeanOfBodyLinearAcceleration-Z"
"tBodyAcc-std()-X"|"StandardDeviationOfBodyLinearAcceleration-X"
"tBodyAcc-std()-Y"|"StandardDeviationOfBodyLinearAcceleration-Y"
"tBodyAcc-std()-Z"|"StandardDeviationOfBodyLinearAcceleration-Z"
"tGravityAcc-mean()-X"|"MeanOfGravityLinearAcceleration-X"
"tGravityAcc-mean()-Y"|"MeanOfGravityLinearAcceleration-Y"
"tGravityAcc-mean()-Z"|"MeanOfGravityLinearAcceleration-Z"
"tGravityAcc-std()-X"|"StandardDeviationOfGravityLinearAcceleration-X"
"tGravityAcc-std()-Y"|"StandardDeviationOfGravityLinearAcceleration-Y"
"tGravityAcc-std()-Z"|"StandardDeviationOfGravityLinearAcceleration-Z"
"tBodyAccJerk-mean()-X"|"MeanOfBodyLinearAccelerationDerivative-X"
"tBodyAccJerk-mean()-Y"|"MeanOfBodyLinearAccelerationDerivative-Y"
"tBodyAccJerk-mean()-Z"|"MeanOfBodyLinearAccelerationDerivative-Z"
"tBodyAccJerk-std()-X"|"StandardDeviationOfBodyLinearAccelerationDerivative-X"
"tBodyAccJerk-std()-Y"|"StandardDeviationOfBodyLinearAccelerationDerivative-Y"
"tBodyAccJerk-std()-Z"|"StandardDeviationOfBodyLinearAccelerationDerivative-Z"
"tBodyGyro-mean()-X"|"MeanOfBodyRotationalVelocity-X"
"tBodyGyro-mean()-Y"|"MeanOfBodyRotationalVelocity-Y"
"tBodyGyro-mean()-Z"|"MeanOfBodyRotationalVelocity-Z"
"tBodyGyro-std()-X"|"StandardDeviationOfBodyRotationalVelocity-X"
"tBodyGyro-std()-Y"|"StandardDeviationOfBodyRotationalVelocity-Y"
"tBodyGyro-std()-Z"|"StandardDeviationOfBodyRotationalVelocity-Z"
"tBodyGyroJerk-mean()-X"|"MeanOfBodyRotationalVelocityDerivative-X"
"tBodyGyroJerk-mean()-Y"|"MeanOfBodyRotationalVelocityDerivative-Y"
"tBodyGyroJerk-mean()-Z"|"MeanOfBodyRotationalVelocityDerivative-Z"
"tBodyGyroJerk-std()-X"|"StandardDeviationOfBodyRotationalVelocityDerivative-X"
"tBodyGyroJerk-std()-Y"|"StandardDeviationOfBodyRotationalVelocityDerivative-Y"
"tBodyGyroJerk-std()-Z"|"StandardDeviationOfBodyRotationalVelocityDerivative-Z"
"tBodyAccMag-mean()"|"MeanOfBodyLinearAccelerationMagnitude"
"tBodyAccMag-std()"|"StandardDeviationOfBodyLinearAccelerationMagnitude"
"tGravityAccMag-mean()"|"MeanOfGravityLinearAccelerationMagnitude"
"tGravityAccMag-std()"|"StandardDeviationOfGravityLinearAccelerationMagnitude"
"tBodyAccJerkMag-mean()"|"MeanOfBodyLinearAccelerationDerivativeMagnitude"
"tBodyAccJerkMag-std()"|"StandardDeviationOfBodyLinearAccelerationDerivativeMagnitude"
"tBodyGyroMag-mean()"|"MeanOfBodyRotationalVelocityMagnitude"
"tBodyGyroMag-std()"|"StandardDeviationOfBodyRotationalVelocityMagnitude"
"tBodyGyroJerkMag-mean()"|"MeanOfBodyRotationalVelocityDerivativeMagnitude"
"tBodyGyroJerkMag-std()"|"StandardDeviationOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyAcc-mean()-X"|"MeanOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-mean()-Y"|"MeanOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-mean()-Z"|"MeanOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAcc-std()-X"|"StandardDeviationOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-std()-Y"|"StandardDeviationOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-std()-Z"|"StandardDeviationOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAcc-meanFreq()-X"|"MeanFrequencyOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-meanFreq()-Y"|"MeanFrequencyOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-meanFreq()-Z"|"MeanFrequencyOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAccJerk-mean()-X"|"MeanOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-mean()-Y"|"MeanOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-mean()-Z"|"MeanOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyAccJerk-std()-X"|"StandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-std()-Y"|"StandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-std()-Z"|"StandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyAccJerk-meanFreq()-X"|"MeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-meanFreq()-Y"|"MeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-meanFreq()-Z"|"MeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyGyro-mean()-X"|"MeanOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-mean()-Y"|"MeanOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-mean()-Z"|"MeanOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyGyro-std()-X"|"StandardDeviationOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-std()-Y"|"StandardDeviationOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-std()-Z"|"StandardDeviationOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyGyro-meanFreq()-X"|"MeanFrequencyOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-meanFreq()-Y"|"MeanFrequencyOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-meanFreq()-Z"|"MeanFrequencyOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyAccMag-mean()"|"MeanOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyAccMag-std()"|"StandardDeviationOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyAccMag-meanFreq()"|"MeanFrequencyOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyBodyAccJerkMag-mean()"|"MeanOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyAccJerkMag-std()"|"StandardDeviationOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyAccJerkMag-meanFreq()"|"MeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyGyroMag-mean()"|"MeanOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroMag-std()"|"StandardDeviationOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroMag-meanFreq()"|"MeanFrequencyOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroJerkMag-mean()"|"MeanOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyBodyGyroJerkMag-std()"|"StandardDeviationOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyBodyGyroJerkMag-meanFreq()"|"MeanFrequencyOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"SubjectID"|"SubjectID"
"ActivityName"|"ActivityName"


-	Then, a mean value was calculated for each of the above variable combination of SubjectID and ActivityName Pair.  Column names "SubjectIDSummaryIndex" and "ActivityNameSummaryIndex" were added to identify the pairs. Also, for the second dataset, each variable had the phrase "Average" added to the from of them except for the first two to signify that the mean function was passed through the aggregate function to generate this second set of data. The resulting column names in this second set of data included the following:

Original Column Name:  | New Column Name:
  ------------- | ------------- 
Target Variable 1|"SubjectIDSummaryIndex"
Target Variable 2|"ActivityNameSummaryIndex"
"tBodyAcc-mean()-X"|"AverageOfMeanOfBodyLinearAcceleration-X"
"tBodyAcc-mean()-Y"|"AverageOfMeanOfBodyLinearAcceleration-Y"
"tBodyAcc-mean()-Z"|"AverageOfMeanOfBodyLinearAcceleration-Z"
"tBodyAcc-std()-X"|"AverageOfStandardDeviationOfBodyLinearAcceleration-X"
"tBodyAcc-std()-Y"|"AverageOfStandardDeviationOfBodyLinearAcceleration-Y"
"tBodyAcc-std()-Z"|"AverageOfStandardDeviationOfBodyLinearAcceleration-Z"
"tGravityAcc-mean()-X"|"AverageOfMeanOfGravityLinearAcceleration-X"
"tGravityAcc-mean()-Y"|"AverageOfMeanOfGravityLinearAcceleration-Y"
"tGravityAcc-mean()-Z"|"AverageOfMeanOfGravityLinearAcceleration-Z"
"tGravityAcc-std()-X"|"AverageOfStandardDeviationOfGravityLinearAcceleration-X"
"tGravityAcc-std()-Y"|"AverageOfStandardDeviationOfGravityLinearAcceleration-Y"
"tGravityAcc-std()-Z"|"AverageOfStandardDeviationOfGravityLinearAcceleration-Z"
"tBodyAccJerk-mean()-X"|"AverageOfMeanOfBodyLinearAccelerationDerivative-X"
"tBodyAccJerk-mean()-Y"|"AverageOfMeanOfBodyLinearAccelerationDerivative-Y"
"tBodyAccJerk-mean()-Z"|"AverageOfMeanOfBodyLinearAccelerationDerivative-Z"
"tBodyAccJerk-std()-X"|"AverageOfStandardDeviationOfBodyLinearAccelerationDerivative-X"
"tBodyAccJerk-std()-Y"|"AverageOfStandardDeviationOfBodyLinearAccelerationDerivative-Y"
"tBodyAccJerk-std()-Z"|"AverageOfStandardDeviationOfBodyLinearAccelerationDerivative-Z"
"tBodyGyro-mean()-X"|"AverageOfMeanOfBodyRotationalVelocity-X"
"tBodyGyro-mean()-Y"|"AverageOfMeanOfBodyRotationalVelocity-Y"
"tBodyGyro-mean()-Z"|"AverageOfMeanOfBodyRotationalVelocity-Z"
"tBodyGyro-std()-X"|"AverageOfStandardDeviationOfBodyRotationalVelocity-X"
"tBodyGyro-std()-Y"|"AverageOfStandardDeviationOfBodyRotationalVelocity-Y"
"tBodyGyro-std()-Z"|"AverageOfStandardDeviationOfBodyRotationalVelocity-Z"
"tBodyGyroJerk-mean()-X"|"AverageOfMeanOfBodyRotationalVelocityDerivative-X"
"tBodyGyroJerk-mean()-Y"|"AverageOfMeanOfBodyRotationalVelocityDerivative-Y"
"tBodyGyroJerk-mean()-Z"|"AverageOfMeanOfBodyRotationalVelocityDerivative-Z"
"tBodyGyroJerk-std()-X"|"AverageOfStandardDeviationOfBodyRotationalVelocityDerivative-X"
"tBodyGyroJerk-std()-Y"|"AverageOfStandardDeviationOfBodyRotationalVelocityDerivative-Y"
"tBodyGyroJerk-std()-Z"|"AverageOfStandardDeviationOfBodyRotationalVelocityDerivative-Z"
"tBodyAccMag-mean()"|"AverageOfMeanOfBodyLinearAccelerationMagnitude"
"tBodyAccMag-std()"|"AverageOfStandardDeviationOfBodyLinearAccelerationMagnitude"
"tGravityAccMag-mean()"|"AverageOfMeanOfGravityLinearAccelerationMagnitude"
"tGravityAccMag-std()"|"AverageOfStandardDeviationOfGravityLinearAccelerationMagnitude"
"tBodyAccJerkMag-mean()"|"AverageOfMeanOfBodyLinearAccelerationDerivativeMagnitude"
"tBodyAccJerkMag-std()"|"AverageOfStandardDeviationOfBodyLinearAccelerationDerivativeMagnitude"
"tBodyGyroMag-mean()"|"AverageOfMeanOfBodyRotationalVelocityMagnitude"
"tBodyGyroMag-std()"|"AverageOfStandardDeviationOfBodyRotationalVelocityMagnitude"
"tBodyGyroJerkMag-mean()"|"AverageOfMeanOfBodyRotationalVelocityDerivativeMagnitude"
"tBodyGyroJerkMag-std()"|"AverageOfStandardDeviationOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyAcc-mean()-X"|"AverageOfMeanOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-mean()-Y"|"AverageOfMeanOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-mean()-Z"|"AverageOfMeanOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAcc-std()-X"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-std()-Y"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-std()-Z"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAcc-meanFreq()-X"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAcceleration-X"
"fBodyAcc-meanFreq()-Y"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAcceleration-Y"
"fBodyAcc-meanFreq()-Z"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAcceleration-Z"
"fBodyAccJerk-mean()-X"|"AverageOfMeanOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-mean()-Y"|"AverageOfMeanOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-mean()-Z"|"AverageOfMeanOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyAccJerk-std()-X"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-std()-Y"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-std()-Z"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyAccJerk-meanFreq()-X"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-X"
"fBodyAccJerk-meanFreq()-Y"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-Y"
"fBodyAccJerk-meanFreq()-Z"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivative-Z"
"fBodyGyro-mean()-X"|"AverageOfMeanOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-mean()-Y"|"AverageOfMeanOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-mean()-Z"|"AverageOfMeanOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyGyro-std()-X"|"AverageOfStandardDeviationOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-std()-Y"|"AverageOfStandardDeviationOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-std()-Z"|"AverageOfStandardDeviationOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyGyro-meanFreq()-X"|"AverageOfMeanFrequencyOfFrequencyOfBodyRotationalVelocity-X"
"fBodyGyro-meanFreq()-Y"|"AverageOfMeanFrequencyOfFrequencyOfBodyRotationalVelocity-Y"
"fBodyGyro-meanFreq()-Z"|"AverageOfMeanFrequencyOfFrequencyOfBodyRotationalVelocity-Z"
"fBodyAccMag-mean()"|"AverageOfMeanOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyAccMag-std()"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyAccMag-meanFreq()"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAccelerationMagnitude"
"fBodyBodyAccJerkMag-mean()"|"AverageOfMeanOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyAccJerkMag-std()"|"AverageOfStandardDeviationOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyAccJerkMag-meanFreq()"|"AverageOfMeanFrequencyOfFrequencyOfBodyLinearAccelerationDerivativeMagnitude"
"fBodyBodyGyroMag-mean()"|"AverageOfMeanOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroMag-std()"|"AverageOfStandardDeviationOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroMag-meanFreq()"|"AverageOfMeanFrequencyOfFrequencyOfBodyRotationalVelocityMagnitude"
"fBodyBodyGyroJerkMag-mean()"|"AverageOfMeanOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyBodyGyroJerkMag-std()"|"AverageOfStandardDeviationOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"fBodyBodyGyroJerkMag-meanFreq()"|"AverageOfMeanFrequencyOfFrequencyOfBodyRotationalVelocityDerivativeMagnitude"
"SubjectID"|"AverageOfSubjectID"
"ActivityName"|"AverageOfActivityName"





- As is easily seen above, the word "Average" was added to the front of each variable as found in the code book for the second set of data except for the first two column names.

### (4) Output files generated by run_analysis.R:

- This second set of data is extracted as a *results.txt* file.

