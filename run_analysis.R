#Read TRAIN Data path
XtrainFile<-paste(getwd(),"/UCI HAR Dataset/train/X_train.txt",sep="")
ytrainFile<-paste(getwd(),"/UCI HAR Dataset/train/y_train.txt",sep="")
strainFile<-paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt",sep="")

#Read TEST data path
XtestFile<-paste(getwd(),"/UCI HAR Dataset/test/X_train.txt",sep="")
ytestFile<-paste(getwd(),"/UCI HAR Dataset/test/y_train.txt",sep="")
stestFile<-paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt",sep="")

#Read features path
features<-paste(getwd(),"/UCI HAR Dataset/features.txt",sep="")

#Read Activity path
activity<-paste(getwd(),"/UCI HAR Dataset/activity_labels.txt",sep="")



#Read Data
activ<-read.table(activity,header=FALSE)
f<-read.table(features,header=FALSE)

#Read Training Data
dtXtr<-read.table(XtrainFile,header=FALSE)
dtytr<-read.table(ytrainFile,header=FALSE)
sttrn<-read.table(strainFile,header=FALSE)



#Read Test Data
dtXtst<-read.table(XtrainFile,header=FALSE)
dtytst<-read.table(ytrainFile,header=FALSE)
sttst<-read.table(strainFile,header=FALSE)

#modify feature value for column names
f$V2<-gsub("\\(|\\)","",tolower(f$V2))
f$V2<-gsub(",","-",tolower(f$V2))

#Assign column names to TEST and TRAINING Data
colnames(dtXtr)<-f$V2
colnames(dtXtst)<-f$V2
colnames(sttrn)<-"volunteer_grpId"
colnames(sttst)<-"volunteer_grpId"
colnames(dtytr)<-"volunteer_activityId"
colnames(dtytst)<-"volunteer_activityId"
colnames(activ)<-c("activityId","activityType")

#Merge TEST and TRAIN DATA

mdtrn1<-cbind(sttrn,dtXtr)
jtrn<-left_join(dtytr,activ,by=c("volunteer_activityId" ="activityId"))

mdtst1<-cbind(sttst,dtXtst)
jtst<-left_join(dtytst,activ,by=c("volunteer_activityId" ="activityId"))

trnSet<-cbind(mdtrn1,jtrn)
tstSet<-cbind(mdtst1,jtst)

#Merge TRAINING AND TEST
md <- rbind(trnSet, tstSet)

#columns having mean and std
meanStd<-md[grepl("mean|std|activity|volunteer",colnames(md))]

#cREATE TIDY SET
#library(dplyr) has to be added

tidySet<-meanStd %>% group_by(volunteer_grpId,volunteer_activityId,activityType) %>% summarise_all("mean")

#Print Fisrt 6 rows
#head(tidySet,6)

#Write to a File
write.table(tidySet, "ActivityTidySet.txt", row.name=FALSE)

