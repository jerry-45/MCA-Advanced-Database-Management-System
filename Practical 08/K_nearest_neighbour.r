/*
Description
k-nearest neighbour classification for test set from training set. For each row of the test set, the k nearest (in Euclidean distance) training set vectors are found, and the classification is decided by majority vote, with ties broken at random. If there are ties for the kth nearest vector, all candidates are included in the vote.
Usage
knn(train, test, cl, k = 1, l = 0, prob = FALSE, use.all = TRUE)
Arguments:
train	- matrix or data frame of training set cases.
test	- matrix or data frame of test set cases. A vector will be interpreted as a row vector for a single case.
cl	    - factor of true classifications of training set
k	    - number of neighbours considered.
l	    - minimum vote for definite decision, otherwise doubt. (More precisely, less than k-l dissenting votes are allowed, even if k is increased by ties.)
prob	- If this is true, the proportion of the votes for the winning class are returned as attribute prob.
use.all	- controls handling of ties. If true, all distances equal to the kth largest are included. If false, a random selection of distances equal to the kth is chosen to use exactly k neighbours.

*/

/*KNN*/

table(iris$Species)
str(iris$Species)
head(iris)
ir=iris
View(iris)
#Shuffle data
ir<-ir[sample(nrow(ir)),]
#check shuffling
head(ir)
View(ir)
#Scale data using normalization
#create function
normalize<-function(x){
  return((x-min(x)))/(max(x)-min(x))
}
#normalize iris data
iris_n<-as.data.frame(lapply(ir[,c(1,2,3,4)],normalize))
str(iris_n)

#create train dataset and test dataset
iris_train<-iris_n[1:129,]
iris_test<-iris_n[130:150,]
iris_train_target<-iris[1:129,5]
iris_test_target<-iris[130:150,5]
iris_train_target
library(class)

#check the dimension of the dataset
dim(iris_train)
dim(iris_test)
help(knn)
#knn(training,testing,class,no of neigbour)
model<-knn(iris_train,iris_test,cl=iris_train_target,k=13)
install.packages("gmodels")
library(gmodels)
CrossTable(x=iris_test_target,y=model,chisq=F)
model
table(iris_test_target,model)
#iris Dataset
