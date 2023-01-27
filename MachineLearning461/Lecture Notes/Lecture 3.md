---
title: Lecture Notes 3
course: CS_461
date: 2023-01-26
tags: 
- lectureNotes
- CS_461
---

<center><h1>Lecture 3</h1></center>

## Entropy
...

### Information Gain
Given the definition of entropy,we define the measure of effectiveness of classifying training data as "Information Gain".

**Information Gain** of **A** is the expected reduction in entropy of target variable **Y** for data sample **S**, due to sorting on variable **A**.

$$Gain(S,A) = Entropy(S) - \sum_{v\in values(A))}{\frac{\lvert S_v \rvert}{\lvert S \rvert}}Entropy(S_v)$$
where $Entropy(S)$ is the entropy of the original collection and the summation expression is the expected entropy after S is partitioned by attribute **A**.

## Overfitting
Consider a hypothesis $h$ and its
- error rate over training data: $error_{train}(h)$
- true error rate over all data: $error_{true}(h)$

We say that $h$ overfits the training data if
$$error_{true}(h) \gt error_{train}(h)$$
Overfitting occurs when a decision tree tries to perfectly map a set of data, which ends up "overfitting" data because the tree becomes too specialized for that specific data set.

#### How can we reduce overfitting using ID3?
- Stop growing tree earlier before it reaches point of perfectly classifying training data
- Approaches that allow tree to overfit the data, then post-prune

#### Reduced error pruning
- Split data into training set and validation set
- Train a tree to classify training set as well as possible
- Do until further pruning is harmful
	- For each internal tree node, consider making it a leaf node, pruning tree below it
- Greedily chose the above pruning step that best improves error over validation step

#### Training data, validation data, and testing data
- Training data is a subset of the original data which is used to fit/obtain the model  
• Validation data is another independent subset of the original data which is used to tune model hyper-parameters, e.g. tree pruning  
• Testing data is another independent subset of the original data which is used to evaluate the final model