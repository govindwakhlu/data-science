This is for the course - Getting and Cleaning Data on Coursera. The goal is to create a tidy data set based on exercise tracker data. 

The script accomplishes the following, in order:

1. Appends the activity label with the test activity data
2. Replaces the column names of the test set with the feature labels
3. Appends the test activity data and test subject data with the test set
4. Performs steps 1-3 for the training set
5. Merges the test and training sets
6. Extracts the mean and standard deviation data from the merged set
7. "Melts" the data set to create a long-format data
8. Uses dcast to extract the mean of each of the variables, grouping by subject ID and activity name
9. Writes the output into a comma separated text file called "tiny_data.txt"