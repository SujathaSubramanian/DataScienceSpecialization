==================================================================
Analysis of the Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Author: Sujatha Subramanian
sujatha.s@outlook.com

==================================================================
The run_analysis.R script 

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data called tidydata.txt set with the average of each variable for each activity and each subject. 


Steps:
The script works with the dataset produced as a part of the Human Activity Recognition Using Smartphones Dataset
Version 1.0

1)Extract the files under the folder UCI HAR Dataset

Ensure that following files are available under the folder
activity_labels.txt
features.txt
features_info.txt
Readme.txt
test\subject_test.txt
test\X_test.txt
test\y_test.txt
test\Intertial Signals\body_acc_x_test.txt
test\Intertial Signals\body_acc_y.txt
test\Intertial Signals\body_acc_z.txt
test\Intertial Signals\body_gyro_x_test.txt
test\Intertial Signals\body_gyro_y_test.txt
test\Intertial Signals\body_gyro_z_test.txt
test\Intertial Signals\total_Acc_x_test.txt
test\Intertial Signals\total_acc_y_test.txt
test\Intertial Signals\total_acc_z_test.txt
train\subject_test.txt
train\X_test.txt
train\y_test.txt
train\Intertial Signals\body_acc_x_test.txt
train\Intertial Signals\body_acc_y.txt
train\Intertial Signals\body_acc_z.txt
train\Intertial Signals\body_gyro_x_test.txt
train\Intertial Signals\body_gyro_y_test.txt
train\Intertial Signals\body_gyro_z_test.txt
train\Intertial Signals\total_Acc_x_test.txt
train\Intertial Signals\total_acc_y_test.txt
train\Intertial Signals\total_acc_z_test.txt


2)Copy the run_analysis.R script file under partent folder of "UCI HAR Dataset" folder

3)Make sure the working directory is set to directory with the run_analysis.R file using the SetWD("")

4)Run the script - run-analysis.R

	The script saves the tidy data in the text file 	TidyData.txt file.

5)	Other way to load the TidyData.txt is by using the following script

read.table("TidyData.txt",header=T)





