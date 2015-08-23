# Getting-and-cleaning-data-PROJECT
Project for the Coursera class
#My script does the following:
# Assuming all the txt files are located in the workind directory, reads them.
# Creates auxiliary id variables for all tables, useful for identifying unique rows and being able to tell apart the data that came form the "train" and "test" datasets. This was not required, but was included anyway.
# Merges the "train" and "test" datasets with the tables that contain information about the Activity and Subject corresponding to each of the 561-variables long measurement vector.
# Merges "train" and "test" to create a large unifying table.
# Creates a unique id for each row in the consolidated table
# Creates labels for the "Activity" variable according to the specifications txt file, to make it more readable
# Names the variables corresponding to the names specified in features.txt
# Renames the previous variable names to be more in line with accepted standards (no spaces in variable names, no repeated variable names...)
# Extracts from the consolidated table the variables corresponding to critical identifiers(ids, activity, subject,) plus all the variables that record the mean and standard deviation from the sensors' measurements.
# Summarizes the previously extracted data to report the averages by activity and subject. This is because some combinations of subjects-activities happened more than once.
# With this we get a 180 rows table summarizing the data obtained for the 6 activities and 30 subjects in the experiments.
# The table is stored as "test" and stored on "output.txt".
# Deletes some redundant data to free up space on memory

# The remaining data frames in memory are:

# merged_data: contains 10299 rows with all the variables measured by the sensors (561) and the corresponding activity and subject of each measurement.
# merged_data_mean_std: summarized version of the above table containing only the variables referring to means and standard deviations from the full set of 561 variables.
# test: contains 180 rows summarizing the means, for every activity (6) and subject (30), of the variables from the table above.
# names: contains the original (unedited) names of the 561 measurement variables.

# Description of the text files:

# activity_labels.txt: Codebook for the activities performed by each subject (walking, walking downstairs, etc)
# features.txt: Cobebook for all the measurements made by the sensor.
# features_info.txt: Technical explanation for the meaning of the measurements made by the sensor.
# subject_test.txt: For every sensor measurement in the test dataset indicates the number of the subject that was carrying the device
# subject_train.txt: The same but for each measurement in the train dataset.
# y_test.txt: For every sensor measurement in the test dataset indicates what activity was being carried out by the subject.
# y_train.txt: The same for the train dataset.
# subject_test.txt: 561-variables long vector describing each measurement made by the sensors in the test dataset.
# subject_train.txt: The same for the train dataset.
