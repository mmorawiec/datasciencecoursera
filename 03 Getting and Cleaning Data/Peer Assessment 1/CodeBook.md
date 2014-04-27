Code book for Samsung Galaxy S accelerometer data analysis
========================================================

This codebook describes all the necessary variables, data and transformations used in "run_analysis.R" script to perform data cleaning and description of the output data.


## Variables and data
Variables used in "run_analysis.R" script:
* X_train: training set features
* X_test: test set features
* X_data: merged training and test sets features
* features: features/column names for training and test datasets
* X_data_meanstd: merged training and test dataset with features for mean and standard deviation values only 
* y_train: training activity labels/classes
* y_test: test activity labels/classes
* y_data: merged trainig and test activity labels/classes
* activity_labels: links activity label/class with activity names
* subject_train: identifiers of subjects performing test for training dataset
* subject_test: identifiers of subjects performing test for test dataset
* subject: merged identifiers of subjects performing tests
* datameans: output data. See "Output data" section below for description.
* subject_activity_cols: Subject and activity values for output data.

## Transformations
Operations performed on the input data:
* merging training and test dataset by rows
* setting feature names as columns names for merged dataset
* extracting features for mean and standard deviation only according to column names pattern
* adding first column with activity names according to activity label/class for dataset
* creating a a copy of the processed dataset as a base for output data
* adding first column with subject identifiers
* splitting the dataset by subject and activity
* computing average values for each feature for every subject and activity combination on the split dataset
* creating output dataset with first two columns holding subject and activity values and rest holding computed average values for each feature

## Output data
Output data are written as a csv file with space (" ") as a separtor character.

Each row contains calculated average values of the features mean and standard deviation values for each subject and activity combination.

First row includes column names:
* subject: An identifier of the subject who carried out the experiment. Its range is from 1 to 30.
* activity: Activity label:
 1. WALKING
 2. WALKING_UPSTAIRS
 3. WALKING_DOWNSTAIRS
 4. SITTING
 5. STANDING
 6. LAYING
* Rest of the columns names are original input data features names. They are described in "Features" section below.

### Features (taken from input data features_info.txt file)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Features are normalized and bounded within [-1,1].