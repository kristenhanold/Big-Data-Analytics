## Problems
Tayko Software is a software catalog firm that sells games and educational software. It started out as a software manufacturer and then added third-party titles to its offerings. It recently revised its collection of items in a new catalog, which it mailed out to its customers. This mailing yielded 2000 purchases. Based on these data, Tayko wants to devise a model for predicting whether a new customer will make a purchase when they receive the new catalog. The file CIS4930_CSV_Tayko.csv contains information on 2000 purchases. The table below describes the variables. 

<img width="439" alt="Screen Shot 2021-11-11 at 1 40 58 PM" src="https://user-images.githubusercontent.com/65267161/141351691-d98d38d0-1bfd-4f0a-8523-f5734955b236.png">


1.	Import the dataset. Remove variable id from the imported data because we will not use it as a predictor. 

2.	Split the data into training and validation sets using a 6:4 ratio.	 

3.	Run a logistic regression on the training data (You need to choose the correct target variable). Then, generate a confusion matrix of the model using the validation data. Report the confusion matrix. 
    a.	 ![image](https://user-images.githubusercontent.com/65267161/141351795-cd350689-dbb4-4838-aa48-1c8572be7c13.png)


4.	Run a neural net model on the training data, using a single hidden layer with 5 nodes. Generate a confusion matrix of the model using the validation data. Report the confusion matrix
    a.	 ![image](https://user-images.githubusercontent.com/65267161/141351845-264101de-3895-4bab-9b88-b22333be1559.png)

5.	Compare the two model performances. Based on the result, which model will yield more success in terms of customer purchase?
(Hint: If Tayko selects 100 new customers classified as “purchase” and send new catalogs, how many of them will purchase Tayko product according to each model?)
    
    a.	Logistic regression: 327 / (289+75) = 0.898
    
    b.	Neural: 294 / (305+108) = 0.71
    
    c.	If Tayko selects 100 new customers classified as “purchase” and sends new catalogs, 90% of them will purchase Tayko products according to the logistic regression model. However, based on the neural net model, if Tayko selects 100 new customers classified as “purchase” and sends new catalogs, 71% of them will purchase Tayko products. This said, the Logistic Regression Model will yield the most success in terms of customer purchase based on the above calculations from both confusion matrixes.
