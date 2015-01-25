### Introduction

##### Getting and cleaning data @ Coursera.org
###### Credits: 
###### 		Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
######          Johns Hopkins Bloomberg School of Public Health
######          TA & Peers from the Discussion Forum 
           
 23.1.2015 M.Varga

 The run_analysis.R script loads Samsung experiment test and train data, extracts columns representing mean 
 and standard deviation variables, merges both sets together, calculates mean value of each numerical 
 variable (i.e. average of average) for every activity-subject combination and produces a text file for later analysis 

### Detailed description

 The run_analysis.R script contains a function that:
   * loads dplyr and plyr libraries
   * sets working directory to ./getting_and_cleaning_data, ( !!! Please clone make sure your working directory has thegsame directory structure as getdata_projectfiles_UCI HAR Dataset.zip file or make adjustments accordingly !!!)
   
* reads in contents of Samsung experiment test and train files:
    * test measurements in ./X_test.txt  
    * test subjects who carried out the experiment in ./test/subject_test.txt
    * activities performed by test subjects in ./test/y_test.txt
    * train measurements in ./train/X_train.txt
    * train subjects who carried out the experiment in ./train/subject_train.txt
    * activities performed by train subjects in ./train/y_train.txt 

* reads in variable/column names and activity label files:

    * column names in ./features.txt
    * activity labels in ./activity_labels.txt

* creates a column names vector from features.txt file

* merges test subjects with test measurements into one data frame using cbind 

* merges test activities with activity labels using plyr join method to preserve order of the rows in the testr_activities data frame 

* extracts columns representing mean 

 and standard deviation data, labels and merges both sets together, calculates mean value for every 
 column with measurements data and produces a text file for later analysis 

### More information

 Use CodeBook.md file for variables description

 For more information about the source files used and the Activity Recognition experiment itself please refer to: 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

