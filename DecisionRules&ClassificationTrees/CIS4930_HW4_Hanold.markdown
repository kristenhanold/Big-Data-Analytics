**Kristen Hanold**

**CIS4930 Big Data Analytics**

**Homework 4: Competitive Auctions on eBay.com**

Due by 10/28/2021 (Thursday), 11:59 pm

**What to Turn In:**

1)  **An MS Word file** that contains your answers to the questions. You
    can use screenshots to report the required results if it is
    convenient for you.

2)  **An R script** that contains your code.

**Note: Please do NOT submit any other file format. Failing to submit
the files in the correct file format will cause the loss of homework
grades!**

**[Problems]{.ul}**

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

1.  Import the dataset. Remove **Category**, **Currency**, **EndDay**
    > variables from the imported dataset because we already have their
    > corresponding dummy variables.

    a.  ![Text Description automatically generated with low
        confidence](media/image1.png){width="4.597222222222222in"
        height="0.625in"}

2.  Split the data into training and validation datasets using a 60%-40%
    > ratio.

    a.  ![Text Description automatically
        generated](media/image2.png){width="5.444444444444445in"
        height="1.2796773840769904in"}

3.  Fit a classification tree. Use **Competitive** as the target
    > variable and the rest of the variables as predictors. (As
    > mentioned in the notes, you don't have to exclude one dummy
    > variable from each dummy group for a categorical variable[)]{.ul}.
    > To avoid overfitting, set the **maxdepth=6**.

    a.  Report the tree - plot the tree and copy and paste the resulting
        > diagram. You don't have to care too much about the aesthetics
        > of the diagram.

        i.  ![A picture containing sky, outdoor, day Description
            automatically
            generated](media/image3.png){width="4.863420822397201in"
            height="4.375in"}

    b.  List the decision rules. For example, if variable1\<0 AND
        > variable2\<2, class=0.

        i.  ![A picture containing graphical user interface Description
            automatically
            generated](media/image4.png){width="5.861111111111111in"
            height="1.479054024496938in"}

    c.  Report the prediction confusion matrix of validation data.

        i.  ![Text Description automatically
            generated](media/image5.png){width="5.256706036745407in"
            height="4.815277777777778in"}

    d.  Which predictors are used by the tree?

        i.  OpenPrice, ClosePrice, SellerRating, and Currency.nonUS

4.  Are the rules practical for predicting the outcome of a new auction?
    > Explain why\
    > (Hint: Can you use the rules to classify a new auction before the
    > auction ends? In other words, do you know the values of all
    > predictors used in the rules before the auction ends? Some of them
    > may not be known before the end of the auction. What are those
    > variables?). Which variables should **NOT** be included in the
    > predictor set? Explain why.

    a.  These rules are not practical for predicting the outcome of a
        new auction. ClosePrice should not be included in the predictor
        set because we do not know what the ClosePrice will be until the
        auction ends.

5.  Fit another classification tree using the same setting in
    > question 3. This time, use only the predictors that can be used
    > for predicting the outcome of a new auction before the auction
    > ends.

```{=html}
<!-- -->
```
a.  Report the tree - plot the tree and copy and paste the resulting
    diagram. You don't have to care too much about the aesthetics of the
    diagram.

    a.  ![A picture containing sky, boat, day Description automatically
        generated](media/image6.png){width="5.427974628171478in"
        height="5.555555555555555in"}

b.  List the decision rules. For example, if variable1\<0 AND
    variable2\<2, class=0.

    a.  ![Text Description automatically
        generated](media/image7.png){width="5.916666666666667in"
        height="1.413426290463692in"}

c.  Report the prediction confusion matrix of validation data.

    a.  ![Text Description automatically
        generated](media/image8.png){width="4.567280183727034in"
        height="3.872916666666667in"}

d.  Which predictors are used by the tree?

    a.  OpenPrice, SellerRating, Currency.nonUS, and Duration­­­

```{=html}
<!-- -->
```
6.  Compare the overall performance (e.g., accuracy or error rates) of
    > the two decision trees (from Q3 and Q5). Which model has better
    > predictive performance? Explain why.

7.  a.  ![Graphical user interface, text Description automatically
        generated](media/image9.png){width="6.0in"
        height="1.764744094488189in"}

    b.  ![Text Description automatically
        generated](media/image10.png){width="5.986111111111111in"
        height="1.6839140419947507in"}

    c.  We can see that the first decision tree has an accuracy rating
        of 85%, while the second decision tree has an accuracy rating of
        75%. Thus, the first decision tree has better predictive
        performance since the accuracy rating is higher.

**Submission checklist**

\[ x \] Answers to questions 2 - 6

\[ x \] R script that includes your code
