---
title: Lecture Notes 5
course: CS_461
date: 2023-02-02
tags: 
- lectureNotes
- CS_461
---

<center><h1>Lecture Y</h1></center>


## Bayes Rule
Bayes rules describes the porbability of an event, based on prior knowledge of conditions that might be related to the event.

For example, if the risk of developing health problems is known to increase with age, Bayes' theorem allows the risk to an individual of a known age to be assessed more accurately by conditioning it relative to their age, rather than simply assuming that the individual is typical of the population as whole.
[source](https://en.wikipedia.org/wiki/Bayes%27_theorem)

Bayes Rule defines the equation, $P(A \mid B) = \frac{P(B \mid A)P(A)}{P(B)}$.

In the context of machine learning, we have that $P( \emptyset \mid D) = \frac{ P(D \mid \emptyset) P(\emptyset) }{ P(D) }$
such that $P(D \mid D) \propto P(D \mid \emptyset) P(\emptyset)$

### MAP estimation
**Choosing a prior**
We may choose a prior that is **uniform** / uninformative prior: constant for all values of $\emptyset$ ==> similar to MLE, which can represent the prior belief.
The conjugate prior: $P( \emptyset)$ and $P( \emptyset \mid D)$ have the same form.

For a uniform / uninformative prior, we use $$P(\emptyset) = \frac{\emptyset^{\beta_H-1}(1-\emptyset)^{\beta_T-1}}{B(\beta_H,\beta_T)}$$

where $\beta_H$ and $\beta_T$ are occurences of variables, in this case, the number of heads and tails.

A prior $p(\emptyset)$ is a conjugate to a likelihood function $P(D \mid \epsilon)$ if the posterior has the same functional form of the prior. It exists for many standard distributions.
- e.g., **Beta** is conjugate to Bernoulli
- e.g., **Normal** is conjugate to Normal

For an example, we may begin with our $\beta = (1,1)$ but as we gain new data, we adapt it. If we have 3 heads and 3 tails, then we have that $\beta = (3,3)$ following the new data.