#Naive Bayes Classification
install.packages("e1071")
library(e1071) #to load the package
#divide the dataset(iris) into two sets training and testing dataset 
View(iris)
ir<-iris
train<-ir[1:100,] #1 to 100 rows and all columns
test<-ir[101:105,] #test set
#test data should always be less than test data
#In iris dataset target class is species
model<-naiveBayes(Species~.,data=train) #storing classification
table(train$Species)
table(test$Species)
pred<-predict(model,test) 
table(pred)

#shuffle iris dataset
ir<-ir[sample(nrow(ir)),]
View(ir)
train<-ir[1:100,] #1 to 100 rows and all columns
test<-ir[101:105,] #test set
table(train$Species)
table(test$Species)
model<-naiveBayes(Species~.,data=train)
pred<-predict(model,test) 
table(pred)
