#Packages for Random Forest
install.packages("randomForest")
library("randomForest")

# split the data into training and test
set.seed(1234) # for reproducibility 
titanic_final$rand <- runif(nrow(titanic_final))
titanic_train <- titanic_final[titanic_final$rand <= 0.7,]
titanic_test <- titanic_final[titanic_final$rand > 0.7,]
nrow(titanic_train)
nrow(titanic_test)  

View(titanic_train)


titanic_train$Age[is.na(titanic_train$Age)] <- 29.7
titanic_train$Survived <- titanic_train$Survived
rf = randomForest(Survived ~ Pclass+Sex+Age, data = titanic_train, mtry = 2, importance = TRUE) 
print(rf)
summary(rf)
varImp

# training probabilities and roc
titanic_train$randomprob = predict(rf, type=c("response"))
titanic_train$randompred = ifelse(titanic_train$randomprob >=.5,'pred_yes','pred_no') #not required if Survived is as.factor
View(titanic_train)
q <- roc(Survived ~ prob, data = titanic_train)
plot(q)
auc(q)

# confusion matrix for Train data
titanic_train$Survivedpred = ifelse(titanic_train$prob>=.5,'pred_yes','pred_no')
table(titanic_train$Survivedpred,titanic_train$Survived)

#Accuracy, Precision, Recall and F1 for Train 
accuracy_train <- (322+179)/626 #80.03


#########Support Vector Machine ###################
install.packages("e1071")
library("e1071")

SVM_FINAL = svm(formula = Survived ~ Pclass + Sex + Age + SibSp, data = titanic_train, mtry=2, importance=TRUE)
print(SVM_FINAL)
titanic_train$svmprob = predict(SVM_FINAL, type=c("response"))
titanic_train$svmpred = ifelse(titanic_train$svmprob >=.5,'pred_yes','pred_no') #not required if Survived is as.factor
View(titanic_train)
table(titanic_train$svmprob, titanic_train$Survived)

accuracy_svm <- (352+163)/(352+163+76+31) #82.79%
