run_analysis <- function() {
	
	#Load R Packages
	suppressPackageStartupMessages(library(plyr))
	suppressPackageStartupMessages(library(reshape2))
	
	#Read activities and feature files
	activity_labels = read.table("activity_labels.txt")
	colnames(activity_labels) = c("activity_id","activity_name")
	
	feature_labels = read.table("features.txt")
	colnames(feature_labels) = c("feature_id","feature_name")
	
	##READ AND CLEAN TEST DATA (repeated for training data starting on Line 30)
	#Change working directory to Test Directory
	setwd("test")
	#Join test data activity IDs with activity label
	test_set_activity = read.table("y_test.txt")
	colnames(test_set_activity) = c("activity_id")
	test_set_activity = join(test_set_activity,activity_labels,by="activity_id")
	
	#Read test data and set column names to match feature names
	test_set = read.table("X_test.txt")
	colnames(test_set) = feature_labels[,2]
	
	#Read and append subject_id and activity_names to test_set
	test_subjects = read.table("subject_test.txt")
	test_set$subject_id = test_subjects[,1]
	test_set$activity = test_set_activity[,2]
	
	##READ AND CLEAN TRAINING DATA
	#Change working directory to Test Directory
	setwd("../train")
	#Join train data activity IDs with activity label
	train_set_activity = read.table("y_train.txt")
	colnames(train_set_activity) = c("activity_id")
	train_set_activity = join(train_set_activity,activity_labels,by="activity_id")
	
	#Read train data and set column names to match feature names
	train_set = read.table("X_train.txt")
	colnames(train_set) = feature_labels[,2]
	
	#Read and append subject_id and activity_names to train_set
	train_subjects = read.table("subject_train.txt")
	train_set$subject_id = train_subjects[,1]
	train_set$activity = train_set_activity[,2]
	
	#Merge the 2 data sets
	final_set = rbind(train_set,test_set)
	
	#Extract the key columns; Calculate mean of variables
	final_set_subset = final_set[,grepl("mean\\(\\)|std\\(\\)|subject|activity", colnames(final_set))]
	final_set_melted = melt(final_set_subset,id.vars = c("subject_id","activity"))
	final_set_mean = dcast(final_set_melted, subject_id + activity ~ variable, mean)
	
	##Write output file
	setwd("..")
	write.table(final_set_mean, "tiny_data.txt", sep=",")
	
}