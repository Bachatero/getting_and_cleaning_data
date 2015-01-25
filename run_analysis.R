##
## Getting and cleaning data @ Coursera.org
## credits:  Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
##           Johns Hopkins Bloomberg School of Public Health
##	     TA & Peers from the Discussion Forum 
##           
## 23.1.2015 M.Varga
##
##
## The run_analysis function loads Samsung test and train data, extracts columns representing mean 
## and standard deviation data, labels and merges both sets together, calculates mean value for every 
## column with measurements data and produces a text file for later analysis 
## Please, read README.md file for more details !!!
##
##


run_analysis <- function() {
   
    
    library(dplyr)
    library(plyr) # to use join functionality that preserves the row order of the first dataframe joined
    
    # set working directory appropriately
    #setwd("~/getting_and_cleaning_data/UCI HAR Dataset")
    setwd("~/getting_and_cleaning_data")
    
    # load source files 
    test_set<-read.table("./X_test.txt") #test measurements
    test_subjects<-read.table("./subject_test.txt") #test subjects who carried out the experiment
    test_activities<-read.table("./y_test.txt") # activities performed by test subjects
    
    train_set<-read.table("./X_train.txt") #train measurements
    train_subjects<-read.table("./subject_train.txt") #train subjects who carried out the experiment
    train_activities<-read.table("./y_train.txt") # activities performed by train subjects
    
    features<-read.table("./features.txt") # column names
    activity_labels<-read.table("./activity_labels.txt") # activity labels
    
    co_names<-features[,2] # take second column of the column names dataframe 
    co_names<-as.character(co_names) # change it to a character vector containing column names
    co_names<-make.names(co_names, unique=TRUE) # make the column names unique, shaves off the hyphens/replaces them with dots
    
    # cbind test activities + test subjects + test_data
    test_set<-cbind(test_subjects,test_set) #1. cbind subject + test
    merge_activities<-join(test_activities,activity_labels,by="V1") #2. assign activity labels to activities performed  
    test_set<-cbind(merge_activities,test_set) #3. cbind activities + test
    colnames(test_set)<-c("Act.Id","Activity","Subject",co_names) #4. assign column names to every column
    test_set<-test_set[,grep("Subject|Activity|mean\\.\\.|std\\.",colnames(test_set),value=T)]
    
    # now do the same for the train data
    # cbind train activities + train subjects + train_data
    train_set<-cbind(train_subjects,train_set) #1. cbind subject + test
    merge_activities<-join(train_activities,activity_labels,by="V1") 
    train_set<-cbind(merge_activities,train_set) 
    colnames(train_set)<-c("Act.Id","Activity","Subject",co_names)
    train_set<-train_set[,grep("Subject|Activity|mean\\.\\.|std\\.",colnames(train_set),value=T)]
    
    # rbind/merge test and train data sets together
    final_set<-rbind(test_set,train_set)
    
    #group by activity & subject and compute mean on every variable
    final_set<-group_by(final_set,Activity,Subject) %>%  summarise_each(funs(mean))
    
    #write out the data to a text file
    write.table(final_set,'./final_set.txt',row.names=FALSE)
    print("Work complete, please, check output file final_set.txt")
}
