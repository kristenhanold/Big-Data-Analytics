library(forecast)
library(zoo)

# import dataset
souvenirData <- read.csv("Desktop/CIS4930/SouvenirSales.csv")

sales.ts <- ts(souvenirData$Sales, start = c(1995, 1), 
                   end = c(2001, 12), freq = 12)

# plot the series to check the patterns
plot(sales.ts/1000, xlab = 'Time', ylab = 'Sales (in thousands)',
     main = 'Souvenir Sales Over Time')

###############################################
### 2. partition the data #####################
###############################################
nValid <- 12
nTrain <- length(sales.ts) - nValid

train.ts <- window(sales.ts, start = c(1995, 1), end = c(2000, 12))

valid.ts <- window(sales.ts, start = c(2001, 1), end = c(2001, 12))

# seasonal mean value of all data
snaive.pred <- snaive(train.ts, h = nValid)
snaive.pred

# to compare accuracy between datasets
accuracy(snaive.pred, valid.ts)

# Model with both linear trend and seasonality
train.lm.trend.season <- tslm(train.ts ~ trend + season)
summary(train.lm.trend.season)
lm.trend.season.pred <- forecast(train.lm.trend.season, h = nValid)
accuracy(lm.trend.season.pred, valid.ts)

# Holt-Winters exponential smoothing
hwes <- ets(train.ts, model = 'MAA')
hwes.pred <- forecast(hwes, h = nValid, level = 0)
accuracy(hwes.pred, valid.ts)

# plot validation data (actual values)
lines(valid.ts/1000, col = "red", lty = 3)                

# plot forecast data (prediction values)
lines(hwes.pred$mean/1000, lwd = 2, col = "purple", lty = 1)  
