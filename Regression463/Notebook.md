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

### Random Variables
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

### Probability Mass Function
Probability mass functions are useful mathematical constructs used for describing a discrete *rv*.
For a discrete *rv* $X$, the $pmf$, denoted as $p_X(x)$ is defined as,
$$p_X(x)=Pr(X=x)=Pr(\{o;X(x)=x\})$$
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

### Probability Density Function
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
$$\text{Area under }f_L(l) \text{from a to b} = \text{length of interval} \times \text{height of pdf}$$