#install.packages (randomforest)
library(randomForest)
library(leaflet)
library(tree)
#library(rpart)

#Training dataset

dim(traindata)
dim(traindata1)
traindata <- read.csv("file:///C:/Users/Administrator/Desktop/Crime_Sample.csv")
is.na(traindata$Community.Area)
colSums(is.na(traindata))
names(traindata)
traindata1 <- traindata[, -c(1,2,14,15,17,18)]
colSums(is.na(traindata1))
traindata2 <- traindata1[complete.cases(traindata1),]

#dt <- rpart(Primary.Type)

mytree <- tree(Primary.Type ~ Latitude + Longitude, data = traindata2)
mytree
plot(mytree)
#plot(dt)
text(mytree)
summary(traindata2)

str(traindata2)
View(traindata2)

myforest <- randomForest(Primary.Type ~ Latitude + Longitude, data = traindata2, ntree = 500)
plot(myforest)


# testdata <- read.csv("file:///C:/Users/Administrator/Desktop/Crime_Sample.csv")
