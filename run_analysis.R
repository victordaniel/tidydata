analy<-function()
{

  tr<-read.table("C:/testR/r_lab_files/labs-r/UCI HAR Dataset/train/X_train.txt")
   ts<-read.table("C:/testR/r_lab_files/labs-r/UCI HAR Dataset/test/X_test.txt")
   trs<-rbind(tr,ts)
 
 ms<-trs[,c(1:6,41:46,81:86,121:126,161:166,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
 #print(ms)


a1<-read.table("UCI HAR Dataset/train/y_train.txt")
a2<-read.table("UCI HAR Dataset/test/y_test.txt")
a12<-rbind(a1,a2)

ms<-cbind(ms,a12)

a11<-read.table("UCI HAR Dataset/train/subject_train.txt")
a21<-read.table("UCI HAR Dataset/test/subject_test.txt")
a112<-rbind(a11,a21)

ms<-cbind(ms,a112)


colnames(ms)<-c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X"
,"tBodyAcc-std-Y","tBodyAcc-std-Z","tGravityAcc-mean-X","tGravityAcc-mean-Y","tGravityAcc-mean-Z"
,"tGravityAcc-std-X","tGravityAcc-std-Y","tGravityAcc-std-Z","tBodyAccJerk-mean-X"
,"tBodyAccJerk-mean-Y","tBodyAccJerk-mean-Z","tBodyAccJerk-std-X","tBodyAccJerk-std-Y"
,"tBodyAccJerk-std-Z","tBodyGyro-mean-X","tBodyGyro-mean-Y","tBodyGyro-mean-Z"
,"tBodyGyro-std-X","tBodyGyro-std-Y","tBodyGyro-std-Z","tBodyGyroJerk-mean-X"
,"tBodyGyroJerk-mean-Y","tBodyGyroJerk-mean-Z","tBodyGyroJerk-std-X","tBodyGyroJerk-std-Y"
,"tBodyGyroJerk-std-Z","tGravityAccMag-mean","tGravityAccMag-std","tBodyAccJerkMag-mean"
,"tBodyAccJerkMag-std","tBodyGyroMag-mean","tBodyGyroMag-std","tBodyGyroJerkMag-mean"
,"tBodyGyroJerkMag-std","fBodyAcc-mean-X","fBodyAcc-mean-Y","fBodyAcc-mean-Z"
,"fBodyAcc-std-X","fBodyAcc-std-Y","fBodyAcc-std-Z","fBodyAccJerk-mean-X","fBodyAccJerk-mean-Y"
,"fBodyAccJerk-mean-Z","fBodyAccJerk-std-X","fBodyAccJerk-std-Y","fBodyAccJerk-std-Z","fBodyGyro-mean-X"
,"fBodyGyro-mean-Y","fBodyGyro-mean-Z","fBodyGyro-std-X","fBodyGyro-std-Y","fBodyGyro-std-Z"
,"fBodyAccMag-mean","fBodyAccMag-std","fBodyBodyAccJerkMag-mean","fBodyBodyAccJerkMag-std"
,"fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std","Activity","Subject")


nam<-c("Walking", "Walking_Upstairs","walking_downstairs","sitting","standing","Laying")
for( i in 1:6)  { ms[,65]<-gsub(i,nam[i],ms[,65]) }

print(names(ms))

#print(head(ms,n=3))
write.csv(ms,file="tidydata_proj.csv")

x<-read.csv("tidydata_proj.csv")  

f<-by(x[,1], INDICES=list(x$Subject,x$Activity),FUN=mean)
for(i in 2:65) {
  a<-by(x[,i], INDICES=list(x$Subject,x$Activity),FUN=mean)
  f<-cbind(f,a)
  
}

write.table(f, file="tidy_data.txt",row.names=FALSE)

 }
a<-analy()
 
