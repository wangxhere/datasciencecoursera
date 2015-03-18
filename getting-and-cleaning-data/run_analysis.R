# read data
x_train <- read.table("./train/x_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
x_test <- read.table("./test/x_test.txt")
y_test <- read.table("./test/y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")
activity_labels <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

# combine test set and training set
x_joined <- rbind(x_train, x_test)
y_joined <- rbind(y_train, y_test)
subject_joined <- rbind(subject_train, subject_test)

# filter and keep mean and std data
mean_std_index <- grep("(.*)mean[(][)](.*)|(.*)std[(][)](.*)", features[, 2])

x_joined <- x_joined[, mean_std_index]

# process activity labels
activity_labels[, 2] <- tolower(gsub("_", "", activity_labels[, 2]))
activityLabel <- activity_labels[y_joined[, 1], 2]

y_joined[, 1] <- activityLabel

# change column names to human frendly names
names(x_joined) <- features[mean_std_index, 2]
names(y_joined) <- "activity"
names(subject_joined) <- "subject"

# merge data
merged_data <- cbind(subject_joined, y_joined, x_joined)

# write to file
write.table(merged_data, "dataset_merged.txt", row.names=FALSE)

# create a sub-total dataset according to required dimenson
num_of_subjects <- length(table(subject_joined))
num_of_activities <- dim(activity_labels)[1]
num_of_cols <- dim(merged_data)[2]

subtotal_data <- matrix(NA, nrow=num_of_subjects*num_of_activities, ncol=num_of_cols) 
subtotal_data <- as.data.frame(subtotal_data)

colnames(subtotal_data) <- colnames(merged_data)

# sub-total merged dataset iteratively
row <- 1
for(i in 1:num_of_subjects) {
  for(j in 1:num_of_activities) {
    subtotal_data[row, 1] <- sort(unique(subject_joined)[, 1])[i]
    subtotal_data[row, 2] <- activity_labels[j, 2]
    subtotal_data[row, 3:num_of_cols] <-
      colMeans(merged_data[(i == merged_data$subject) &
      (activity_labels[j,2] == merged_data$activity_labels), 3:num_of_cols])
    row <- row + 1
  }
}

# write to file
write.table(subtotal_data, "dataset_subtotal.txt", row.names=FALSE)