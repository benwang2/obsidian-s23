---
title: Lecture Notes 7
course: CS_314
date: 2023-02-07
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture 7</h1></center>

## LL(1)

LL(1) states that you must replace a single nonterminal symbol and that the replacement rules must be deterministic.

e.g. if we have that $\text{S} = \text{aS}$, we can not also have that $\text{S} = \text{abS}$.

The parse tree is constructed from the root, expanding **non-terminal** nodes on the tree's frontier following a let-most derivation. Input tokens are read / consumed as the program is parsed. The next non-terminal symbol is replaced by one of its rules. The choice must be **deterministic** and use parts of the input.

### Predictive parsing
> For any two productions $\text{A} ::= \alpha \mid \beta$ with $\alpha \in (T \cup N)*$ and $\beta \in (T \cup N)*$, we would like a distinct way of choosing the correct production to expand.

For $\alpha \in (T \cup N)*$, define the **FIRST**($\alpha$) as the set of tokens that appear as the first token in some stinrg derived from $\alpha$.

That is, $a \in\text{FIRST}(\alpha)$ if and only if $\alpha \Rightarrow^* a\gamma$ for some $\gamma \in (T \cup N)^*$ and $a$ is a token $(a \in T)$, and $\epsilon \in \text{FIRST}(\alpha)$ if and only if $\alpha \Rightarrow^* \epsilon$.

We only consider the $\epsilon$ as a production rule to help capture the case where an $a$ does not exist correctly.

For a non-terminal $A$, define **FOLLOW**($A$) as the set $\alpha \in \text{FOLLOW}(A)$  if and only if $S \Rightarrow^* \alpha Aa\gamma$ fomr some $a,\gamma\in(T\cup N)^*$, $a \in \text{FOLLOW}(A)$ if and only if 



