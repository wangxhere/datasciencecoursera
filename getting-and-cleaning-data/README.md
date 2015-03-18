Principle of code submitted:

1. Read all the data files in.
2. Combine training set and test set.
3. Use "grep" function and regex to filter and keep features with "mean()" and "std()".
4. Alternate activity labels to human friendly names.
5. Update column names of the original variables.
6. Merge data into a single dataset.
7. Write to first output file.
8. Calculate what is the dimenson required for the new sub-total dataset.
9. Create a new dataset for sub-total output.
10. Iterate throught the previously merged dataset and calculate mean value of vectors.
11. Write to second output file.

Codebook of Variables
activity_labels		Label names of activities.
features			Features that is directly read from file.
merged_data			Data set merged with subject, activity names and values.
subject_joined		Subjects from both training and test set.
subject_test		Subjects from test set.
subject_train		Subjects from training set.
subtotal_data		Data set tidied and sub-totaled wrt subject and activity.
x_joined			Observation values from both training and test set.
x_test				Observation values from test set.
x_train				Observation values from training set.
y_joined			Activity values from both training and test set.
y_test				Activity values from test set.
y_train				Activity values from training set.