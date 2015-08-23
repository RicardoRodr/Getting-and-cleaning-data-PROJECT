
    ##Loads the additional libraries we will need
    library(tidyr)
    library(dplyr)

    ##Reads both the train and test data
    data_train<-read.table("X_train.txt",header=FALSE)
    data_test<-read.table("X_test.txt",header=FALSE)

    ##Reads the subjects corresponding to each row of data from "training" and "test", that is, the subject under whom the sensors recorded each vector.
    subjecttrain<-read.table("subject_train.txt",header=FALSE)
    subjecttest<-read.table("subject_test.txt",header=FALSE)

    ##Reads the activities correspondint to each row of data captured from the sensors in both "train" and "test"
    activities_train<-read.table("y_train.txt",header=FALSE)
    activities_test<-read.table("y_test.txt",header=FALSE)

    ##Creates an indicator variable to identify each record as "Train" or "Test" in case it is needed after the merge
    data_test<-mutate(data_test, type="Test")
    data_train<-mutate(data_train, type="Train")

    ##Creates an id variable for all tables in order to later merge the data about Activity and Participant using the id as a key (as in an SQL query)
    data_test<-mutate(data_test,id=seq(1:nrow(data_test)))
    data_train<-mutate(data_train,id=seq(1:nrow(data_train)))

    subjecttest<-mutate(subjecttest,id=seq(1:nrow(subjecttest)))
    subjecttrain<-mutate(subjecttrain,id=seq(1:nrow(subjecttrain)))

    activities_test<-mutate(activities_test,id=seq(1:nrow(activities_test)))
    activities_train<-mutate(activities_train,id=seq(1:nrow(activities_train)))

    ##Renames the variables that indicate Activity and Subject
    names(activities_test)<-c("activity","id")
    names(activities_train)<-c("activity","id")
    names(subjecttest)<-c("subject","id")
    names(subjecttrain)<-c("subject","id")

    ##Merges the tables that indicate Activity and Subject with the 561-variables dataset itself
    data_test=merge(data_test,activities_test,by.x="id",by.y="id",all=TRUE)
    data_train=merge(data_train,activities_train,by.x="id",by.y="id",all=TRUE)

    data_test=merge(data_test,subjecttest,by.x="id",by.y="id",all=TRUE)
    data_train=merge(data_train,subjecttrain,by.x="id",by.y="id",all=TRUE)

    merged_data<-merge(data_test,data_train,all=TRUE)
    merged_data<-mutate(merged_data,id_unique=seq(1:nrow(merged_data)))

    ##Recodes the Activity variable so it can be easily interpreted without looking at a codebook
    merged_data$activity[merged_data$activity==1]<-"WALKING"
    merged_data$activity[merged_data$activity==2]<-"WALKING_UPSTAIRS"
    merged_data$activity[merged_data$activity==3]<-"WALKING_DOWNSTAIRS"
    merged_data$activity[merged_data$activity==4]<-"SITTING"
    merged_data$activity[merged_data$activity==5]<-"STANDING"
    merged_data$activity[merged_data$activity==6]<-"LAYING"

    ##reads the vector of variable names from the file features.txt
    names<-read.table("features.txt",header=FALSE)
    names2<-as.vector(names$V2)

    ##Renames the variables in our merged dataset to the names stated in feature.txt
    colnames(merged_data)<-c("id",names2,"type","activity","subject","id_unique")

    ##Adjusts the datanames so they are unique
    colnames(merged_data)<-make.names(colnames(merged_data),unique=TRUE)

    ##Extracts only the critical identifying variables plus those referring to means and standard deviations
    merged_data_mean_std<-select(merged_data, contains("mean"),contains("Mean"),contains("std"),contains("id"),contains("activity"),contains("subject"),contains("type"))

    ##Creates the final summary table with the means of all the variables grouped by activity and subject
    test<-merged_data_mean_std %>% group_by(activity,subject) %>% summarise_each (funs(mean),contains("mean"),contains("Mean"),contains("std"))

    ##Exports the previous result to a text file
    write.table(test,file="output.txt",row.names=FALSE)

    ##Deletes some of the redundant data to free up memory in the computer
    rm(data_test,data_train,subjecttest,subjecttrain,activities_test,activities_train)
