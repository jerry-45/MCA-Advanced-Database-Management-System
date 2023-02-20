#K-means: Grouping data into different cluster
install.packages("stats") #to perform k-means
library(stats)
library(dplyr)
library(ggplot2)
ir<-iris
#Unsupervised learning without class
mydata<-select(ir,c(1,2,3,4)) #selecting 4 columns of iris dataset
mydata

model<-kmeans(mydata,3) #data and no. of groups(cluster)
model #grouping data

model$cluster
#cluster(size)
model$size
table(model$cluster,iris$Species)
model$cluster<-as.factor(model$Cluster)
ggplot(iris,aes(Petal.Length,Sepal.Length, color=model$cluster))+geom_point()

