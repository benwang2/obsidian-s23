Lambda calculus is a formal system that models computation using functions and their application

### Term definition
Lambda terms are inductively defined. A lambda term is:
- a variable, x
- $(\lambda x.M)$, where $x$ is a variable and $M$ is a lambda term
- $(M N)$, where $M$ and $N$ are $\lambda$-terms (application)

### Abbreviations
- Function application is left associative, meaning that $(f\;g\;z)$ is the same as $((f\;g)\;z)$
- Function application has precedence over function abstraction, meaning that the "function body" extends as far to the right as possible
	- $\lambda x.yz$ is the same as $(\lambda x . (yz))$
- "Multiple arguments", $\lambda xy.z$ is the same as $(\lambda x.(\lambda y.z))$

### Beta Reduction
Beta reduction is the process of 'simplifying' a formula by making substitutions within the formula.

Take for example, the lambda function:
$$\begin{align*}
((λx.λy.xy) (λz.(z z)) x) &= ((\lambda y. (\lambda z.(zz))y)) x) & \text{Substitute } (\lambda \text{z.(z z)}) \text{ for } x \\
((\lambda y. (\lambda z.(zz))y)) x) &= ((\lambda z.(zz))x) & \text{Substitute }x\text{ for }y \\
((\lambda z.(zz))x) &= (xx) & \text{Substitute }x\text{ for }z
\end{align*}$$

Therefore, our $\beta$ normal form is $(xx)$

### Alpha Renaming
Alpha renaming is used to prevent capturing free occurences of variables when beta-reducing a lambda calculus expression. We may only rename **bound** variables.

For example, with the following lambda function, beta reduction would result in an incorrect normal form:
$$\begin{align*}
((\lambda x.\lambda y.(x y)) y w) &= ((\lambda y.(y y)) w) & \text{Replace }x\text{ with y} \\
((\lambda y.(y y)) w) &= (w\;w) & \text{Replace }y\text{ with w} \\
\end{align*}$$

However, we can use alpha renaming to rewrite the lambda function.
$$\begin{align*}
((\lambda x.\lambda y.(x\;y)) y\;w) &= ((\lambda x. \lambda z.(x\;z)) y\;w) & \text{Replace bound }y\text{ with }z. \\
((\lambda x. \lambda z.(x\;z)) y\;w) &= ((\lambda x. (y\;z)) w) & \text{Replace }x\text{ with }y. \\
((\lambda z. (y\;z)) w) &= (y w) & \text{Replace }z\text{ with }w.
\end{align*}$$