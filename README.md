# tidydata
##This repo has the files necessary for the coursera project.
##This is the README for this project
###This document will explain what I did and the purpose of in run_analysis.R
###The function run_analysis was written to be a function that takes no input.
###The output of the function is the desired text file that was submitted for grading and the data set used to generate the text file.
####The function does the following in this order.
-Extracts all the needed information from the file.
-Renames three columns: Two for the training set and one for the test set.  This was done so I could easily do the next few lines more easily.
-Switches out the numbers 1-6 in column two of the final data set and replaces them with the corresponding activity labels for both training and tests sets.
-Renames 561 columns from X_train.txt
-Forms the training set and test set
-renames all the columns for the test set in preparation of combining sets
-joins the test set and training set
-trims the data set down to the columns we are interested in
-summarizes each column while being grouped by subject and activity
-writes a table in your working directory
-Returns the data that was saved in the prior line.
