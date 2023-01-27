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

Usually, *rv*s defined on outcomes are such that the outputs are info
