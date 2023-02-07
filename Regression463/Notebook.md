---
course_id: 01:960:463
course_name: REGRESSION METHODS
professor: Andrew Magyar
---

# Regression Methods

## Univariate Random Variables

### Example
- Suppose one has an opaque jar filled with 6 marbles.  With 
the exception of their color, the marbles are all identical in terms of 
size, weight, shape and texture.  The color of the six marbles are: **Red**, **Blue**, **Green**, **White**, **Black**, **Gray**.
- The jar is shook up and one is asked to blindly reach in and pull out a single marble.  Consequently, for this random phenomena, that sample space is, $S$ = {**Red**, **Blue**, **Green**, **White**, **Black**, **Gray**}.

### Vocabulary
**Probability** is defined as: a way to 'quantify' uncertainty, that is assign a number to the likelihood of an outcome/s of a random phenomena occuring

An **event** is a subcollection of outcomes in the sample space $S$.
- Events are notated using capital letters (e.g. $E$, $F$, $T$)
- An event is said to occur if one of the outcomes contained in the event is indeed the outcome that is realized
- In the example, the event of picking a marble whose color begins with the letter "B" could be defined as $B =$ {Blue, Black}.

A **random variable** is simply a random quantity. Mathematically, a random variable is a function that assigns a real number to each outcome in a sample space. They are usually represented with capital letters from the end of the alphabet (e.g. $X, Y, Z$)

### Axioms of Probability
Probability is a function, $Pr(\cdot)$, that maps events in $S$ to a number in the interval $[0,1]$ that satisfies the following axioms:
1) $Pr(S)=1$ (some outcome will happen)
2) $Pr(\emptyset) = 0$ (an outcome must happen)
3) Given two events in $S, E$ and $F$, if $E \subseteq F$ then $Pr(E) \leq Pr(F)$ (If an event occuring is implie dby another event occuring, it should be at least as likely)
4) Given two events in $S$, if $E$ and $F$ that are mutually exclusive, then $Pr(E\cup F) = Pr(E) + Pr(F)$

Probability assigns numbers to events in a manner that agrees with intuition. The above criterion are needed for the probability assignments to be logically consistent.

