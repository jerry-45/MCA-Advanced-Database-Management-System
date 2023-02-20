#No of Years of Exprience of employees
x<-c(3,8,9,13,3,6,11,21,1,16)
#Salary of employees
y<-c(30,57,64,72,36,43,59,90,20,83)
plot(x,y,col='red',main="scatter plot")
model<-lm(y~x) #finding linear regression
attributes(model)
coef(model)
summary(model)
abline(model) #find best fit line
a<-data.frame(x=10)
predict(model,a)
