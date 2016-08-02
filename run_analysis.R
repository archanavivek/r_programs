if (!require("data.table")) {
  install.packages("data.table")
}
activity_label<-read.table("./UCI_dataset/activity_labels.txt")[,2]
features<-read.table("./UCI_dataset/features.txt")[,2]
X_test <- read.table("./UCI_dataset/test/X_test.txt")
y_test <- read.table("./UCI_dataset/test/y_test.txt")
subject_test <- read.table("./UCI_dataset/test/subject_test.txt")
#Merge Test data files
merge_test <- cbind(subject_test, y_test, X_test)
X_train <- read.table("./UCI_dataset/train/X_train.txt")
y_train <- read.table("./UCI_dataset/train/y_train.txt")
subject_train <- read.table("./UCI_dataset/train/subject_train.txt")
#Merge Train data files
merge_train <- cbind(subject_train, y_train, X_train)

#Now merge Test and Train datasets - PART 1
merge_both <- rbind(merge_test,merge_train)
head(merge_both)

#Extracts only the measurements on the mean and standard deviation 
#for each measurement. - PART 2
feature_extract<-grep("mean|std",features)
feature_extract

#Uses descriptive activity names to name the activities 
#in the data set - PART 3
activities <- read.table("./UCI_dataset/activity_labels.txt")
setnames(activities,"V1","Activity num")
setnames(activities,"V2","Activity Title")
head(activities)

#Appropriately labels the data set with descriptive variable names. - PART 4
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(merge_both), id_labels)
names(features)<-gsub("^f", "frequency", names(features))
names(features)<-gsub("Acc", "Accelerometer", names(features))
names(features)<-gsub("Gyro", "Gyroscope", names(features))
names(features)<-gsub("Mag", "Magnitude", names(features))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(features)
#From the data set in step 4, creates a second, independent tidy data 
#set with the average of each variable for each activity and each subject.
# PART 5

write.table(merge_both, "./UCI_dataset/TidyData.txt", row.name=FALSE)