# clean environment
rm(list = ls())

# import all necessary libraries
library(rpart)
library(rpart.plot)
library(gmodels)
library(caret)
library(forecast)

# read csv file
ebay.df <- read.csv("/Users/kristenhanold/Desktop/CIS4930/eBayAuctions.csv") 

#########################################################
### 1. Initial exploration of first data set ############
#########################################################
ebay.df<-ebay.df[,-c(6:8)] # selected columns
View(ebay.df)

# Partition the data
set.seed(1)
train.index <- sample(c(1:dim(ebay.df)[1]), 0.6*dim(ebay.df)[1])
train.df <- ebay.df[train.index, ]
valid.df <- ebay.df[-train.index, ]

# fit the classification tree
class.tree <- rpart(Competitive ~ ., data = train.df, method = 'class',
                    control = rpart.control(maxdepth = 6))

# plot the classification tree
prp(class.tree, type = 3, extra = 101, box.palette = 'GnYlRd',
    clip.right.lab = FALSE, branch = 0.3, cex.main = 3, varlen = -10, under = TRUE)


# look at decision rules
rpart.rules(class.tree, extra = 4, cover = TRUE)

# Report the prediction confusion matrix of validation data.  
pred.ebay <- predict(class.tree, valid.df, type = 'class')
pred.ebay
options(scipen=999, digits = 3)

# generate confusion matrix for validation data
confusionMatrix(as.factor(pred.ebay), as.factor(valid.df$Competitive))


##########################################################
### Initial exploration of second data set ############
##########################################################

# fit the classification tree
class.tree.2 <- rpart(Competitive ~ .-ClosePrice, data = train.df, method = 'class',
                    control = rpart.control(maxdepth = 6))

# plot the classification tree
prp(class.tree.2, type = 3, extra = 101, box.palette = 'GnYlRd',
    clip.right.lab = FALSE, branch = 0.3, cex.main = 3, varlen = -10, under = TRUE)

# look at decision rules
rpart.rules(class.tree.2, extra = 4, cover = TRUE)

# Report the prediction confusion matrix of validation data.  
pred.ebay.2 <- predict(class.tree.2, valid.df, type = 'class')
pred.ebay.2
options(scipen=999, digits = 3)

# generate confusion matrix for validation data
confusionMatrix(as.factor(pred.ebay.2), as.factor(valid.df$Competitive))

