library(data.table)
library(reshape2)
library(plyr)

#####################Step 1: Merges the training and the test sets to create one data set.

## 1.1 Read all training data
    train_X_df1<- read.csv("UCI HAR Dataset\\train\\X_train.txt",header=TRUE,sep="")
    train_Y_df1<- read.csv("UCI HAR Dataset\\train\\Y_train.txt",header=TRUE)
    subject_train_df1<- read.csv("UCI HAR Dataset\\train\\subject_train.txt",header=TRUE)

##1.2 Read all the testing data
    test_X_df1<- read.csv("UCI HAR Dataset\\test\\X_test.txt",header=TRUE,sep="")
    test_Y_df1<- read.csv("UCI HAR Dataset\\test\\Y_test.txt",header=TRUE)
    subject_test_df1<- read.csv("UCI HAR Dataset\\test\\subject_test.txt",header=TRUE,)

##1.3 Read the data about the features and activity
    features_df<- read.csv("UCI HAR Dataset\\features.txt",header=FALSE,sep="")
    activity_df <- read.csv("UCI HAR Dataset\\activity_labels.txt",header=FALSE,sep="")

##1.4 Updating the column names of the test data 
    names(test_X_df1)<-features_df$V2
    names(subject_test_df1) <- "Subject_ID"
    setnames(test_Y_df1, "X5", "Activity_ID")

##1.5 Creating one dataset for all the test data 
    testDataDF<- cbind(subject_test_df1,test_Y_df1,test_X_df1)

##1.6 Updating the column names for the training data 
    names(train_X_df1)<-features_df$V2
    names(subject_train_df1) <- "Subject_ID"
    setnames(train_Y_df1, "X5", "Activity_ID")

##1.7 Creating one dataset for all the data related the train(subject,activity data) 
    trainDataDF<- cbind(subject_train_df1,train_Y_df1,train_X_df1)

##1.8 Merge the test and train data
    mergedDataDF<- rbind(testDataDF,trainDataDF)
#########################Step 1 Completed

#############Step 2:Extracts only the measurements on the mean and standard deviation for each measurement

##totalNames <- colnames(mergedDataDF)


##View(totalNames)
##columnIsNeeded <- (grepl("subjectID", totalNames) | 
##                       grepl("activityID", totalNames) | 
##                       (grepl(".*-mean..", totalNames) & 
##                            !grepl(".*-mean..-", totalNames) &
##                            !grepl(".*meanFreq", totalNames)) | 
##                       (grepl(".*-std..", totalNames) & 
##                            !grepl(".*-std..-.*", totalNames))
##)



## Create final total dataset
##finalTotal <- mergedDataDF[columnIsNeeded]


    ids <- as.integer(grep("*-mean|-std*", features_df[,2])+2)
    filteredDF <- cbind(mergedDataDF[,1:3],mergedDataDF[,ids])
    
#############Step 3 :Updating the names in the dataset to more descritive names
    dfNames<- colnames(filteredDF)
    dfNames<-gsub("^[t]","time",dfNames)
    dfNames<- gsub("Acc","Accelerometer",dfNames)
    dfNames <-gsub("\\-mean\\(\\)","Mean",dfNames)
    dfNames <-gsub("\\-std\\(\\)","StandardDeviation",dfNames)
    dfNames <-gsub("\\-X","XValue",dfNames)
    dfNames <-gsub("\\-Y","YValue",dfNames)
    dfNames <-gsub("\\-Z","ZValue",dfNames)
    dfNames <-gsub("Gyro","Gyroscope",dfNames)
    dfNames <-gsub("^[f]","FrequencyDomain",dfNames)
    dfNames <-gsub("\\-meanFreq\\(\\)","MeanFrequency",dfNames)
    colnames(filteredDF) <- dfNames


#############Step 4: calculating the mean of all the data for a particular subject and activity
    meltdf <- melt(filteredDF,id.vars=c("Subject_ID","Activity_ID"),measure.vars=4:82)
    tidyDataDF <- dcast(meltdf, Subject_ID+Activity_ID~variable,mean)

#############Step 5 : Adding descriptive activity names for all the activities 
    tidyDataDF$Activity_ID <- activity_df[[2]][tidyDataDF$Activity_ID]

#############Step 6: Saving the tidy data

    write.table(tidyDataDF,"TidyData.txt",row.names=FALSE)
    ##write the following line in Readme.txt for the evaluator to read in your data
    tidyDF<- read.table("TidyData.txt",header=T)
    