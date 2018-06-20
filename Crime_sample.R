library(randomForest)
library(leaflet)
library(tree)
dim(traindata)
Data_url<-"C:/Users/Administrator/Documents/Crime_Sample.csv"
traindata<-read.csv(Data_url)
View(traindata)
summary(traindata)
colSums(is.na(traindata))
names(traindata)
traniData_temp<-traindata[,-c(1,2,14,15,17,18)]
colSums(is.na(traniData_temp))
train_data_<-traniData_temp[complete.cases(traniData_temp),]
View(train_data_)

mytree<- tree(Primary.Type~ Latitude+Longitude,data=train_data_)
mytree
plot(mytree)
text(mytree)
str(train_data_)

myforesat<-randomForest(Primary.Type~ Latitude+Longitude,data=train_data_,ntree=500)
plot(myforesat)


test_Data_url<-"C:/Users/Administrator/Documents/Test_Crime.csv"
traindata_test<-read.csv(test_Data_url)
View(traindata_test)

Prediction<-predict(myforesat,newdata=traindata_test,type = "class")

gviz<-leaflet(traindata_test)
