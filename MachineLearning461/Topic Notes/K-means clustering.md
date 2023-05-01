Given a set $S$ of $n$ points, a distance measure specifying $d(x,y)$ between any two points $(x,y)$, output a partition of the data into $k$ clusters and center points $c_1, c_2,...,c_k$ to minimize

$$\sum_{i=1}^{n}min_{j\in\{1,...,k\}}d^2(x^i,c_j)$$

If k = 1, we have an easy case: $c_1$ is the mean of all data set points.
If k > 1, it is NP hard - we take a heuristic approach.

## Lloyd's Method
- Input: a set of $n$ datapoints $x^1, x^2, ..., x^n$
- Initialize centers and clusters in any way
- Repeat until there is no further change in objective function
	- For each $j$, update $C_j$: assign a datapoint to this cluster if its closest center is $c_j$
	- For each $j$, update $c_j$: assign new value to cluster center as the average of all datapoints in the cluster $C_j$


Lloyd's method is thrown off by outliers when certain clusters occur, like when points are clustered very closely, but clusters are far apart.

To handle this, we use furthest point initialization.
We choose $c_1$ randomly and pick $c_j$ such that it is farther from previously chosen $c_{j-1}, c_{j-n}$

### K-means++ initialization
- Interpolate between random and furthest point initialization
- Let D(x) be the distance between a point x and its nearest center. Chose the next center proportional to $D^2(x)$
	- Choose $c_1$ randomly
	- for j = 2, ..., k, pick $c_j$ from data points according to the probability
$$P(c_j = x^i) \propto D^2(x^i)$$

## Deciding a value for K
- Heuristic: find a large gap in objective function (cost) between k-1 and k
- Use cross-validation
- Use different clustering methods


## Shortcomings
- Sensitive to outliers
- Due to the assumption that clusters are spherical and of equal size, if the data has clusters of arbitrary shapes and sizes, k-means clustering may be inaccurate
- In high-dimensional data, distance between points becomes less meaningful and clustering becomes more difficult
- If data can not be separated by linear boundaries, then k-means clustering may not be effective