## Random Variables
Let $o$ denote an outcome in $S$ (denoted $o \in S$). Let $X$ be a $rv$ defined on some sample space, $S$. Then **for each** $o \in S$, $X$ maps $o$ to some real number, that is $X(o) = x$.
- A _rv_ $X$ is a function/rule. The notation $x$ is a real number representing a possible value of that random variable (a realization of the rv).
- Every outcome in the sample space must be assigned to number under the map $X$, otherwise it is not a *rv*, (in fact it isn't even a function, but a partial function).

Similarly to functions, random variables inherit certain properties like the $Domain$ and $Range$.

An *rv* is a function where the independent variables are outcomes in $S$ $(o \in S)$, the dependent variable are real numbers, $x \in \mathbb{R}$ and the domain is $S$.

$$X(o) = x$$
In this syntax, $X$ is a symbol for the 'function' whereas $x$ is an output value of that function (i.e. a realization of the random variables for an outcome, $o$, that is observed).

Usually, *rv*s defined on outcomes are such that the outputs are informative numerical quantities that are related to the outcomes of interest.

#### Examples
Let $S$ be the students in the class. Below are examples of *rv*s on this sample space.
- $Y$ = the age (rounded to the nearest year) of an individual
- $W$ = the weight (measured in pounds) of an individual
- $G$ = let $G$ be equal to $1$ if an individual is a female and $0$ otherwise
- $M$ = the height (measured in meters) of an individual
- $Z$ = 3 (i.e. every individual is mapped to 3)

$Z$ is an example of a constant *rv* (or simply a constant). It doesn't seem to have any rationale based in the real world. However, this does not prevent it from being a random variable.

#### Support
For an *rv* $X$, the set of all possible values that the *rv* $X$ can take on is referred to as the ***support*** of the *rv*.
- in otherwords, the **support** of an *rv* is its range.
- it is denoted as $S_x$

For the previously defined examples, we have...
- $S_Y=\{0,1,2,3,4,\cdot\cdot\cdot,n\}$
- $S_W=\{w:w\geq0\}$
- $S_G = \{0,1\}$
- $S_M=\{m:m\geq 0\}$
- $S_Z = \{3\}$

Random variables can be classified as either discrete or continuous based on the nature of their supports

#### Probabilities
Since *rv*s are functions from $S$ to some real number, the probability of an *rv* takes on specific values will be dictated by the underlying probabilites defined on the sample space.

Let $A$ be a set of numbers, the probability that the random variable takes on the numbers in this set is given by 
$$Pr(X\in A)=Pr({o; X(o) \in A})$$

### Normal Random Variables
A **Normal** *rv* is one of the most commonly encountered continuous random variables. The reason it is so common is because:
- In many real-life problems, the distribution of the numerical variable of interest is approximately Normal (i.e. a distribution plot of the data is roughly the same as the $pdf$ of a Normal $rv$).
- Sample averages arise in many statistical analyses. By the Central Limit Theorem, under minimal conditions, for large enough sample sizes, the sampling distribution of the sample average closely follows the distribution of a normal $rv$, no matter what the underlying distribution of the data being analyzed!!!

Normal random variables are also called **Gaussian** $rv$s.

### Bivariate Random Variables
- A bivariate random variable (*brv*) is a function that assigns an ordered pair $(x, y) \in \mathbb{R}^2$, to each outcome in the sample space. That is a $brv$, $B$, is a function from $S \to \mathbb{R}^2$ (i.e. $B(o)=(x,y)$).
	- As $\mathbb{R}^2=\mathbb{R}\times\mathbb{R}$ (a cross-product of sets), it follows that there exists univariate functions, $X\&Y$, both which map $S\to\mathbb{R}$, with $B(o)=(X(o),Y(o))$ for each $o \in S$.
	- $X$ and $Y$ are the functions on the individuals coordinates induced by $B$, but they are univariate $rv$s when considered by themselves. (Two univariate $rv$s considered as a pair define a $brv$)

$brv$s are commonly notated as $(X,Y)$

## Probability Mass Function
Probability mass functions are useful mathematical constructs used for describing a discrete *rv*.
For a discrete *rv* $X$, the $pmf$, denoted as $p_X(x)$ is defined as,
$$p_X(x)=Pr(X=x)=Pr(\{o;X(o)=x\})$$
For the marbles in the urn example $S_N=\{3,4,5\}$, we have
- $Pr(N=3) = Pr(\{Red\}) = \frac{1}{6}$
- $Pr(N=4)=Pr({Blue,Gray})=\frac{2}{6}$
- $Pr(N=5)=Pr(\{Green,White,Black\})=\frac{3}{6}$

Knowing this, we can define the $pmf$ for the *rv* $N$ with the formula
$$p_N(n) = \begin{cases}
\frac{n-2}{6} & \text{if }n=3,4,5 \\
0 & else
\end{cases}$$

In general an *rv*, $X$, is a function with domain $S$ and range $S_x$ whereas its $pmf$, $p_x$, is a function with domain $\mathbb{R}$ and range in the interval $[0,1]$.

A $pmf$ should specifiy the values for all real numbers, not just those in its support. This is because an *rv* communicates informative values pertaining to the outcomes in $S$, and its $pmf$ indicates how the value of *rv* are distributed on the real number line. (i.e. the likelihood with which the the *rv* will take on sets of numbers that are of interest.)

##### Properties of the $pmf$
For any $pmf$, the following must hold.

1. 
$$\sum_{\text{all }x\in S_X}{}p_X(x)=1$$
This is due to the fact that by the definition of an *rv*, every outcome in $S$ gets mapped to a real number, thus summing the $pmf$ over its entire support will encompass all the outcomes in $S$ (which has probability 1).

2. 
$$\lim_{x\rightarrow -\infty}p_X(x)=0\quad\&\quad\lim_{x \rightarrow \infty}p_X(x)=0$$
If this property didn't hold true, then (1) would not be possible. The limit notation indicates that the value of the expression, $p_X(x)$, tends to $0$ as the argument $x$, tends to either $\pm\infty$

### Joint Probability Mass Functions
A joint $pmf$ is used to describe the *joint* probabilistic behavior of two discrete $rv$s. Given two $rv$s, $X$ and $Y$, their joint $pmf$ is defined to be:

$$p_{X,Y}(x,y) = Pr(\{X=x\}\cap\{Y=y\})=Pr(X=x,Y=y)$$

The "," is understood to be a shorthand for the intersection in this notation.

As there are only two $rv$s in consideration, this is sometimes referred to as the bivariate $pmf$, and their joint distribution referred to as the bivariate distribution.

Intuitively, the joint support of $(X,Y)$, denoted as $S_{X,Y}$, is the set of all pairs $(x,y)$ that are possible. In more explicit mathematical notation, we write:
$$S_{X,Y} = {(x,y);x,y\in\mathbb{R}\&p_{X,Y}\not= 0}$$

For our marble example, we have...
$$
p_{N,C}(n,c) = \begin{cases}
\frac{n-c}{6} & for\quad (3,2),(4,2),(5,3),(5,4) \\
0 & else
\end{cases}
$$

### Marginal pmfs
Given a bivariate discrete $rv$ $(X,Y)$ with joint $pmf$ $p_{X<Y}(x,y)$ and supports $S_{X,Y}$ it follows that

1.
$$p_X(x)=\sum_{\gamma s.t. (x,\gamma))\in S_{X,Y}}p_{X,Y}(x,\gamma)$$
and, 2.
$$p_Y(y) = \sum_{\gamma s.t. (\chi,y))\in S_{X,Y}}p_{X,Y}(\chi,y)$$

