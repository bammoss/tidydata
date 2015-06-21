run_analysis<-function(){
#This is a major note, I changed the title in file so that there were no spaces
#The next 7 lines are for extracting the relevant information from the file.
subject_test<-read.table("UCIHARDataset/test/subject_test.txt")
x_test<-read.table("UCIHARDataset/test/X_test.txt")
y_test<-read.table("UCIHARDataset/test/y_test.txt")
subject_train<-read.table("UCIHARDataset/train/subject_train.txt")
x_train<-read.table("UCIHARDataset/train/X_train.txt")
y_train<-read.table("UCIHARDataset/train/y_train.txt")
feature<-read.table("UCIHARDataset/features.txt")
#The next 3 lines are for renaming some columns
colnames(subject_train)<-"subject_number"
colnames(y_train)<-"activity"
colnames(y_test)<-"activity"
# The for loop below is to rename all the columns for the training set
for (i in 1:561){
	colnames(x_train)[i]<-as.character(feature[i,2])
}
#The next two loops change out the numbers for the corresponding activity
for (i in 1:7352){
	if(y_train$activity[i]==1){
		y_train$activity[i]<-"WALKING"
	} else if(y_train$activity[i]==2){
		y_train$activity[i]<-"WALKING_UPSTAIRS"
	} else if(y_train$activity[i]==3){
		y_train$activity[i]<-"WALKING_DOWNSTAIRS"
	} else if(y_train$activity[i]==4){
		y_train$activity[i]<-"SITTING"
	} else if(y_train$activity[i]==5){
		y_train$activity[i]<-"STANDING"
	} else{
		y_train$activity[i]<-"LAYING"
	}
}
for (i in 1:2947){
	if(y_test$activity[i]==1){
		y_test$activity[i]<-"WALKING"
	} else if(y_test$activity[i]==2){
		y_test$activity[i]<-"WALKING_UPSTAIRS"
	} else if(y_test$activity[i]==3){
		y_test$activity[i]<-"WALKING_DOWNSTAIRS"
	} else if(y_test$activity[i]==4){
		y_test$activity[i]<-"SITTING"
	} else if(y_test$activity[i]==5){
		y_test$activity[i]<-"STANDING"
	} else{
		y_test$activity[i]<-"LAYING"
	}
}
#Now we make two sets that will be combined.
training_set<-cbind(subject_train,y_train,x_train)
test_set<-cbind(subject_test,y_test,x_test)
#Before we combine the training set and test set, we must having matching column names
for (i in 1:563){
	colnames(test_set)[i]<-colnames(training_set)[i]
}
#Now we combine the training set and test set by adding the rows together
data_set<-rbind(training_set,test_set)
#Below reduces the number of columns to the ones we are interested in.
data_set<-data_set[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,531:532,544:545)]
#The next 4 lines summarizes columns 3 through 66 grouping by the 1st two columns.
cat<-group_by(data_set,subject_number,activity)
cols<-names(cat)[-(1:2)]
dots <- sapply(cols ,function(x) substitute(mean(x), list(x=as.name(x))))
final_data<-do.call(summarise, c(list(.data=cat), dots))
#The last line writes the table into your working directory and returns the data.
write.table(final_data,"coursera_project.txt", sep=" ", row.names=FALSE)
return(final_data)
}
