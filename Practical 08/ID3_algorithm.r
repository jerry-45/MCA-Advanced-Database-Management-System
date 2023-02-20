#id3_iris
ir<-iris
ir<-ir[sample(nrow(ir)),]
train <-ir[1:100,]
train
test<-ir[101:105,]
test
install.packages("rpart")
library(rpart)
fit<-rpart(Species~.,data=iris)
library(rpart.plot)
install.packages("rpart.plot")

library(rpart.plot)
rpart.plot(fit)
summary(fit)
prediction<-predict(fit,iris[,1:4],type="class")
prediction

rpart.plot(fit)