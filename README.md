### Introduction

###### Getting and cleaning data @ Coursera.org
###### credits: 
###### 		Roger D. Peng, PhD, Jeff Leek, PhD, Brian Caffo, PhD
######          Johns Hopkins Bloomberg School of Public Health
######          TA & Peers from the Discussion Forum 
           
 23.1.2015 M.Varga

 The run_analysis.R script loads Samsung experiment test and train data, extracts columns representing mean 
 and standard deviation data and merges both sets together, calculates mean value for every 
 column with measurements data and produces a text file for later analysis 

### Detailed description

 The run_analysis.R script contains a function that:
   * loads dplyr and plyr libraries
   * reads in  Samsung test and train data, extracts columns representing mean 

 and standard deviation data, labels and merges both sets together, calculates mean value for every 
 column with measurements data and produces a text file for later analysis 

### More information

 For more information about the source files used and the Activity Recognition experiment itself please refer to: 
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