Like univariate $pmf$s, the sum of a bivariate $pmf$ over its support is always $1$.  Similarly, as $x$ and/or $y$ tend to $\infty/-\infty$, the values of $p_{X,Y}(x,y)$ tend to 0.

### Conditional Distribution
- Suppose I reach in the jar, pull out a marble and tell you that the number of consonants in the color is 2 (you are told the event $\{C = 2\}$ occurred). Knowing this, does this change the likelihoods of how many letters are in the color of the marble that was selected? 
- Note that the marbles, Green, White & Black have more than 2  
consonants, thus knowing $C = 2$ implies these could not have seen the marble that I selected.  
- For these, $N = 5$, thus if it is known the event $\{C = 2\}$ occurs, then in it is impossible for the event $\{N = 5\}$ to have also occurred!
- Consequently, the only marbles that could have been selected are the Red, Blue, or Gray marble, which have 2, 3 and 3 letters respectively.

Given two events $E$ and $F$, the probability of $F$ occuring knowing that that $E$ occurs is given by the formula:
$$Pr(F\mid E)=\frac{Pr(F\cap E)}{Pr(E)}$$

Since $\{C=2\}$ and $\{N=3\}$ are events, one can apply the above formula.

An example of this formula might be:
$$\begin{align}
Pr(N=4\mid C=2) &= \frac{Pr(\{N=4\}\cap\{C=2\})}{Pr(\{C=2\})}\\
	&= \frac{p_{N,C}(4,2)}{p_C(2)} \\
	&= \frac{\frac{2}{6}}{\frac{3}{6}} \\
	&= \frac{2}{3}
\end{align}$$



The **conditional pmf Formula**, given two $rv$s, $X$ and $Y$, the conditional $pmf$ of $X$ given $Y=\gamma$ is defined to be:
$$p_{X\mid Y=\gamma}(x)=\begin{cases}
\frac{p_{X,Y}(x,\gamma)}{p_Y(\gamma)} & for\quad x\in S_x \quad and\quad (x,y)\in S_{X,Y} \\
0 & else
\end{cases}$$

## Probability Density Function
For continuous *rv*s, a useful mathematical construct associated with them is the probability density function, $pdf$.

The $pdf$ is a curve such that the area under the $pdf$ from $a$ to $b$ equals the probability the continuous *rv* takes on values between $a$ and $b$.

Given a continuous *rv*, $X$, its $pdf$ is usually denoted $f(x)$ (or $f_X(x)$ if there are several *rv*s and it is necessary to distinguish which particular continuous *rv* is being referred to).

#### Example
Suppose we are at a bowling alley to play a few games. Since I'm an unskilled bowler, I play on a lane with bumpers. Furthermore, where the ball ends up at the back of the alley is completely random. Assume that for every point at the back alley, it is equally likely that the ball can end up there.

If the back of the bowling alley is 41.5 inches wide, then our sample space is $S_L= [0,41.5]$, where *rv* $L$ is the distance (inches) from the left of the back alley to where the bowled ball ends up in the alley.

