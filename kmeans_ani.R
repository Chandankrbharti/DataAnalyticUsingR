Customers_Data <- read.csv("E:\\New folder\\R Videos\\Cust.csv")
View(Customers_Data)
colSums(is.na(Customers_Data))
str(Customers_Data)
summary(Customers_Data)

#apply(Customers_Data,1,sum)
#Delete the Channel & Region column 
Customers_Data_num <- Customers_Data[ ,c(-1,-2)]

View(Customers_Data_num)
#Scale the data
Customers_Data_num_scale <- as.data.frame(scale(Customers_Data_num))
View(Customers_Data_num_scale)

mean(Customers_Data_num$Fresh)
sd(Customers_Data_num$Fresh)

(12669 - 12000)/12647
sd(Customers_Data_num$Fresh)

(12669-mean(Customers_Data_num$Fresh)) /sd(Customers_Data_num$Fresh)
#Generate same set of random numbers/samples
set.seed(1)
sample(1:100,4)
#Form 6 clusters
clustercustomers <- kmeans(Customers_Data_num_scale, 6)
#Peek at Cluster
clustercustomers

clustercustomers$size
class(clustercustomers)

str(clustercustomers)

summary(clustercustomers)
clustercustomers$size
clustercustomers$cluster
clustercustomers$iter

clustercustomers$cluster
View(Customers_Data_final1)
# Add cluster numbers to a column and append it to customers Data and form a new dataframe
Customers_Data_final1 <- cbind(abc, cluster_Number = clustercustomers$cluster)
View(Customers_Data_final1)
mean(Customers_Data_final1$Fresh)

# Using tapply function to loop through multiples columns and apply summation, mean functions..

tapply(Customers_Data_final1$Fresh, Customers_Data_final1$cluster_Number, mean)
tapply(Customers_Data_final1$Grocery, Customers_Data_final1$cluster_Number, mean)
clustercustomers$size

tapply(Customers_Data_final1$Fresh, list(Customers_Data_final1$Channel, Customers_Data_final1$cluster_Number), sum)
sd <- tapply(Customers_Data_final1$Fresh, list(Channel = Customers_Data_final1$Channel,CN = Customers_Data_final1$cluster_Number,Region = Customers_Data_final1$Region), mean)
sd

sd1 <- as.data.frame(sd[1:2,1:6,3])

Customers_Data_final1[order(Customers_Data_final1$cluster_Number),]
Customers_Data_final1[order(Customers_Data_final1$cluster_Number, Customers_Data_final1$Region),]

# Produce animation for the cluster formation
library(animation)
kmeans.ani(Customers_Data_num_scale,3)


library(MASS)
Boston
dim(Boston)
str(Boston)
summary(Boston)
head(Boston)
tail(Boston)
View(Boston)
Boston
plot(Boston$medv)
plot(Boston$medv~Boston$crim)
cor(Boston$medv,Boston$crim)
cor(Boston)

library(caTools)

Set.seed(1)
#sample (1:10,5)

split<-sample.split(Boston$medv,SplitRatio=0.65)
split
train <- subset(Boston, split==TRUE)
test<- subset(Boston, split==FALSE)


names(train)
names(test)
View(train)



reg1 <- lm(medv~lstat+rm, data =train)
reg1
summary(reg1)
cor(Boston$medv,Boston$rm)



reg2 <- lm(medv~lstat+rm +age, data =train)
reg2
summary(reg2)

reg3 <- lm(medv~., data =train)
reg3
summary(reg3)


Predicttest <- predict(reg3,newdata = test)
test$predictedvalues <- predict (reg3, newdata=test)
Predicttest
View(test)

library ("hydroGOF")

