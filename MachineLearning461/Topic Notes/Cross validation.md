Cross validation is an algorithm used to minimize test error / generalization error across hypotheses.

The goal of cross validation is to compare whether h1 or h2 is the preferred model / hypothesis.

This approach involves partitioning available data into training and test set.
For each hypothesis, we run the algorithm on the training set and evaluate on the test set, taking the $h$ with the smallest test error.

## K-fold Cross-Validation

K-fold cross-validation is a technique that determines the accuracy of a hypothesis over different partitions of a training data set.

In k-fold cross-validation, we partition the training set into k subsets of equal size, holding one as a testing data set at a time.

The model is trained on the $k-1$ folds to make a prediction on the $k$th fold.

This method has a lower variance than a single copy and is always better than using a single hold-out.