As the likelihood of the ball ending up at any point in the back alley is the same for any point, for the *rv* $L$, its $pdf$ is
$$f_L(l) = \begin{cases}
\frac{1}{41.5} & \text{for }0\leq l \leq 41.5 \\
0 & else
\end{cases}$$
The area under if for any interval from $a$ to $b$ (with $a\lt b$) is given as
$$
\text{Area under }f_L(l) \text{from a to b} = \text{length of interval} \times \text{height of pdf}\\
= (b-a)\frac{1}{41.5}
$$
#### Properties 
Let $X$ be a continuous *rv*. The following are true regarding its $pdf$ $f_X(x):$
1. Total area under $f_X(x) = 1$
	- Idea: This is due to the fact that by the definition of an *rv*, every outcome in $S_X$ gets mapped to a real number, thus the area under the entire support will encompass all the outcomes in $S_X$ (which has a probability of 1).
2. $\lim_{x\to-\infty}f_X(x)=0 \quad\&\quad \lim_{x\to\infty}f_X(x)=0$ 

Finding the area under the curve given by some function $f(x)$ is the same as finding its integral from $a$ to $b$.

For any continuous *rv*, $X$, it follows that $Pr(X=x)=0$ for all $x \in \mathbb{R}$. Therefore, we have the following rules.
1. $Pr(X\lt x) = Pr(X \le x)$
2. $Pr(X\gt x) = Pr(X\ge x)$
3. $Pr(a \lt X \lt b) = Pr(a \lt X \le b) = Pr(a \le X \lt b) = Pr(a \le X \le b)$


#### pdf of Normal Random Variable
Let $X$ be a normal $rv$. A normal is continuous with the following $pdf$,
$$f(x) = \frac{1}{\sqrt{2\pi}}\frac{1}{\sigma}e^\frac{(x-\mu)^2}{2\sigma^2}\quad for -\infty \lt x \lt \infty$$

The $pdf$ of a normal is unimodal, symmetric bell-shaped curve. There are two parameters (numerical quantities) that dictate its shape,
- $\mu$ - This indicates where the bell-shaped curve is centered around (its point of symmetry). $\mu$ can be any real number, that is $-\infty \lt \mu \lt \infty$
- $\sigma$ -  This determines the width of the bell-shaped curve. $\sigma$ must be a positive real number, that is $\sigma\gt0$

#### Joint Probability Density Function
The joint $pdf$ for a continuous $brv$ $(X, Y)$ is a bivariate function from  $\mathbb{R}^2$ into $R$, often denoted $f(x,y)$ (or $f_{X,Y}(x,y)$) if there are more than two $rv$s in play).

It can be geometrically visualized as a cloth lying over the x-y coordinate plane. The height of the cloth from the coordinate plane represents the probability of the event at that coordinate occurring.

Let $R$ be a region in the x-y plane, then $Pr((X,Y) \in R)$ is given as the volume under the bivariate $pdf$ surface above the region $R$.

One commonly encountered bivariate distribution utilized for modeling is the bivariate Normal. If $(X, Y)$ follows a bivariate normal (denoted $(X,Y) ~ Norm_2(\mu_x, \mu_y, \sigma_X^2, sigma_Y^2, \rho))$ then its joint pdf 
is 
$$f(x,Y)=\frac{1}{2\pi}\frac{1}{\sigma_X\sigma_Y\sqrt{1-\rho^2}}exp(-\frac{1}{2(1-\rho^2)}[\frac{(x-\mu_X)^2}{\sigma_X^2}+\frac{(y-\mu_Y)^2}{\sigma_Y^2}+2\rho\frac{(x-\mu_X)}{\sigma_X}\frac{(y-\mu_Y)}{\sigma_Y}])$$

- With $\mu_X, \mu_Y, \sigma_X^2, \sigma_Y^2, \rho \in \mathbb{R}$ and $-\infty \lt \mu_X \lt \infty$, $-\infty\lt\mu_Y\lt\infty$, $\sigma_X\gt0$, $\sigma_Y\gt 0$ and $-1 \lt \rho \lt 1$
- $exp(z)=e^z$

### Simple Linear (Regression) Model (SLM)
- Given a bivariate $rv$, $(X, Y)$, the simple linear regression model is:
$$Y \mid x = \beta_0 + \beta_1x + \epsilon \mid x$$
- $x$ is known as the **explanatory** / regressor, exogenous, predictor, input variable, or covariates
- $y$ is known as the **response** / regressand / endogenous / measured / output / outcome / criterion variable
- $\beta_0$ is known as the intercept, sometimes called $\alpha$
- $\beta_1$ is known as the slope (sometimes juts called $\beta$)
- $\epsilon$ is known as the error component/term, a random variable

