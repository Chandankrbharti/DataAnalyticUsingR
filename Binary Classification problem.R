# World-Class Results: http://www.is.umk.pl/projects/datasets.html#Wisconsin

# load packages
library(mlbench)
library(caret)
# Load data
data(BreastCancer)
View(BreastCancer)

# Split out validation dataset
# create a list of 80% of the rows in the original dataset we can use for training
set.seed(7)
validationIndex <- createDataPartition(BreastCancer$Class, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- BreastCancer[-validationIndex,]
# use the remaining 80% of data to training and testing the models
dataset <- BreastCancer[validationIndex,]

# dimensions of dataaset
dim(dataset)

# peek
head(dataset, n=20)

# types
sapply(dataset, class)

# Remove redundant variable Id
dataset <- dataset[,-1]
# convert input values to numeric
for(i in 1:9) {
  dataset[,i] <- as.numeric(as.character(dataset[,i]))
}

# summary
summary(dataset)

# class distribution
cbind(freq=table(dataset$Class), percentage=prop.table(table(dataset$Class))*100)

colSums(is.na(dataset))

# summarize correlations between input variables
complete_cases <- complete.cases(dataset)
cor(dataset[complete_cases,1:9])

# histograms each attribute
par(mfrow=c(3,3))
for(i in 1:9) {
  hist(dataset[,i], main=names(dataset)[i])
}

# density plot for each attribute
par(mfrow=c(3,3))
complete_cases <- complete.cases(dataset)
for(i in 1:9) {
  plot(density(dataset[complete_cases,i]), main=names(dataset)[i])
}

# boxplots for each attribute
par(mfrow=c(3,3))
for(i in 1:9) {
  boxplot(dataset[,i], main=names(dataset)[i])
}

# scatterplot matrix
jittered_x <- sapply(dataset[,1:9], jitter)
pairs(jittered_x, names(dataset[,1:9]), col=dataset$Class)

# bar plots of each variable by class
par(mfrow=c(3,3))
for(i in 1:9) {
  barplot(table(dataset$Class,dataset[,i]), main=names(dataset)[i],
          legend.text=unique(dataset$Class))
}

# 10-fold cross validation with 3 repeats
trainControl <- trainControl(method="repeatedcv", number=10, repeats=3)
metric <- "Accuracy"

colSums(is.na(dataset))
dataset <- na.omit(dataset)

# LR
set.seed(7)
fit.glm <- train(Class~., data=dataset, method="glm", metric=metric, trControl=trainControl)
fit.glm

# LDA
set.seed(7)
fit.lda <- train(Class~., data=dataset, method="lda", metric=metric, trControl=trainControl)
# GLMNET
set.seed(7)
fit.glmnet <- train(Class~., data=dataset, method="glmnet", metric=metric,trControl=trainControl)
# KNN
set.seed(7)
fit.knn <- train(Class~., data=dataset, method="knn", metric=metric, trControl=trainControl)
# CART
set.seed(7)
fit.cart <- train(Class~., data=dataset, method="rpart", metric=metric,trControl=trainControl)
# Naive Bayes
set.seed(7)
fit.nb <- train(Class~., data=dataset, method="nb", metric=metric, trControl=trainControl)
# SVM
set.seed(7)
fit.svm <- train(Class~., data=dataset, method="svmRadial", metric=metric,trControl=trainControl)
# Compare algorithms
results <- resamples(list(LG=fit.glm,GLMNET=fit.glmnet, KNN=fit.knn,CART=fit.cart, NB=fit.nb, SVM=fit.svm))
summary(results)
dotplot(results)

  
  # 10-fold cross validation with 3 repeats
  trainControl <- trainControl(method="repeatedcv", number=10, repeats=3)
metric <- "Accuracy"
# LG
set.seed(7)
fit.glm <- train(Class~., data=dataset, method="glm", metric=metric, preProc=c("BoxCox"),
                 trControl=trainControl)
# LDA
set.seed(7)
fit.lda <- train(Class~., data=dataset, method="lda", metric=metric, preProc=c("BoxCox"),
                 trControl=trainControl)
# GLMNET
set.seed(7)
fit.glmnet <- train(Class~., data=dataset, method="glmnet", metric=metric,
                    preProc=c("BoxCox"), trControl=trainControl)
# KNN
set.seed(7)
fit.knn <- train(Class~., data=dataset, method="knn", metric=metric, preProc=c("BoxCox"),
                 trControl=trainControl)
# CART
set.seed(7)
fit.cart <- train(Class~., data=dataset, method="rpart", metric=metric,
                  preProc=c("BoxCox"), trControl=trainControl)
# Naive Bayes
set.seed(7)
fit.nb <- train(Class~., data=dataset, method="nb", metric=metric, preProc=c("BoxCox"),
                trControl=trainControl)
# SVM
set.seed(7)
fit.svm <- train(Class~., data=dataset, method="svmRadial", metric=metric,
                 preProc=c("BoxCox"), trControl=trainControl)
# Compare algorithms
transformResults <- resamples(list(LG=fit.glm, LDA=fit.lda, GLMNET=fit.glmnet, KNN=fit.knn,
                                   CART=fit.cart, NB=fit.nb, SVM=fit.svm))
summary(transformResults)
dotplot(transformResults)





























