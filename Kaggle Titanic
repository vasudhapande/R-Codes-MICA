setwd("/Users/vasudhapande/Documents/MICA/Term 4/AMMA")
getwd()
df.titanic <- read.csv('train.csv')
View(df.titanic)
str(df.titanic)
head(df.titanic)
titanic_final <- df.titanic["Pclass","Sex","Age","SibSp","Parch","Survived"]
titanic_final <- df.titanic[c("Pclass","Sex","Age","SibSp","Parch","Survived")]
View(titanic_final)
str(titanic_final)
summary(titanic_final)
nrow(titanic_final)
titanic_final$Age[is.na(titanic_final$Age)]=mean(titanic_final$Age,na.rm = TRUE)

# splitting the data into training and test
set.seed(1234) # for reproducibility #ask Rajneesh what is set.seed
titanic_final$rand <- runif(nrow(titanic_final))
titanic_train <- titanic_final[titanic_final$rand <= 0.7,]
titanic_test <- titanic_final[titanic_final$rand > 0.7,]
nrow(titanic_train)
nrow(titanic_test)  

# Histogram
hist(titanic_final$Age)

# Checking the response rate
CrossTable(titanic_final$Age)
CrossTable(titanic_final$Survived)

CrossTable(titanic_test$Survived)
CrossTable(titanic_train$Survived)

# LM
titanic_linear = lm(formula= Survived ~ Pclass+Sex+Age+SibSp+Parch,data=titanic_final)
vif(titanic_linear)
summary(titanic_linear)

# GLM
titanic_generalizedlinear = glm(formula= Survived ~ Pclass+Sex+Age+SibSp+Parch,data=titanic_final)
vif(titanic_generalizedlinear)
summary(titanic_generalizedlinear)

# GLM on Train
titanic_generalizedlinear = glm(formula= Survived ~ Pclass+Sex+Age+SibSp+Parch,data=titanic_train)
vif(titanic_generalizedlinear)
summary(titanic_generalizedlinear)

# After removing Insignificant variables - Parch
titanic_generalizedlinear_1 = glm(formula= Survived ~ Pclass+Sex+Age+SibSp,data=titanic_final)
vif(titanic_generalizedlinear_1)
summary(titanic_generalizedlinear_1)

# After removing Insignificant variables - Parch on Train data
titanic_generalizedlinear_1 = glm(formula= Survived ~ Pclass+Sex+Age+SibSp,data=titanic_train)
vif(titanic_generalizedlinear_1)
summary(titanic_generalizedlinear_1)

# After removing Insignificant variables - SibSp on Train data
titanic_generalizedlinear_1 = glm(formula= Survived ~ Pclass+Sex+Age,data=titanic_train)
vif(titanic_generalizedlinear_1)
summary(titanic_generalizedlinear_1) ##Don't do this step. It is just for fun and practice

# training probabilities and roc
titanic_train$prob = predict(titanic_generalizedlinear_1, type=c("response"))
q <- roc(Survived ~ prob, data = titanic_train)
plot(q)
auc(q)

# confusion matrix for Train data
titanic_train$Survivedpred = ifelse(titanic_train$prob>=.5,'pred_yes','pred_no')
table(titanic_train$Survivedpred,titanic_train$Survived)

# Accuracy, Precision, Recall and F1 for Train 
accuracy_train <- (322+179)/626 #80.03
precision_train <- 179/ (51+179) #77.8
recall_train <- 179/(179+74) #70.75
F1_train <- (2*80.03*77.8)/(80.03+77.8) #78.89

summary(titanic_generalizedlinear_1)

# training probabilities and roc considering test data
titanic_test$prob = predict(titanic_generalizedlinear_1,newdata = titanic_test, type=c("response"))
q <- roc(Survived ~ prob, data = titanic_train)
plot(q)
auc(q)

# confusion matrix for Test data
titanic_test$Survivedpred = ifelse(titanic_test$prob>=.5,'pred_yes','pred_no')
table(titanic_test$Survivedpred,titanic_test$Survived)

#Accuracy, Precision, Recall and F1 for Test
accuracy_test <- (151+59)/(151+30+25+59)#79.24
precision_test <- 59/ (59+25) #70.23
recall_test <- 59/(59+30) #66.29
F1_test <- (2*79.24*70.23)/(79.24+70.23) #74.46

View(titanic_test)

df.titanic_final_jackrose <- read.csv('JackRose.csv')

# confusion matrix for Jack Rose

df.titanic_final_jackrose$pred = predict(titanic_generalizedlinear_1,newdata = df.titanic_final_jackrose, type=c("response"))
df.titanic_final_jackrose$Survivedpred = ifelse(df.titanic_final_jackrose$pred>=.5,'pred_yes','pred_no')
table(titanic_test$Survivedpred,titanic_test$Survived)
View(df.titanic_final_jackrose)
