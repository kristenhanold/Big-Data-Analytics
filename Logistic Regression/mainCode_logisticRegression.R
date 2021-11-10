# import dataset
library(readr)
library(ggplot2)
p <- ggplot(airfare.df)
CSV_Airfares <- read_csv("~/Desktop/CiS4930/CSV_Airfares.csv")

# load data
airfare.df <- read.csv("CSV_Airfares.csv")

# take dollar sign out of "FARE" column
airfare.df$FARE = as.numeric(gsub("[\\$,]", "", airfare.df$FARE))

# select variables for regression
variables.selected <- c("VACATION_YES", "SW_YES", "SLOT_CTRL", "GATE_CONS", 
                        "COUPON", "NEW", "HI", "S_INCOME", "E_INCOME", 
                        "S_POP", "E_POP", "DISTANCE", "PAX", "FARE")

# partition the data
set.seed(1)
train.index <- sample(c(1:638), 638*0.60)  
train.df <- airfare.df[train.index, variables.selected]
valid.df <- airfare.df[-train.index, variables.selected]

# building a multiple linear regression model for predicting avg fare on new route
airfare.lm <- lm(FARE ~ ., data = train.df)
options(scipen = 999, digits = 3)
summary(airfare.lm)
modelSummary <- summary(airfare.lm)
round(modelSummary$coefficients, 2)

# use backward variable selection to reduce num of predictors
backwardDirection <- step(airfare.lm, direction = 'backward') 
backwardDirection$coefficients

# compare predictive accuracy in (c) & (d)
library(forecast)
# use predict() to make predictions on a new set. 
airfare.lm.pred <- predict(airfare.lm, valid.df)
airfare.lm.pred2 <- predict(backwardDirection, valid.df)

# use accuracy() to compute common accuracy measures.
accuracy(airfare.lm.pred, valid.df$FARE)
accuracy(airfare.lm.pred2, valid.df$FARE)


