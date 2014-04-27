Analysis of Samsung Galaxy S accelerometers data
========================================================

## Script
This repository contains "run_analysis.R"" script which reads and cleans/prepares data and then performs data analysis operation.

## Input data
The input data should be stored in the same directory where the "run_analysis.R"" script is placed.
Script exepcts to find "UCI HAR Dataset" directory in its working directory.
This means that the compressed zip file with data should be extracted to the same directory where run_analysis.R script is placed.


Input data can be downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

Description of the data is attached to the data or can be found under "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

## Output data
Script writes output data to "tidydata.txt" file in the same directory where it resides.

Output data contains average of each variable/feature mean and standard deviation values from input dataset for each activity and each subject. For more info see the codebook.
