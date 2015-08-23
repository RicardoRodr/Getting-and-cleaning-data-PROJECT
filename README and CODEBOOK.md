Getting-and-cleaning-data-PROJECT
Project for the Coursera class
 
#README 	 
 	 This is what the script does:
 	 
 	 1-Assuming all the txt files are located in the working directory, reads them.
	 2-Creates auxiliary id variables for all tables, useful for identifying unique rows and being able to tell apart the data that came from the "train" and "test" datasets. This was not required, but was included anyway.
	 3-Merges the "train" and "test" datasets with the tables that contain information about the Activity and Subject. corresponding to each of the 561-variables long measurement vector.
	 4-Merges "train" and "test" to create a large unifying table.
	 5-Creates a unique id for each row in this consolidated table.
	 6-Creates labels for the "Activity" variable according to the activity_labels.txt file, to make it more readable.
	 7-Names the variables corresponding to the names specified in features.txt
	 8-Renames the previous variable names to be more in line with accepted standards (no spaces in variable names, no repeated variable names...)
	 9-Extracts from the consolidated table the variables corresponding to critical identifiers(ids, activity, subject,) plus all the variables that record the mean and standard deviation from the sensors' measurements.
	 10-Summarizes the previously extracted data to report the averages by activity and subject. This is because some combinations of subjects-activities happened more than once.
	 11-With this we get a 180 rows table summarizing the data obtained for the 6 activities and 30 subjects in the experiments.
	 12-The table is stored as "test" and printed on "output.txt".
	 13-Deletes some redundant data to free up space on memory

	 The remaining data frames in memory in R are:

	 merged_data: contains 10299 rows with all the variables measured by the sensors (561) and the corresponding activity and subject of each measurement.
	 merged_data_mean_std: summarized version of the above table containing only the variables referring to means and standard deviations from the full set of 561 variables (86 out of 561 variables remain).
	 test: contains 180 rows summarizing the means, for every activity (6) and subject (30), of the variables from the table above. The two id variables are lost as this is a summary and not an enumeration of all the measurements.
	 names: contains the original (unedited) names of the 561 measurement variables.

	 Description of the text files:
	 
	 ASSUMPTION: In order for the script to run well all these files must be in the root of the working directory. Some files have been moved from their subdirectories to the root to inmprove clarity.
	 activity_labels.txt: Codebook for the activities performed by each subject (walking, walking downstairs, etc)
	 features.txt: Cobebook for all the measurements made by the sensor.
	 features_info.txt: Technical explanation for the meaning of the measurements made by the sensor.
	 subject_test.txt: For every sensor measurement in the test dataset indicates the number of the subject that was carrying the device
	 subject_train.txt: The same but for each measurement in the train dataset.
	 y_test.txt: For every sensor measurement in the test dataset indicates what activity was being carried out by the subject.
	 y_train.txt: The same for the train dataset.
	 subject_test.txt: 561-variables long vector describing each measurement made by the sensors in the test dataset.
	 subject_train.txt: The same for the train dataset.

#CODEBOOK:

	 activity: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) Type of activity performed by the subject and measured by the sensors 
	 subject: 1:30 Number of subject who performed the activity measured by the sensors.

 	 The following variables, shown in order, are the averages, for each activity-subject combination, of the means and standard deviations of the technical variables measured by the sensors and described by the original author in features_info.txt
	 The only difference with the original authors' variable names is the fact that spaces have been replaced by "."

	tBodyAcc.mean...X
	tBodyAcc.mean...Y
	tBodyAcc.mean...Z
	tGravityAcc.mean...X
	tGravityAcc.mean...Y
	tGravityAcc.mean...Z
	tBodyAccJerk.mean...X
	tBodyAccJerk.mean...Y
	tBodyAccJerk.mean...Z
	tBodyGyro.mean...X
	tBodyGyro.mean...Y
	tBodyGyro.mean...Z
	tBodyGyroJerk.mean...X
	tBodyGyroJerk.mean...Y
	tBodyGyroJerk.mean...Z
	tBodyAccMag.mean..
	tGravityAccMag.mean..
	tBodyAccJerkMag.mean..
	tBodyGyroMag.mean..
	tBodyGyroJerkMag.mean..
	fBodyAcc.mean...X
	fBodyAcc.mean...Y
	fBodyAcc.mean...Z
	fBodyAcc.meanFreq...X
	fBodyAcc.meanFreq...Y
	fBodyAcc.meanFreq...Z
	fBodyAccJerk.mean...X
	fBodyAccJerk.mean...Y
	fBodyAccJerk.mean...Z
	fBodyAccJerk.meanFreq...X
	fBodyAccJerk.meanFreq...Y
	fBodyAccJerk.meanFreq...Z
	fBodyGyro.mean...X
	fBodyGyro.mean...Y
	fBodyGyro.mean...Z
	fBodyGyro.meanFreq...X
	fBodyGyro.meanFreq...Y
	fBodyGyro.meanFreq...Z
	fBodyAccMag.mean..
	fBodyAccMag.meanFreq..
	fBodyBodyAccJerkMag.mean..
	fBodyBodyAccJerkMag.meanFreq..
	fBodyBodyGyroMag.mean..
	fBodyBodyGyroMag.meanFreq..
	fBodyBodyGyroJerkMag.mean..
	fBodyBodyGyroJerkMag.meanFreq..
	angle.tBodyAccMean.gravity.
	angle.tBodyAccJerkMean..gravityMean.
	angle.tBodyGyroMean.gravityMean.
	angle.tBodyGyroJerkMean.gravityMean.
	angle.X.gravityMean.
	angle.Y.gravityMean.
	angle.Z.gravityMean.
	tBodyAcc.std...X
	tBodyAcc.std...Y
	tBodyAcc.std...Z
	tGravityAcc.std...X
	tGravityAcc.std...Y
	tGravityAcc.std...Z
	tBodyAccJerk.std...X
	tBodyAccJerk.std...Y
	tBodyAccJerk.std...Z
	tBodyGyro.std...X
	tBodyGyro.std...Y
	tBodyGyro.std...Z
	tBodyGyroJerk.std...X
	tBodyGyroJerk.std...Y
	tBodyGyroJerk.std...Z
	tBodyAccMag.std..
	tGravityAccMag.std..
	tBodyAccJerkMag.std..
	tBodyGyroMag.std..
	tBodyGyroJerkMag.std..
	fBodyAcc.std...X
	fBodyAcc.std...Y
	fBodyAcc.std...Z
	fBodyAccJerk.std...X
	fBodyAccJerk.std...Y
	fBodyAccJerk.std...Z
	fBodyGyro.std...X
	fBodyGyro.std...Y
	fBodyGyro.std...Z
	fBodyAccMag.std..
	fBodyBodyAccJerkMag.std..
	fBodyBodyGyroMag.std..
	fBodyBodyGyroJerkMag.std..
