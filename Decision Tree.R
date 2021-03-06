-0.2*log2(0.2)-0.8*log2(0.8)

entropy = function(p){-p*log2(p) -(1-p)*log2((1-p))}
p <- entropy(0.5)
p
plot(p)

install.packages("tree")

library(caTools)
library(mlbench)
data(PimaIndiansDiabetes)
View(PimaIndiansDiabetes)
#inavlid <- 0
table(PimaIndiansDiabetes$diabetes)
split <- sample.split(PimaIndiansDiabetes$diabetes, SplitRatio = 0.75)
traindt <- subset( PimaIndiansDiabetes, split==TRUE)
testdt <- subset(PimaIndiansDiabetes, split == F)
library(rpart)
library(tree)
dt <- rpart(diabetes~.,traindt)
dt1 <- tree(diabetes~.,traindt)
plot(dt)
plot(dt1)
text(dt)
text(dt1)
View(testdt)
dt1

testdt$predicted_values <- predict(dt1, newdata = testdt, type = "class")
View(testdt)

dim(testdt)

table(testdt$diabetes)
table(testdt$predicted_values)


(testdt$diabetes==testdt$predicted_values)*100/nrow(testdt)

table(testdt$predicted_values, testdt$diabetes)
(98+43)/(98+24+27+43) # Accuracy

(31+7)/(192) # Missclassification

(36)/(36+31)
(36)/(36+7)
