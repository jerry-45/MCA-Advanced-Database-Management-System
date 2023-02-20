mtcars
View(mtcars)
mtcars$mpg
mpg
attach(mtcars)
mpg  #we can access column without using $ sign
detach(mtcars)
mpg


diabetes<-c("Type3","Type2","Type1","Type4")
diabetes<-factor(diabetes) 
diabetes
status<-c("Poor","Improved","Excellent","Poor")
status
status<-factor(status,ordered=T,levels = c("Poor","Improved","Excellent"))
status


PatientId<-c(1,2,3,4)
Age<-c(24,56,34,76)
Patientdata<-data.frame(PatientId,Age,status,diabetes)
Patientdata #Data frame created


mydata<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
mydata<-edit(mydata) #data entered by user
mydata

setwd("C:/Users/user/Documents/Anchal's Files/R Studio")
getwd()

file<-read.csv("missing_col.csv")
ta<-read.table("missing_col.csv",sep = ",")
ta
file
View(file)


install.packages("RODBC")
installed.packages()  #to check installed packages
library(RODBC) #to use package
exl<-odbcConnectExcel2007("defaulter.xlsx")
s<-sqlFetch(exl,"Sheet1")
s
install.packages("xlsx")
library(xlsx)
x1<-"defaulter.xlsx"
x1<-read.xlsx(x1,1)  #read xlsx file and stores in x1
x1
write.table(mydata,"mydata.txt") #Write value of mydata into txt file
write.xlsx(x1,"test.xlsx") #write x1 into text.xlsx file

mtcars:

