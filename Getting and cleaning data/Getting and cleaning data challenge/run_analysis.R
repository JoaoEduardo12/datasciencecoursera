
# set the correct working directory
setwd("~/Desktop/Cursos Online/Data Science/datasciencecoursera/Getting and cleaning data/Getting and cleaning data challenge")

# read the data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# reading activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt")

## STEP 1 ## Merges the training and the test sets to create one data set. #

X <- rbind(X_train,X_test)
y <- rbind(y_train,y_test)
subject <- rbind(subject_train, subject_test)

# the following code block labels all data so we can concatenate everything later

colnames(X) <- features[,2]
colnames(y) <- "activityID"
colnames(subject) <- "subjectID"
colnames(activity_labels) <- c("activityID","activity_type") # also naming columns here

# we can proceed to concatenate everything

all_data <- cbind(y,subject,X) # yay step 1 complete

## STEP 2 # Extract only measurements on the mean and sd for each measurement

# get column names

col_names <- colnames(all_data)

mean_sd_values <- (grepl("activityID", col_names) | grepl("subjectID", col_names) | 
                     grepl("mean..", col_names) | grepl("std..", col_names))

mean_sd_subset <- all_data[,mean_sd_values == TRUE]

## STEP 3 # Uses descriptive activity names to name the activities in the data set

complete_dataset <- merge(mean_sd_subset, activity_labels, by = "activityID", all.x = TRUE)
## Step 4 is already done

## STEP 5 # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

final_data <- aggregate(. ~ subjectID + activityID, complete_dataset, mean)
final_data <- final_data[order(final_data$subjectID, final_data$activityID),]

# write off the results
write.table(final_data, "tidy_data.txt", row.name = FALSE)
