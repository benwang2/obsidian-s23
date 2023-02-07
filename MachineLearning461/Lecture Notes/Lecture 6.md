---
title: Lecture Notes 6
course: CS_461
date: 2023-02-06
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture X</h1></center>

## Bayes Rule

We may reduce the amount of required training data by estimating $P(X \mid Y)$ instead of $P(Y \mid X)$ using Bayes Rule.

For $P(X \mid Y)$, we have $2^d - 1$ parameters. For 30 boolean $X_i$'s, we would have ~2 billion parameters.

We subtract one from the $2^d$ so we may infer the last parameter. Since the probability of all parameters add up to 1, if we subtract by 1, we obtain the probability of the last parameter.

### Naive Bayes
We use **conditional independence**, where X is conditionally independent of Y given Z, if the probability distribution govenring X is independent of the value of Y, given the value of Z.

$$P(X \mid Y,Z) = P(X \mid Z)$$
$$P(X,Y\mid Z) = P(X\mid Z)P(Y \mid Z)$$
Naive Bayes is a classifier that assumes conditional independence of the variables $X_i$ given the label $Y$. For example: $P(X_1\mid X_2, Y) = P(X_1 \mid Y)$.

We use this to simplify $P(X_1,X_2 \mid Y)$ to $P(X_1 \mid Y)P(X_2 \mid Y)$.
With the conditional independence assumption, we have $2d$ parameters, whereas without the conditional independence assumption we have $2(2^d-1)$.
