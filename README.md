# Getting and cleaning data - course project
This is the course project of "Getting and Cleaning Data" from Coursera. 

## Data
* A description of the data being used can be found here: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* The data can be obtained here: [project data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* To run the R code, the data should be downloaded, unziped, and put in the directory where `run_analysis.R` is located, with file names unchanged.

## Files
* `run_analysis.R` is the code to read and clean data
* `CodeBook.md` describes the variables
* `tidyData.txt` is the clean data resulting from running the R code

## Analysis
The `run_analysis.R` does the following:
  1. The R code reads data about activity labels, feature labels, and measurements.
  2. Since we are only interested in the mean and standard deviation for each measurements, the R code identifies the row# in `feature.txt` by looking for a certain pattern.
  3. Using result from step 1 and step 2, the R code combines and extracts all the data with measurements on means and standard deviation.
  4. To make the data descriptive, the R code changes the column name to feature labels, and changes activity data to activity labels.
  5. From the data set obtained from step 4, the R code creates a new data set with the average of each variable for each activity and each subject. And this new data set is named `tidyData.txt` and is saved in the same directory.
