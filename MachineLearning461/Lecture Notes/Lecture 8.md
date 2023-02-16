---
title: Lecture Notes 8
course: CS_461
date: 2023-02-13
tags: 
- lectureNotes
- CS_461
---

<center><h1>Lecture 8</h1></center>

## Classifiers
There are two types of machine learning classifiers:
- Generative
- Discriminative

**Generative classifiers** estimate parameters of P(X | Y) and view P(X|Y) as describing how to sample random instance X given Y. If we have enough training data and a sufficiently accurate tree, we can generate new examples.

**Discriminative classifiers** estimate parameters of P(Y|X) and do not care how instances are generated. It learns a decision boundary directly from training data.

## Logistic regression
