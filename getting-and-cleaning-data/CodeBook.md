Codebook of Variables
activity_labels		Label names of activities.
features			Features that is directly read from file.
merged_data			Data set merged with subject, activity names and values.
subject_joined		Subjects from both training and test set.
subject_test		Subjects from test set.
subject_train		Subjects from training set.
x_joined			Observation values from both training and test set.
x_test				Observation values from test set.
x_train				Observation values from training set.
y_joined			Activity values from both training and test set.
y_test				Activity values from test set.
y_train				Activity values from training set.
df					dplyr version data frame of merged_data
df_grouped			df grouped by subject and activities
df_sum				df grouped then summarised with mean

Processing of Data
1. x_train + x_test -> merged into x_joined
2. y_train + y_test -> merged into y_joined
3. subject_train + subject_test -> merged into subject_joined
4. x_joined's column names are overwriten with features, and then filtered with regex to find those columns with mean() and std()
5. y_joined's column is named as "activity"
6. Activity name is looked up in activity_labels.
7. Merge x_joined, y_joined and subject_joined into merged_data.
8. Convert merged_data into dplyr version of data frame df.
9. Group df by subject and activity.
10. Summarise by calculating mean value of each features of each group.
