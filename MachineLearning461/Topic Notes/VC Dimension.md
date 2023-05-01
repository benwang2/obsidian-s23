The VC-dimension of a hypothesis space $H$ is the cardinality of the largest set S that can be shattered by $H$. If arbitrarily large finite sets can be shattered by$H$, then VCdim(H) is infinitely large.

VC dimension is a measure of the expressive power of a hypothesis space $H$

	To prove that a VC-dimension is of dimension $d$, we must show:
- there exists a set of $d$ points that can be shattered
- there is no set of $d+1$ points that can be shattered.

Therefore, a VC-dimension is of dimension $d$, if and only if there exists a set of exactly $d$ points that can be shattered.

For example, if we want to show a VC-dimension is of dimension $d$, we show that the classifier can select all sets of $d$. If it can not select all sets of $d$ without including an additional instance, the dimension is greater than $d$.

### Dimension sizes
A high VC dimension
- is prone to overfitting, meaning it can learn the noise or specific patterns in the training data 
- has the capacity to fit a wide range of complex and nonlinear functions, which allows it to fit the training data very well, even with noise or outliers

A low VC dimension
- has a limited capacity to fit complex functions
- is more likely to generalize well to new data
- may not be able to capture the underlying patterns in the data, which can result in underfitting