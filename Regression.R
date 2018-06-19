# Linear Regression
library(MASS)
?MASS
Boston
dim(Boston)
str(Boston)
summary(Boston)
head(Boston)
tail(Boston)
View(Boston)
?Boston
plot(Boston$medv)
plot(Boston$medv~Boston$crim)
cor(Boston$crim,Boston$medv)

cor(Boston)

# Splitting up of Data sets into training and tested data set

#install.packages("caTools")
library(caTools)

set.seed(1)

sample(1:10, 5)


split <- sample.split(Boston$medv, SplitRatio = 0.65)
split

# Split the dataset using Subset command

train <- subset(Boston, split == TRUE)
test <- subset(Boston, split == FALSE)


# Linear Regression

names(train)
View(train)
View(test)

reg1 <- lm(medv ~ lstat + rm, data = train) # Linear Model
reg1$coefficients

#MEDV = -7.0421 + (-0.6474)*lstat + (5.9716)*rm

summary(reg1)

#Hypothesis testing Explaination

# Confidence level - 95.58
# P Value - 0.5

# 1> Null Hypothesis :- IDV's doesn't influence dependent variable's value.
# 2> Alternate Hypothesis :- IDV's does influence DVar - Price
# 3> Define Confidence Level :- I want to test mu confidence level to 95%, then P value would be 5%                                               
#Accuracy level of a prediction can be called as precision
# 4> Run experiement & get P value
# 5> Compare P value with Step 3 - If P value is lower than 0.5 Null Hypothesis should 
# be rejected
# 6> If P value is lower than confidence level, reject NUll Hypothesis


#another IV reg2

reg2 <- lm(medv ~ lstat + rm + age, data = train)
reg2
summary(reg2)

reg3 <-lm(medv ~., data = train)
summary(reg3)
reg3$coefficients

reg4 <- lm(medv ~.-indus-age-black-crim-chas, data = train)
summary(reg4)


names(reg4)
reg4$coefficients
reg4$fitted.values
reg4$residuals
length(reg4$fitted.values)
reg4$residuals
30.7509026 - 24.0

#Prediction on the unforseen dataset i.e, test dataset
predicttest <- predict(reg4, newdata = test)
test$predictedvalues <- predict(reg4, newdata = test)
predicttest
View(test)

#plot Actual vs predicted values
plot(test$medv, col = "green", type = "l", lty = 1.8)
lines(predicttest, col = "blue", type = "l", lty=1.5)
error <- rmse(test$predictedvalues, test$medv)
library("hydroGOF")

#OLS : Ordinary Least Squared


