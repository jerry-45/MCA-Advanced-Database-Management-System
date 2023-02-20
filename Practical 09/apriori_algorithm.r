mba<-read.csv("MBA.csv")
View(mba)
#used for Apriori Algorithm
install.packages("arules")
library(arules)
mba<-as(mba,"transactions") #mba data into transactions
inspect(mba)
class(mba)
#split(mba$Products,mba$ID,"transaction")
a<-apriori(mba , parameter = list(support=0.01,confidence=0.2))
inspect(a)
summary(a)

#install arulesViz package and plot the graph
install.packages("arulesViz")
library(arulesViz)
plot(a)
