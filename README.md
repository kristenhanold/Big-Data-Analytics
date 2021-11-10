# BigDataAnalytics--LogisticRegression

CIS4930 Big Data Analytics
Individual Assignment 1: Predicting Airfare on New Routes
Due on 9/16/2021 (Thursday), 11:59PM
What to Turn In: 


Problem: Predicting Airfares on New Routes
Several new airports have opened in major cities, opening the market for new routes (a route refers to a pair of airports), and Southwest has not announced whether it will cover routes to/from these cities. In order to price flights on these routes, a major airline collected information on 638 air routes in the United States. Some factors are known about these new routes: the distance traveled, demographics of the city where the new airport is located, and whether this city is a vacation destination. Other factors are yet unknown (e.g., the number of passengers that will travel this route). A major unknown factor is whether Southwest or another discount airline will travel on these new routes. Southwest's strategy (point-to-point routes covering only major cities, use of secondary airports, standardized fleet, low fares) has been very different from the model followed by the older and bigger airlines (hub-and-spoke model extending to even smaller cities, presence in primary airports, variety in fleet, pursuit of high-end business travelers). The presence of discount airlines is therefore believed to reduce the fares greatly.







The file CSV_Airfares.csv contains real data that were collected for the third quarter of a year. They consist of the following predictors and response (i.e., the target variable):

- S_CODE: Starting airport's code
- S_CITY: Starting city
- E_CODE: Ending airport's code
- E_CITY: Ending city
- COUPON: Average number of coupons (a one-coupon flight is a non-stop flight, a two-coupon flight is a one stop flight, etc.) for that route
- NEW: Number of new carriers entering that route between Q3-96 and Q2-97
- VACATION: Whether a vacation route (Yes) or not (No). Florida and Las Vegas routes are generally considered vacation routes.
- SW: Whether Southwest Airlines serves that route (Yes) or not (No)
- HI: Herfindel Index - measure of market concentration
- S_INCOME: Starting city's average personal income
- E_INCOME: Ending city's average personal income
- S_POP: Starting city's population
- E_POP: Ending city's population
- SLOT: Whether either endpoint airport is slot controlled or not; this is a measure of airport congestion
- GATE: Whether either endpoint airport has gate constraints or not; this is another measure of airport congestion
- DISTANCE: Distance between two endpoint airports in miles
- PAX: Number of passengers on that route during period of data collection
- FARE: (the response) Average fare on that route

Note that some cities are served by more than one airport, and in those cases the airports are
distinguished by their 3-letter code. 

For this homework, the categorical variables Vacation, SW, Slot, Gate have been transformed into the following dummy variables: 
-	VACATION_YES: =1 if Vacation is YES; and =0 otherwise; 
-	VACATION_NO: =1 if Vacation is NO; and =0 otherwise;
-	SW_YES: =1 if SW is YES; and =0 otherwise;
-	SW_NO: =1 if SW is NO; and =0 otherwise;
-	SLOT_FREE: =1 if Slot is FREE; and =0 otherwise;
-	SLOT_CTRL: =1 if Slot is CONTROLLED; and =0 otherwise;
-	GATE_FREE: =1 if Gate is FREE; and =0 otherwise;
-	GATE_CONS: =1 if Gate is CONSTRAINED; and =0 otherwise.




Complete the following tasks (write necessary R code): 
- a.	Partition the original dataset into training (60%) and validation sets (40%). The model will be fit to the training data and evaluated on the validation set.
- b.	Build a multiple linear regression model for predicting the average fare on a new route. Include all numerical predictors in the regression. For the four categorical variables (i.e., Vacation, SW, Slot, Gate), do NOT use the original variables. Instead, use the four dummy variables: VACATION_YES, SW_YES, SLOT_CTRL, and GATE_CONS. Finally, do not use S_CODE, S_CITY, E_CODE, and E_CITY in the regression.  
- c.	Report the model estimation results. Based on the estimated values in the results, write out how the linear regression model looks like. Note: you need to put the estimated coefficient values in the square brackets. 
e.g., FARE = [Intercept value] + [coefficient 1]*SW_Yes + [coefficient 2]*DISTANCE+…
Also, interpret the meanings of the two model coefficients for SW_Yes and DISTANCE. 
Provide the corresponding estimation results to support your answer. 
- d.	Use a “Backward” variable selection to reduce the number of predictors. How many variables are being selected? Report all the variables selected. Provide the estimation results.  
- e.	Compare the predictive accuracy of the full model in (c) and the “Backward” model in (d). Focus on measures such as RMSE and Adjusted R2. Which model performs better, and why?
