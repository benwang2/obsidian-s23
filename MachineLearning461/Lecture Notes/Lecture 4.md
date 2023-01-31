---
title: Lecture Notes 4
course: CS_461
date: 2023-01-30
tags: 
- lectureNotes
- CS_461
---

<center><h1>Lecture 461</h1></center>

## Continuous attributes
- use range / thresholds assigned to properties

## Ensemble learning, bagging
- Using ensemble learning with trees makes them work very wellin practice, i.e, instead of one tree, create a forest of trees and combine their prediction (**A group of weak learners come together to form a strong learner**)
- **Bagging**: Resample the training dataset with replacement and average the trees.

## Functional approximation
- Set of possible instances $X$
- Unknown target function $f: X \to Y$
- Set of function hypotheses $H=\{h \mid H : X \to Y\}$

We have a decision tree that gives $X \to Y$

### Probabilistic functional approximation
Instead of $f: X \to Y$, the algorithm should learn $P(Y\mid X)$ because probability / confidence level can help to further develop the model. It can also help to model distributions.

Conditional probability: $P(A \mid B) = \frac{P(A,B)}{P(B)}$
The chain rule: $P(A, B) = P(A \mid B)P(B)$

Using a probabilistic functional approximation, we can also easily find the probability of a certain value of an attribute occuring, simply by summing where conditions are met.

We can not estimate $P(Y \mid X)$ in this fashion, because we do not have enough data to fully complete the table.

To solve this issue, we use the following tools:
- **Maximum likelihood estimates**
- **Maximum a posteriori estimates**

## Maximum Likelihood Estimation (MLE)
MLE chooses the parameter $\theta$ that maximizes the probaiblity of the observed data $P(data \mid \theta)$

Let 
$$\begin{align}
\frac{d}{d\theta}lnP(D\mid\theta) &=\frac{d}{d\theta}[a_1 ln\theta+a_0 ln(1-\theta)] &= 0
\end{align}$$



