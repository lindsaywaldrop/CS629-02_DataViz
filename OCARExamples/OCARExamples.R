# Heart data script for showing OCAR examples
library(ggplot2)
library(reshape2)

hearts<-read.csv("heart.csv")  # Data on heart attack patients from https://www.kaggle.com/ronitf/heart-disease-uci/data
hearts$sex<-factor(hearts$sex,levels=c(0,1),labels=c("female","male"))

# This is a pretty large data set with a bunch of different attributes. There are a bunch of different questions you can
# ask and answer, but you have to carefully think about 1) which question to ask and 2) how to create a clear relationship
# between the data in a figure that will answer that question. 

# A set of examples: 

# Barplot with means of cp for each sex
ggplot(hearts,aes(x=sex,y=cp))+geom_bar(stat="summary",fun.y="mean")

# Barpot with median of cp for each sex
ggplot(hearts,aes(x=sex,y=cp))+geom_bar(stat="summary",fun.y="median")

hearts$cp<-as.factor(hearts$cp)

# Barplot showing counts of chest pain versus sex
ggplot(hearts,aes(x=cp,fill=sex))+geom_bar(stat="count")

# Barplot showing frequencies of chest pain versus sex
ggplot(hearts_long,aes(x=cp,fill=sex))+geom_bar(position="fill")

# Do any of these graphs answer the question clearly? 
# How would you change the graphs to improve the clarity? 


