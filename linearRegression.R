library(MASS)
??MASS
Data(Boston)
Boston
dim(Boston)
str(Boston)
View(Boston)
plot(Boston$medv,Boston$crim)
cor(Boston$medv,Boston$crim)
cor(Boston)

library(caTools)
set.seed(1)
data("Boston")
split<-sample.split(Boston$medv,SplitRatio = 0.65)
split
train<-subset(Boston,split==TRUE)
View(train)
names(train)

reg1<-lm(medv~lstat+rm,data = train)
reg1$fitted.values
summary(reg1)
cor(Boston$medv,Boston$rm)


reg2<-lm(medv~.,data = train)
reg2$fitted.values
summary(reg2)
cor(Boston$medv,Boston$rm)

reg3<-lm(medv~.-indus -chas -age -zn,data = train)
reg3$fitted.values
summary(reg3)
names(reg3)
reg3$coefficients
reg3$residuals
reg3$fitted.values



test<-subset(Boston,split==FALSE)
View(test)
names(test)


prdectiveTest<-predict(reg3,newdata = test)
test$predictedValues<-predict(reg3,newdata = test)
prdectiveTest
View(test)

plot(test$medv,col="green",type = "l",lty=1.8)

lines(prdectiveTest,col="blue",type = "l",lty=1.5)
library(hydroGOF)
error<-rmse(test$predictedValues,test$medv)
error
