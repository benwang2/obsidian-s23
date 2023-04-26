## Shattering
Over an infinite hypothesis space $H$, we replace $|H|$ with other masures of $H$, e.g. the shattering coefficient and VC dimension.

Let
- $H(S)$ be the set of splittings of dataset $S$ using concepts from $H$.
- $H[m]$ be the max number of ways to split $m$ points using concepts in H, given as
$$H[m] = max\{|H(S)|;|S|=m,S\subseteq X\}$$
If we have $m=4$, then we will have $H[m] = 5$. In general, $H[m] = m+1$. $H[m]$ can be as large as $2^m$.

We say that $H$ **shatters** $S$ if $|H(S)|=2^{|S|}$. If $H$ shatters $S$, that means that $H$ is able to perfectly classify any possible labeling of the instances in $S$.

## VC-dimension
The VC-dimension of a hypothesis space $H$ is the cardinality of the largest set S that can be shattered by $H$. If arbitrarily large finite sets can be shattered by$H$, then VCdim(H) is infinitely large.

VC dimension is a measure of the expressive power of a hypothesis space $H$

To prove that a VC-dimension is of dimension $d$, we must show:
- there exists a set of $d$ points that can be shattered
- there is no set of $d+1$ points that can be shattered.

Therefore, a VC-dimension is of dimension $d$, if and only if there exists a set of exactly $d$ points that can be shattered.