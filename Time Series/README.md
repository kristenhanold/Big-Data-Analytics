A souvenir shop at a beach resort town in Queensland, Australia is trying to forecast sales for the next 12 months (year 2002) based on the monthly sales data (in Australian dollars) between 1995 and 2001. Data are available in SouvenirSales.csv.

  1. Create a time plot of monthly sales for the souvenir shop. Screenshot the plot.
      1. ![image](https://user-images.githubusercontent.com/65267161/141198394-ed81e1b6-084c-47b5-8cdf-de4e4fb718b9.png)

  2. Based on the plot, do you see a trend in the data? If so, what kind of trend do you expect?
      
      2. Yes, there is an uptrend present in the data from 1995-2002 since the data continues to increase for each time period. 

  3. Based on the plot, do you see a seasonality in the data? If so, how many months are in one “season ”?
      
      3. Yes, there is seasonality in the data. We can see there is a major increase in sales towards the end of each year around November and December. Per one season, there is 12 months. According to the data, there is a major peak every 12 months around the end of each year, as stated previously. However, at the beginning of each year there is a major decrease followed by a raise in sales over the next 12 months until it peaks in November/December.


Partition the data into training and validation sets, with the validation set containing the last 12 months of data (year 2001). Remember to fit only the training data.

  4. Perform a naïve forecast with seasonal mean values. Remember to fit only the training data. What is the RMSE for the forecast on the validation data?
      
      4. 9542.346
      
      4. ![image](https://user-images.githubusercontent.com/65267161/141199043-0161468b-e216-4df7-99df-811f2bfe41e2.png)

  5. Run a regression model with a linear trend and monthly seasonality. Remember to fit only the training data. 
      5. What is the estimated trend coefficient? What does this mean? 
        
        5. 245.36 is the trend coefficient. The trend coefficient shows there is an average linear increase in Souvenir Sales of $245.36 each month over the entire period. 
        
        5. ![image](https://user-images.githubusercontent.com/65267161/141199146-999dba7d-c29b-485f-bb0a-22d7141af7ad.png)
       
      5. What is the RMSE for the forecast on the validation data? Does this model perform better or worse than the naïve forecast in 4)? 

        5. 17451.547 is the RMSE for the linear trend and monthly seasonality forecast of the validation data. Since the RMSE of the naïve forecast is 9542.346, the naïve forecast performs better than and indicates a better fit compared to the linear trend and monthly seasonality forecast, because the naïve forecast has a lower RMSE value, meaning it contains a lower amount of errors in predicting the response. 

        5. ![image](https://user-images.githubusercontent.com/65267161/141199459-1646cca4-8f7f-44e8-8fd7-c6f48ce5c209.png)

  6. Use a Holt-Winter’s exponential smoothing approach to make a prediction. Remember to fit only the training data. 
      6. What is the RMSE for the forecast on the validation data? Does this model perform better or worse than the naïve forecast in 4)?

        6. The RMSE of the Holt-Winter’s forecast is 9893.032. Since the RMSE of the naïve forecast is 9542.346, the naïve forecast performs better than and indicates a better fit compared to the linear trend and monthly seasonality forecast, because the naïve forecast has a lower RMSE value, meaning it contains a lower amount of errors in predicting the response. 

        6. ![image](https://user-images.githubusercontent.com/65267161/141199598-a0af0e0c-8419-494a-9aa0-77c45a308042.png)

      6. Plot the predicted values and actual values of the validation data. Screenshot the result.

        6. ![image](https://user-images.githubusercontent.com/65267161/141199643-3aca36be-a806-4121-880d-0e95dcc8100a.png)
