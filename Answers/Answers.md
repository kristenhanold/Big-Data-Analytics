Complete the following tasks (write necessary R code):

1. **Report the model estimation results. Based on the estimated values in the results, write out how the linear regression model looks like. Note: you need to put the estimated coefficient values in the square brackets. e.g., FARE = [Intercept value] + [coefficient 1] x SW_Yes + [coefficient 2] x DISTANCE+… Also, interpret the meanings of the two model coefficients for SW_Yes and DISTANCE. Provide the corresponding estimation results to support your answer.**
    1. FARE = [-23.95] + [-33.71] * VACATION_YES + [-39.39] * SW_YES + [19.16] * SLOT_CTRL + [22.93] * GATE_CONS + [7.04] * COUPON + [-1.80] * NEW + [0.01] * HI + [0.00] * S_INCOME + [0.00] * E_INCOME + [0.00] * S_POP + [0.00] * E_POP + [0.07] * DISTANCE + 0.00 * PAX
    2. Interpretation: For SW_YES, or in other words if Southwest does serve said route, for every Southwest flight that serves the route, the FARE decreases by $39.39. Regarding DISTANCE, for every mile increase in the DISTANCE, the FARE increases by $0.07.

2. **Use a “Backward” variable selection to reduce the number of predictors. How many variables are being selected? Report all the variables selected. Provide the estimation results.**
3. **Compare the predictive accuracy of the full model in (c) and the “Backward” model in (d). Focus on measures such as RMSE and Adjusted R2. Which model performs better, and why?**
