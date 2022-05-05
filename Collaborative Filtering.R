#library
#install.packages("recommenderlab", dependencies=TRUE)
#install.packages("lsa")
library(recommenderlab)
library(stringi)
library(reshape2)
library(lsa)
#read data
data <- read.csv("Recommender_student.csv")
##convert data to matrix
data_m <- as.matrix(data[,-1])
data_transposed<- read.csv("transposed_student.csv")
#convert data_transposed to matrix
transposed_data <- as.matrix(data_transposed[,-1])
transposed_data[is.na(transposed_data)] <- 0
x<- cosine(transposed_data)
#Convert ratings matrix to real rating matrx which makes it dense
data_rat = as(data_m, "realRatingMatrix")
#Create Recommender Model
recommend = Recommender(data_rat, method = "IBCF", param=list(method="Cosine"))
#Obtain top 3 recommendations for 4st user entry in dataset
pred__course = predict(recommend, data_rat[4], n=3)
#Obtain top 1 recommendations for 4st user entry in dataset
pred_course = predict(recommend, data_rat[4], n=1)
#recommend in list 
List__courses = as(pred__course, "list")
#recommend in list
List_course= as(pred_course, "list")


