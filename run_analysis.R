#analysis of smartphone accelerometer data

#set dir path
setwd("/Users/rodolfofernandez/Desktop/UCI HAR Dataset")
#read files features and activity labels
features <- read.table("features.txt")
features <- features[,2]

activity_labels <- read.table("activity_labels.txt")
activity_labels <- activity_labels[,2]

#read train files
X_train <- read.table("train/X_train.txt")
subject_train <- read.table("train/subject_train.txt")
y_train <- read.table("train/y_train.txt")

#read test files
X_test <- read.table("test/X_test.txt")
subject_test <- read.table("test/subject_test.txt")
y_test <- read.table("test/y_test.txt")

#joining  train and test data

train_all <- cbind(subject_train, y_train, X_train)
names(train_all) <-c("subject", "activity", as.character(features))

test_all <- cbind(subject_test, y_test, X_test)
names(test_all) <-c("subject", "activity", as.character(features))

joined_set <- rbind(train_all, test_all)
joined_set$activity <- activity_labels[joined_set$activity]

write.table(joined_set, file = "/Users/rodolfofernandez/Desktop/clean_data.txt")
