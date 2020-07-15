# reading all the datasets

getwd()
setwd("C:/Users/AD/Documents/Empirical_Finance/Dow Jones")

# Update libraries  

library(MASS)
library(caTools)
library(date)
library(ggplot2)
library(lubridate)

DJI <- read.csv("DJI.csv",header = TRUE)
DJI
summary(DJI)
plot(DJI)

# dividing the data into training and test data

DJIPrice <- DJI[c("Open","High","Low","Close")]
scatter.smooth(x=DJIPrice$Open,y=DJIPrice$Close, main="Dow Jone Stock Price")
DJIPrice
summary(DJIPrice)


#trainingdataIndex <- sample(1:nrow(DJIPrice), 0.7*nrow(DJIPrice))
#trainingdata <- DJIPrice[trainingdataIndex, ]
#testdata <- DJIPrice[-trainingdataIndex, ]

#Create a relationship table 

DJModel <- lm(Close ~ Open+High+Low, data = DJIPrice)
DJPred <- predict(DJModel, DJIPrice)
DJPred
summary(DJModel)

AIC(DJModel)
BIC(DJModel)

#predicting the values of Dow jones

ActualPrediction <- data.frame(cbind(ActualData=DJIPrice$Close, PredictedData=DJPred))
CorAccuracy <- cor(ActualPrediction)
ActualPrediction
CorAccuracy
































