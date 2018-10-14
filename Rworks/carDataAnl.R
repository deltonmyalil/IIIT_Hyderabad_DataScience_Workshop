data<-read.csv("car.csv", header=TRUE)
summary(data)
colnames(data)<-c("buy", "maintanance",
                  "door", "passengers",
                  "lug", "safety", "car_acc")
View(data)

set.seed(3033)
#install.packages('caret') # installed it once
library(caret) # This is for train_test_split
intrain<-createDataPartition(y=data$car_acc, p=0.7, list=FALSE)
train <- data[intrain,]
test<-data[-intrain,]
dim(train)
dim(test)

#install.packages("rpart") # This is for decision tree
library(rpart)

# Modelling
m4<-rpart(as.factor(train$car_acc)~., train)
printcp(m4)

plot(m4)
text(m4)

install.packages("rattle")
library(rattle)
fancyRpartPlot(m4)

#complexity parameter
printcp(m4) #complexity parameter decreases, error will decrease, after a point
# the error will increase. That is where the overftting happens.

#Building one more model with cp=0.001, ie is making the model much more complex
m5 <-rpart(as.factor(train$car_acc)~., train, cp=0.001)
printcp(m5)

plot(m5)
fancyRpartPlot(m5)


test$V8<-predict(m5, test[, -7], type = "class") #-7 because youre removing the target var

table(test$V8, test$car_acc) # To see the confusion matrix

p <- predict(m4, test[, -7], type = "prob")
View(p)


#            Actual
# Predicted Negative  Positive
# Negative    a         b
# Positive    c         d
# 
# TPR = d/(b+d) AKA Sensitivity
# TNR = a/(a+c) AKA Specificity
# FPR = c/(a+c) AKA 1-TNR
# 
# Coverage = out of actual fraud transactions, how many are covered by the model
#             This is measured in ratio/percentage
# Precision = using the model, how many fraud trans am I going to predict.

install.packages("ROCR")
library(ROCR)
pred <- prediction(p[,2], test$car_acc)
plot(performance(pred, "tpr", "fpr"))
