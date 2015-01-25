### Introduction

##### Getting and cleaning data @ Coursera.org
###### Credits: 
###### 		Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
######          Johns Hopkins Bloomberg School of Public Health
######          TA & Peers from the Discussion Forum 
           
 23.1.2015 M.Varga

 The run_analysis.R script loads Samsung experiment test and train data, extracts columns representing mean 
 and standard deviation variables, merges both sets together, calculates mean value of each numerical 
 variable (i.e. average of average) for every activity-subject(test person) combination and produces a text file for later analysis 

### Detailed description

 The run_analysis.R script contains a function that:
   * loads dplyr and plyr libraries
   * sets working directory to ./getting_and_cleaning_data, ( !!! Please make sure you restore necessary source files listed in next two paragraphs into your working directory and set your working directory accordingly by editing setwd() function call within run_analysis.R script!!!)
   
* reads in contents of Samsung experiment test and train files:
    * test measurements in ./X_test.txt  
    * test subjects who carried out the experiment in ./subject_test.txt
    * activities performed by test subjects in ./y_test.txt
    * train measurements in ./X_train.txt
    * train subjects who carried out the experiment in ./subject_train.txt
    * activities performed by train subjects in ./y_train.txt 

* reads in variable/column names and activity label files:

    * column names in ./features.txt
    * activity labels in ./activity_labels.txt

* creates a column names vector from features data frame (df) by subsetting its second column

* merges test subjects with test measurements into test_set data frame using cbind 

* merges test activities with activity labels into one data frame using plyr join method to preserve order of the rows in the test_activities data frame 

* merges activities data frame with test_set into single df using cbind function

* assigns column names to every column in the test_set df 

* extracts columns representing activities,test subjects and columns with mean and standard deviation measurements data
as described in features_info.txt(Please refer to CodeBook.md for a complete list of extracted columns)

* performs the same steps listed above also for the train data

* rbinds both test_set and train_set data frames into a single final_set df

* executes a group by operation on the final_set and calculates a mean value of every 
 column with numerical data for each combination of activity and test subject

* finally exports the data frame into a text file for later analysis

### More information

 Use CodeBook.md file for variables description

 For more information about the source files used and the Activity Recognition experiment itself please refer to: 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

 All source files can be found here:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

