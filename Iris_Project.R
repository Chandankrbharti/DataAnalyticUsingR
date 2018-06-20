# attach the iris dataset to the environment
data(iris)
library(caret)
# rename the dataset
dataset <- iris
library()
View(iris)

# create a list of 80% of the rows in the original dataset we can use for training
validationIndex <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validationIndex,]
# use the remaining 80% of data to training and testing the models
dataset <- dataset[validationIndex,]
View(dataset)

# dimensions of dataset
dim(dataset)

# list types for each attribute
sapply(dataset, class)

# take a peek at the first 5 rows of the data
head(dataset)

# summarize the class distribution
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

# summarize attribute distributions
summary(dataset)

# split input and output
x <- dataset[,1:4]
y <- dataset[,5]

# boxplot for each attribute on one image
par(mfrow=c(1,4))
for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}

# barplot for class breakdown
plot(y)

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

# Run algorithms using 10-fold cross validation
trainControl <- trainControl(method="cv", number=10)
metric <- "Accuracy"

colSums(is.na(dataset))

# LDA
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric,
                 trControl=trainControl)
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric,
                  trControl=trainControl)
# KNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric,
                 trControl=trainControl)
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric,
                 trControl=trainControl)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=trainControl)

# summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# compare accuracy of models
dotplot(results)

# summarize Best Model
print(fit.lda)

View(validation)

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)
