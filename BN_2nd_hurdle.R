

library(bnlearn)
library(dplyr)

setwd("D:/Hackathon")
getwd()

train <- read.csv("Trainingnewhurdle.csv",sep = ",")
str(train)

for(i in 1:ncol(train)){
  train[is.na(train[,i]), i] <- mean(train[,i], na.rm = TRUE)
}

#Will be treated as Categorical to find probability
data <- train[,c(11,12,13,14,19,24)]
data <- as.data.frame(lapply(data, as.factor))


#Will be treated as Continuous
datac <- train[,c(2,3,4,5,6,7,8,9,10,15,16,17,18,20,21,22,23,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39)]
datac <- as.data.frame(lapply(datac, as.numeric))

str(datac)
#as.data.frame(table(train[,c(39)]))

final <- as.data.frame(cbind(data,datac))
str(final)

G <- bnlearn::h2pc(final)
arcs(G)
