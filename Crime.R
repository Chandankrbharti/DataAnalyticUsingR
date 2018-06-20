#install.packages("randomForest")
library(randomForest)
#install.packages("leaflet")
library(leaflet)
library(tree)
#library(rpart)
#install.packages("tree")

# Training dataset

dim(traindata)
dim(traindata1)
traindata <- read.csv("D:/pavan backup/New Volume/New folder/R_EB/Crime_Finished/Datas/Crime_Sample.csv")
is.na(traindata$Community.Area)
colSums(is.na(traindata))
names(traindata)
traindata1 <- traindata[,-c(1,2,14,15,17,18)]
colSums(is.na(traindata2))
traindata2 <- traindata1[complete.cases(traindata1),]

#dt <- rpart(Primary.Type ~., traindata2)
mytree <- tree(Primary.Type ~ Latitude + Longitude, data=traindata2)
mytree
plot(mytree)
#plot(dt)
text(mytree)
summary(traindata2)

str(traindata2)
View(traindata2)

myforest <- randomForest(Primary.Type ~ Latitude + Longitude, data=traindata2, ntree=500)
plot(myforest)

# Testing Dataset

testdata <- read.csv("file:///C:/Users/Administrator/Desktop/Crime_Sample.csv")
colSums(is.na(testdata))
testdata1 <- testdata[,-c(1,2,14,15,17,18)]
colSums(is.na(testdata1))
testdata2 <- testdata1[complete.cases(testdata),]
View(testdata)

Prediction <- predict(myforest, newdata = testdata2, type = "class")

testdata2$Predicted.Crime<- predict(myforest, newdata = testdata2 , type="class")
str(testdata2)
View(testdata2)
dim(testdata2)
names(testdata2)

#table(testdata2$Primary.Type)       
#table(testdata2$Predicted_Results)   


#table(testdata2$Predicted_Results,testdata2$Predicted_Results)

#(sum(Train_Data$Predicted_Results==Train_Data$Primary.Type)/nrow(Train_Data))*100

#

gviz <- leaflet(data = testdata2) 
gviz <- addTiles(gviz)
gviz <- addMarkers(gviz, ~Longitude, ~Latitude, popup = ~as.character(testdata2$Predicted.Crime))
 
gviz


# m <- leaflet() %>%
 # addTiles() %>%  # Add default OpenStreetMap map tiles
 # addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
#m 

library(plotly)

time_series <- plot_ly(x= testdata2$Year,y= testdata2$Primary.Type == 'THEFT',type="lines",mode="lines")
time_series

#defining labels and titile using layout()
layout(time_seies,title = "AirPassengers Dataset - Time Series Plot",
       xaxis = list(title = "Time"),
       yaxis = list(title = "Passengers"))
  