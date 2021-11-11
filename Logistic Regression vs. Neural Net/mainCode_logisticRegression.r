# clear environment
rm(list = ls())

# import necessary libraries
# install.packages('neuralnet')
library(neuralnet)
# install.packages('NeuralNetTools')
library(NeuralNetTools)
# install.packages('nnet')
library(nnet)
library(caret)

# import data set
tayko.df <- read.csv("Desktop/CIS4930/CIS4930_CSV_Tayko.csv")

# drop 'id' column
tayko.df <- subset(tayko.df, select=-c(id)) # Drop ID

# split into training and validation data set using 6:4 ratio
set.seed(1)  
train.index <- sample(c(1:dim(tayko.df)[1]), dim(tayko.df)[1]*0.6)  
train.df <- tayko.df[train.index, ]
valid.df <- tayko.df[-train.index, ]

# logistic regression on the training data
tayko.reg <- lm(Purchase ~ ., data = train.df)
options(scipen = 999, digits = 3)
summary(tayko.reg)

# make prediction with validation data
tayko.reg.pred <- predict(tayko.reg, valid.df, type = 'response') # predict the prob of belonging to class 1
tayko.reg.pred

# classify using a cutoff value of probability (ex: 0.5)
tayko.reg.pred.class <- factor(ifelse(tayko.reg.pred > 0.5, 1, 0), levels = c('1', '0')) # if true, changed to 1. all else, 0
tayko.reg.pred.class

# actual classes of validation data
actual.class <- factor(valid.df$Purchase, levels = c('1', '0'))

# confusion matrix
confusionMatrix(tayko.reg.pred.class, actual.class)
# to keep positive class as 1, and reduce confusion with positive class as 0 in confusion matrix, 
# factor() function was used in above 2 sections of code

# neural net model on training data, using a single hidden layer with 5 nodes
tayko.nn <- neuralnet::neuralnet(Purchase ~ ., data=train.df, hidden=5)

# neural network results
NeuralNetTools::plotnet(tayko.nn)
NeuralNetTools::neuralweights(tayko.nn)

# neural network performance
tayko.nn.pred <- neuralnet::compute(tayko.nn, valid.df)
tayko.nn.pred.class <- ifelse(tayko.nn.pred$net.result > 0.5, 1, 0)
actual.class <- factor(valid.df$Purchase, levels = c('1', '0'))
confusionMatrix(as.factor(tayko.nn.pred.class), actual.class)