Where:
1. $E[\epsilon \mid x] = 0$
2. $Var[ \epsilon \mid x] = \sigma^2$

The **explained term**, $B_0+B_1x$, is the contribution to the response variable due to its linear dependence on the explanatory variable.

The **unexplained term**, $\epsilon \mid x$, is the idiosyncratic error. The contribution to the response variable due to other unaccounted sources (both known & unknown).

For an SLM, we assume that the values of the explanatory variables are given or known and are measured without errors, thus the SLM is a **conditional** model, that is a model for the response conditional on the value of the explanatory, (i.e. $Y \mid x$).

#### Statistical Properties of SLM
- Given a value of $x$, it follows:
$$\mu_{Y \mid x} = E[Y \mid x] = E[ \beta_0 + \beta_1x + \epsilon \mid x] = E[\beta_0 + \beta_1x \mid x]+E[\epsilon \mid x] = \beta_0 + \beta_1x$$
<center> and </center>
$$\begin{align}
\sigma^2_{Y \mid \epsilon} &= Var[Y \mid x] \\
&= Var[\beta_0 + \beta_1x + \epsilon \mid x]\\
&= Var[\beta_0 + \beta_1x \mid x] + Var[\epsilon \mid x] + 2Cov[\beta_0 + \beta_1x,\epsilon|x]\\
&= \sigma^2
\end{align}$$

- Given $X = x$, the response variable is randomly distributed around the value $B_0 + B_1x$ and the variance of this is the same for all $x$.

**Intercept**: If the range of the explanatory variables includes 0, then this is the conditional mean of the response variable when $X=0$. If the range of the explanatory variable does not include 0, below is just a mathematical interpretation.

$$E[ Y \mid X = 0] = \beta_0 + \beta_1(0) = B_0$$
**Slope**: the change in the conditional mean of $Y \mid x$ per unit change in $x$.
$$E[Y\mid X = (x+1)] = \beta_0 + \beta_1(x+1) = \beta_0+B_1x+B_1$$
The **intercept** and **slope** are called the **regression coefficients**.

**Error variance** ($\sigma^2$): This controls ohw the value of $Y$ are spread around the value $B_0+B_1x$ for a fixed value of $x$.


The regression coefficients and the error variance are the model parameters.

#### Additional Assumptions
- Given two values of the explanatory variables, $x_i\quad\&\quad x_j$, assume the corresonding error terms are uncorrelated (i.e. $Cov[\epsilon_i,\epsilon_j \mid x_i, x_j] = 0$)
$$\begin{align}
Cov[Y_i,Y_j \mid x_i,x_j] &= Cov[\beta_0+\beta_1x_i+\epsilon_i,\beta_0+\beta_1x+\epsilon_j\mid x_i,x_j] \\
&= Cov[\beta_0 + \beta_1x, \beta_0+\beta_1x_j \mid x_i, x_j] + Cov[B_0 + B_1x_i, \epsilon \mid x_i,x_j] \\
&+ Cov[\epsilon_i,\epsilon_j \mid x_i,x_j] \\
&=0
\end{align}$$
$Cov[\epsilon_i,\epsilon_j \mid x_i, x_j]$ in this case, this expression is assumed to be 0 because the response variables $Y_i \& Y_j$ are uncorrelated.

### Estimation using Simple Linear Regression Models
- Given a bivariate data set $(x_i,y_i) i=1,\cdot\cdot\cdot,n,$ to fit the SLM it is desired to obtain estimates of $\beta_0, \beta_1$ (and $\sigma^2$ if one wishes to do inference: hypothesis tests, confidence intervals, etc.)
- One estimator of the regression parameters are the least squares estimates. The LSEs of the regression coefficients are given by the following equations:
$$(\hat\beta_0, \hat\beta_1) = \text{argmin}_{(\beta_0,\beta_1)\in\mathbb{R}^2}S(\beta_0,\beta_1)$$ where we have:
$$S(\beta_0,\beta_1) = \sum_{i=1}^n(y_i-(\beta_0+\beta_1x_i))^2$$

-- Page 12