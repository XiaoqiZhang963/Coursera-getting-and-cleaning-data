library(dplyr)

# Read file
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
feature <- read.table("./UCI HAR Dataset/features.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testMeasure <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainMeasure <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Find features for means and standard deviation
pattern <- ".*mean\\(\\).*|.*std\\(\\).*"
featureNum <- grep(pattern, feature[,2])
featureName <- feature[featureNum,2] %>% gsub("\\(\\)","",.)

# Combine test and training data with measurements on means and standard deviation only
dfTest <- data.frame(testSubject,testActivity,testMeasure[,featureNum])
dfTrain <- data.frame(trainSubject,trainActivity,trainMeasure[,featureNum])
df <- rbind(dfTest,dfTrain)

# Make column names and activities descriptive
colnames(df)<-c("Subject","Activity",featureName) 
df$Activity <- factor(df$Activity,levels=activity[,1],labels=activity[,2])

# Create a new data set with the average of each variable for each activity and each subject
average <- df %>% group_by(Subject,Activity) %>% summarize_each(funs(mean))
write.table(average,file="tidyData.txt",row.names = FALSE)
