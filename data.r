library(dplyr)
library(ggplot2)
data<-read.csv("train.csv")
data
sumsat<-summary(data)
print(data)
hist<-ggplot(data,aes(x=Age))+ 
  geom_histogram(binwidth = 5,fill="green",color="red")+
  labs(title="Distribution of ages in train ",x="age",y="frequency")
hist

miss<-colSums(is.na(data))
miss
duplicated(data)
data<-distinct(data)
data

data$Age[is.na(data$Age)]<-mean(data$Age,na.rm=TRUE)
data

missing_value<-colSums(is.na(data))
missing_value

adult<-filter(data,Age>18)
adult
sorted<-arrange(data,desc(Fare))
sorted

print(boxplot(Age~Survived,data=data,col=c("red","green"),main="boxplot"))

ttest<-t.test(Age~Survived,data=data)  
ttest

corr<-cor(data$Age,data$Fare)
corr      

