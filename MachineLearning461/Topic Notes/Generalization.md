Generalization is the ability of a machine learning model to perform well over future/unseen data that was not used in training.

In machine learning, it's important to build models that **generalize** well to new data as opposed to overfitting to the training data.

## Hypothesis
The goal of generalization is to find a hypothesis $h$ that approximates the target concept, $y_i = c^*(x_i)$.

For this, we have a set of $m$ labeled examples, drawn from a fixed but known distribution D.
$$(x_1, y_1), ..., (x_m,y_m)$$

The true error of $h$ is given by:
$$err(h) = \underset{x \sim D}{Pr}(h(x) \not= c^*(x))$$
and the empirical error of h is given by:
$$err_s(h) = \underset{x \sim S}{Pr}(h(x) \not= c^*(x)) = \frac{1}{m}\sum_{i=1}{m}I[h(x_i)\not=c^*(x_i)]$$

The true error describes the probability that $h$ makes a prediction that differs from the true target concept for a randomly drawn example $x_i$ in $D$.

The empirical error describes the proportion of training examples $x_i$ for which $h$ makes a prediction that differs from the true target concept.

The intuition behind this is that true error measures how well $h$ can generalize to new examples, while empirical error measures how well $h$ fits the training examples.

Therefore, another way to describe our goal is to minimize the empirical and true error.

True and empirical error of a hypothesis can be described by a Venn Diagram.

![[461hypothesis_venndiagram.excalidraw|center]]

Negative symbols represent a negative training example and a positive symbol represents a  positive training example.

Although all training examples are correctly classified, the error can never be zero.