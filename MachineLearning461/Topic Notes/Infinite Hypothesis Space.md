## Sample complexity
$$m \geq \frac{2}{\epsilon}[log_2(2H[2m])+log_2(\frac{1}{\delta})]$$
and
$$m \geq \frac{8}{\epsilon}\Bigg[d\text{ln}\bigg(\frac{16}{\epsilon}\bigg)+\text{ln}\bigg(\frac{2}{\delta}\bigg)\Bigg]$$
where $e$ is the error $(1 - \text{true accuracy})$ and $\delta$ is the confidence error $(1-\text{confidence})$.


When $h$ is not perfect, we instead use the formula
$$m=O\Big(\frac{1}{\epsilon^2}\Big(d+\text{ln}\Big(\frac{1}{\delta}\Big)\Big)\Big)$$
which can be rewritten as
$$err(h) \leq err_s(h) + O\Bigg(\sqrt{\frac{d+\text{ln}1/\delta}{m}}\Bigg)$$

## Shattering
Over an infinite hypothesis space $H$, we replace $|H|$ with other measures of $H$, e.g. the shattering coefficient and VC dimension.

Let
- $H(S)$ be the set of splittings of dataset $S$ using concepts from $H$.
- $H[m]$ be the max number of ways to split $m$ points using concepts in H, given as
$$H[m] = max\{|H(S)|;|S|=m,S\subseteq X\}$$
If we have $m=4$, then we will have $H[m] = 5$. In general, $H[m] = m+1$. $H[m]$ can be as large as $2^m$.

We say that $H$ **shatters** $S$ if $|H(S)|=2^{|S|}$. If $H$ shatters $S$, that means that $H$ is able to perfectly classify any possible labeling of the instances in $S$