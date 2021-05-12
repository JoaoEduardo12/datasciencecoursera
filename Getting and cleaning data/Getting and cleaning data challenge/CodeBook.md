Code Book for 4th week project course on Coursera
=================================================

### The variables

In the downloaded file “UCI HAR Dataset” the following datasets are
present for further preprocessing: X\_train, y\_train, X\_test, y\_test,
subject\_train, and subject\_test

Additonally, the datasets “features” and “activity\_labels” contain the
correct names to apply to the datasets mentioned above

### The goal is to then organize this dataset into one and give the correct labels

The “run\_analysis.R” has to be run with “UCI HAR Dataset” in the same
directory. It then proceeds to do the following tasks:

1- Merges the training and the test sets to create one data set. 2-
Extracts only the measurements on the mean and standard deviation for
each measurement. 3- Uses descriptive activity names to name the
activities in the data set 4- Appropriately labels the data set with
descriptive variable names. 5- From the data set in step 4, creates a
second, independent tidy data set with the average of each variable for
each activity and each subject.

### Final output

Running all lines of this script will result in the file
“tidy\_data.txt” being created in the current working directory. This is
the goal of the project to create the tidy data

### Tidy data structure

The final output contains now 6 rows with 68 columns, the first two,
i.e., activityID and subjectID, contain factor and integer variables,
respectively. All other columns contain numeric variables.
