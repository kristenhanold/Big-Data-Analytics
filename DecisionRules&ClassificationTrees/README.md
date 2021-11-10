**Problems**

The file **eBayAuctions.csv** contains information on 1972 auctions that
transacted on eBay.com during May-June in 2004. The goal is to use these
data in order to build a model that will classify competitive auctions
from non-competitive ones. A *competitive auction* is defined as an
auction with at least 2 bids placed on the auctioned item. The data
include variables that describe the auctioned item (auction category),
the seller (their eBay rating), and the auction terms that the seller
selected (auction duration, opening price, currency, day-of-week of
auction close). In addition, we have the price that the auction closed
at. The goal is to predict whether an auction will be competitive or
not.

**Notes:**

Note that in the dataset, the original variables of **Category** (11
categories), **Currency** (USD, nonUS), and **EndDay** (Weekend, Week)
are categorical. Therefore, the dataset also contains corresponding
dummy variables. Also, note that only one dummy variable from each group
of dummy variables is already excluded (e.g., there are only 10 category
dummy variables) to avoid multicollinearity.

1.  Import the dataset. Remove **Category**, **Currency**, **EndDay** variables from the imported dataset because we already have their corresponding dummy variables.

    a.  ![image](https://user-images.githubusercontent.com/65267161/141202074-5e8cb9f3-2f93-4011-8ce3-92ce2ddbe18c.png)

2.  Split the data into training and validation datasets using a 60%-40% ratio.

    a.  ![image](https://user-images.githubusercontent.com/65267161/141202136-820cd2eb-e9b0-4050-a14a-6241a8a1fe23.png)

3.  Fit a classification tree. Use **Competitive** as the target variable and the rest of the variables as predictors. (As mentioned in the notes, you don't have to exclude one dummy variable from each dummy group for a categorical variable. To avoid overfitting, set the **maxdepth=6**.

    a.  Report the tree - plot the tree and copy and paste the resulting
        > diagram. You don't have to care too much about the aesthetics
        > of the diagram.

       i.  ![image](https://user-images.githubusercontent.com/65267161/141202175-ab2458e0-3446-4cd8-b6d2-f3e0d2c61464.png)

    b.  List the decision rules. For example, if variable1\<0 AND
        > variable2\<2, class=0.

       i.  ![image](https://user-images.githubusercontent.com/65267161/141202227-2509b2e7-7575-4399-a726-667a95411c37.png)

    c.  Report the prediction confusion matrix of validation data.

       i.  ![image](https://user-images.githubusercontent.com/65267161/141202273-d9eec866-edfb-4c10-80c0-8c6d5d81a98f.png)

    d.  Which predictors are used by the tree?

       i.  OpenPrice, ClosePrice, SellerRating, and Currency.nonUS

4.  Are the rules practical for predicting the outcome of a new auction? Explain why. (Hint: Can you use the rules to classify a new auction before the auction ends? In other words, do you know the values of all predictors used in the rules before the auction ends? Some of them may not be known before the end of the auction. What are those variables?). Which variables should **NOT** be included in the predictor set? Explain why.

    a.  These rules are not practical for predicting the outcome of a
        new auction. ClosePrice should not be included in the predictor
        set because we do not know what the ClosePrice will be until the
        auction ends.

5.  Fit another classification tree using the same setting in question 3. This time, use only the predictors that can be used for predicting the outcome of a new auction before the auction ends.
  
    a.  Report the tree - plot the tree and copy and paste the resulting diagram. You don't have to care too much about the aesthetics of the diagram.

    a.  ![image](https://user-images.githubusercontent.com/65267161/141202339-52d01170-3fb2-44e8-b8ad-20e81d0b952b.png)

    b.  List the decision rules. For example, if variable1\<0 AND
    variable2\<2, class=0.

    b.  ![image](https://user-images.githubusercontent.com/65267161/141202366-fbb5ec7d-328e-44cd-80df-41245ea82d9d.png)

c.  Report the prediction confusion matrix of validation data.

   c.  ![image](https://user-images.githubusercontent.com/65267161/141202384-11e1ee95-ce19-431e-acc7-3544b37d53ff.png)

d.  Which predictors are used by the tree?

   d.  OpenPrice, SellerRating, Currency.nonUS, and Duration

6.  Compare the overall performance (e.g., accuracy or error rates) of the two decision trees (from Q3 and Q5). Which model has better predictive performance? Explain why.

    a.  ![image](https://user-images.githubusercontent.com/65267161/141202497-95f69177-1bad-4258-8898-603583d3d4e3.png)

    b.  ![image](https://user-images.githubusercontent.com/65267161/141202512-e64f4437-4827-44d6-b100-508fb4556e8f.png)

    c.  We can see that the first decision tree has an accuracy rating
        of 85%, while the second decision tree has an accuracy rating of
        75%. Thus, the first decision tree has better predictive
        performance since the accuracy rating is higher.

