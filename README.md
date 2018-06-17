Peer-graded Assignment: Getting and Cleaning Data Course Project
======================================================================

This is a project for peer graded assignment in
Coursera's Getting and Cleaning Data, week4.

## How to use
Use [analysis script](run_analysis.R) to download original data,
analysis data and save result.
Details for the data and variables are described in [Code Book](CodeBook.md).
Analysis result is saved as [tidy data set](tidy.txt).

## [Code Book](CodeBook.md)
This file describes the variables, the data, and any transformations
or work that performed to clean up the data.

## [analysis script](run_analysis.R)
Script to download data, load to variables and do the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## [tidy data set](tidy.txt)
This data is output for analysis script.
Data contain 180 x 68.
For details, see [Code Book](CodeBook.md).
