# Codebook
### The contents of this markdown file will describe the columns and variables found in the finished data set.
###The code found in run_analysis is commented to decribe what I did to get the final data set.
####subject_number: There 30 subjects who participated in the study, each person recieved a number between 1 and 30
####activity: There were 6 activities the subjects performed.  The list of activities is below.
-Walking
-Sitting
-Standing
-Walking Downstairs
-Walking Upstairs
-Laying
####The following is a list of columns, the entries for each column was summarized by taking mean grouping by subject and activity.
####Each Column Name Corresponds to the original column names found in features.txt and maintain their meaning except now the values are averaged.
####The x,y, or z corresponds to a directional axis.
-tBodyAcc-XYZ
-tGravityAcc-XYZ
-tBodyAccJerk-XYZ
-tBodyGyro-XYZ
-tBodyGyroJerk-XYZ
-tBodyAccMag
-tGravityAccMag
-tBodyAccJerkMag
-tBodyGyroMag
-tBodyGyroJerkMag
-fBodyAcc-XYZ
-fBodyAccJerk-XYZ
-fBodyGyro-XYZ
-fBodyAccMag
-fBodyAccJerkMag
-fBodyGyroMag
-fBodyGyroJerkMag
#####For each of the above, I averaged only the means and standard deviations of those signals.
