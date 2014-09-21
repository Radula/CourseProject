######################################################################################
# This file is run_analysis.R.
# It is the course project for Getting and Cleaning Data through Coursera.
# The program is divided into five sections, each section corresponds to a step of the
# problem statement.
# Data was obtained from http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Please set the working directory global string to a directory you you want to extract
# the data from.
#
######################################################################################

#feel free to modify your desired target directory
workingdirectory<-"/Users/auser/Documents/"

######
###### The following performs the Step of '1 Merges the training and the test sets to create one data set.' ######
######

# This next subsection Dowload's and unzip's files
if (!file.exists(workingdirectory)) {
  dir.create(workingdirectory)
}
setwd(workingdirectory)
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","data.zip")
unzip('data.zip')

# Aggregate's all the data into one table called 'data'
X_train<-read.table('./UCI HAR Dataset/train/X_train.txt')
X_test<-read.table('./UCI HAR Dataset/test/X_test.txt')
data<-rbind(X_train,X_test)
rm(X_train)
rm(X_test)

subject_train<-read.table('./UCI HAR Dataset/train/subject_train.txt')
subject_test<-read.table('./UCI HAR Dataset/test/subject_test.txt')
data<-cbind(data,c(subject_train[,1],subject_test[,1]))
rm(subject_train)
rm(subject_test)

y_train<-read.table('./UCI HAR Dataset/train/y_train.txt')
y_test<-read.table('./UCI HAR Dataset/test/y_test.txt')
data<-cbind(data,c(y_train[,1],y_test[,1]))
rm(y_train)
rm(y_test)

activity_labels<-read.table('./UCI HAR Dataset/activity_labels.txt')
temp<-activity_labels[data[,563],2] #temp save's the description name of the activitie for later use
rm(activity_labels)

######
###### The following performs the Step of '2 Extracts only the measurements on the mean and standard deviation for each measurement.' ######
######

# sets column names to orignally named values and adds SubjectID and Activity Name of column
features<-read.table('./UCI HAR Dataset/features.txt')
colnames(data)<-c(as.vector(features$V2),"SubjectID","ActivityName")

# selects column names with mean or std in the column name
extract_mean_columns<-grep('mean',tolower(colnames(data)))
extract_std_columns<-grep('std',tolower(colnames(data)))
extract_columns<-sort(c(extract_mean_columns,extract_std_columns))

#removes only the columns that had mean or std in the column name and removes false positives
data<-data[,c(extract_columns,length(colnames(data))-1, length(colnames(data)))]
data<-data[,c(-80:-86)] #remove false positives

rm(extract_mean_columns)
rm(extract_std_columns)
rm(extract_columns)

######
###### The following performs the Step of '3 Uses descriptive activity names to name the activities in the data set' ######
######

#replaces the appropriate column values with the values from temp above
data$ActivityName<-temp
rm(temp)

######
###### The following performs the Step of '4 Appropriately labels the data set with descriptive variable names. ' ######
######

#grabs column names into temp variable called new_col_names
new_col_names<-colnames(data)

new_col_names<-sub("BodyBody","Body",new_col_names)# removes an error in the file

#Performs several substitutions to extract the mean and stard deviation values
index_of_means<-grep("mean[(][)]",new_col_names)
new_col_names<-sub("-mean[(][)]","",new_col_names) #gets ride of -mean()
new_col_names[index_of_means]<-sub("^","MeanOf", new_col_names[index_of_means])
rm(index_of_means)

index_of_meanFreqs<-grep("meanFreq[(][)]",new_col_names)
new_col_names<-sub("-meanFreq[(][)]","",new_col_names) #gets ride of -meanFreq()
new_col_names[index_of_meanFreqs]<-sub("^","MeanFrequencyOf", new_col_names[index_of_meanFreqs])
rm(index_of_meanFreqs)

index_of_std<-grep("std[(][)]",new_col_names)
new_col_names<-sub("-std[(][)]","",new_col_names) #gets ride of -std()
new_col_names[index_of_std]<-sub("^","StandardDeviationOf", new_col_names[index_of_std])
rm(index_of_std)

#Performs various substitutions to make column names clearer
new_col_names<-sub("tBodyAcc","BodyLinearAcceleration",new_col_names)
new_col_names<-sub("fBodyAcc","FrequencyOfBodyLinearAcceleration",new_col_names)
new_col_names<-sub("tGravityAcc","GravityLinearAcceleration",new_col_names)
new_col_names<-sub("tBodyGyroAcc","BodyRotationalAcceleration",new_col_names)
new_col_names<-sub("tBodyGyro","BodyRotationalVelocity",new_col_names)
new_col_names<-sub("fBodyGyro","FrequencyOfBodyRotationalVelocity",new_col_names)
new_col_names<-sub("Mag","Magnitude",new_col_names)
new_col_names<-sub("Jerk","Derivative",new_col_names)

# Sets the temp column names to the dataframe's column names and removes the temp variable
colnames(data)<-new_col_names
rm(new_col_names)

######
###### The following performs the Step of '5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.' ######
######

second_data_set<-aggregate.data.frame(data,by=list(data$SubjectID,data$ActivityName),FUN=mean,simplify=TRUE)
colnames(second_data_set)[c(1,2)]<-c("SubjectIDSummaryIndex","ActivityNameSummaryIndex")
colnames(second_data_set)[3:length(colnames(second_data_set))]<-sub("^","AverageOf", colnames(second_data_set)[3:length(colnames(second_data_set))]) # Adds "Average" to the beginning the column names

write.table(second_data_set,file="results.txt",sep=",",row.names=FALSE)

