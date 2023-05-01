The goal of generalization is to find a hypothesis $h$ that approximates the target concept, $y_i = c^*(x_i)$.

We write $c(x) = 1$ if $x$ is a positive example of $c$, and write $c(x)=0$ if $x$ is a negative example.

For this, we have a set of $m$ labeled examples, drawn from a fixed but known distribution D. Our distribution, $D$ is stationary and unchanged.
$$(x_1, y_1), ..., (x_m,y_m)$$

The true error of $h$ is given by:
$$err_D(h) = \underset{x \sim D}{Pr}(h(x) \not= c^*(x))$$
and the empirical error of h is given by:
$$err_s(h) = \underset{x \sim S}{Pr}(h(x) \not= c^*(x)) = \frac{1}{m}\sum_{i=1}{m}I[h(x_i)\not=c^*(x_i)]$$

The true error describes the probability that $h$ makes a prediction that differs from the true target concept for a randomly drawn example $x_i$ in $D$. In other words, the true error is the probability that a randomly drawn instance will fall into the region where $h$ and $c$ disagree (i.e. their set difference) - defined over the entire distribution of instances.

The empirical error describes the proportion of training examples $x_i$ for which $h$ makes a prediction that differs from the true target concept. In other wods, empirical error refers to the fraction of training examples misclassified by h, in contrast to the true error.

The intuition behind this is that true error measures how well $h$ can generalize to new examples, while empirical error measures how well $h$ fits the training examples.

Therefore, another way to describe our goal is to minimize the empirical and true error.

True and empirical error of a hypothesis can be described by a Venn Diagram.

![[461hypothesis_venndiagram.excalidraw|center]]

Negative symbols represent a negative training example and a positive symbol represents a  positive training example.

Although all training examples are correctly classified, the error can never be zero.

For this venn diagram, we compute true error to be 66% or $\frac{4}{6}$, and empirical error to be 0%. 

This is because out of 6 instances, we have 2 that are correctly classified. Although the negative training examples aren't relevant to the classifying task, we still count these as inaccuracies for true error.

In empirical error, we omit the instances that are not relevant to the classifying task and instead only count the ones that exist within the venn diagram circles.

## Sample Complexity

We can find the minimum $m$ so that we are $x$% sure that the true error is less than $y$, using the following formula.

$$m = \frac{1}{\epsilon}\bigg[\text{ln}(|H|)+\text{ln}\Big(\frac{1}{\delta}\Big)\bigg]$$

where $\epsilon = 1-x$ and $\delta=1-y$.
We use this formula when the hypothesis space is perfect (no disagreement between target concept and hypothesis)

When we can not find $h$ such that $h$ is perfectly consistent with the data,

we use the formula

$$m \geq \frac{1}{2\epsilon^2}\Big(\text{ln}(2|H|)+\text{ln}\Big(\frac{1}{\delta}\Big)\Big)$$