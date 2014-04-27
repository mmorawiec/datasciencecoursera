# Analysis of Samsung Galaxy S accelerometers data
# Input data:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# A full description is available at the site:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## 1. Merges the training and the test sets to create one data set.

# Read train and test data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

# Merge/combine train and test data by rows
X_data <- rbind(X_train, X_test)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Read feature names and apply them as data column names
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"),
                       stringsAsFactors = FALSE)
names(X_data) <- features[, "feature"]

# Get only mean and stddev values for each measurement
X_data_meanstd <- X_data[, grep("(mean\\(\\)|std\\(\\))", features[, "feature"])]


## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.

# Read train and test class labels and merge/combine them by rows
y_train <- scan("UCI HAR Dataset/train/y_train.txt")
y_test <- scan("UCI HAR Dataset/test/y_test.txt")
y_data <- c(y_train, y_test)

# Read activity names for class labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              col.names = c("label", "activity"))

# Add activity name column to data set
X_data_meanstd <- cbind(activity_labels[y_data, "activity"], X_data_meanstd)
names(X_data_meanstd)[1] <- "activity"


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Read train and test subjects and merge/combine them by rows
subject_train <- scan("UCI HAR Dataset/train/subject_train.txt")
subject_test <- scan("UCI HAR Dataset/test/subject_test.txt")
subject <- c(subject_train, subject_test)

# Add subject and activity columns to data set
datameans <- cbind(subject, X_data_meanstd)
names(datameans)[1] <- "subject"

# Split data by subject and activity
datameans <- split(datameans, list(datameans$subject, datameans$activity))
# Compute average of each variable for each subject and activity group (exclude subject and activity columns)
datameans <- sapply(datameans,
                    function(x) { colMeans(subset(as.data.frame(x), select=c(-1, -2))) })

# Split/separate combined subject and activity values into two independent variables
subject_activity_cols <- data.frame(do.call(rbind, strsplit(colnames(datameans), "\\.")))
# Add subject and activity colums to final dataset
datameans <- cbind(subject_activity_cols, as.data.frame(t(datameans)))
names(datameans)[1] <- "subject"
names(datameans)[2] <- "activity"

# Write final dataset to file
write.table(datameans, file = "tidydata.txt", row.names = FALSE)
