---
title: Lecture Notes 5
course: CS_314
date: 2023-01-31
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture 5</h1></center>

## Context Free Grammars (CFG)
- A formalism for describing languages
- Rewrite systems with restrictions on the structure of rewrite (production) rules that can be used
- CFGs are a quadruple $<T, N, P, S>$
	1. A set $T$ of terminal symbols (token), on the left hand-side
	2. A set $N$ of nonterminal symbols
	3. A set $P$ production rules
	4. A special start symbol $S$

For example, we have
$N={A,B,C,}$ and $T={a,b,c}$

All productions in $P$ have the following structure:
$X \to Y$ where
- $X \in N$ (single non-terminal symbol) and
- $Y \in (N|T)*$ (any combination of terminals and non-terminals, including $\epsilon$)

$A \to Ab$ is a CFG, whereas $aA \to Ab$ is a context sensitive grammar (CSG), where $a$ is a "left context".

### Derivation
Given a CFG $G$, the language $L(G)$ is the set of sentences $w \ in T^*$ which can be derived from the unique start symbol $S$ in finitely many rewrite steps:
$$ L(G) = \{w \in  T^* | S \Rightarrow^* w\}$$

The entire sequence of rewrite steps is called a **derivation**, denoted as $\Rightarrow$, means 0 or multiple rewrite steps.

To make a **derivation** "more systematic", an order on rule applications is improvised.

We have the rules:
- **rightmost derivation**, denoted as $\Rightarrow_R$: always replace the rightmost non-terminal symbol next
- **leftmost derivation**, denoted as $\Rightarrow_L$: always replace the leftmost non-terminal symbol next

### BNF Grammar
**Terminals**: Letters, digits, :=
**Nonterminals**: \<letter> \<digit> \<identifier> \<stmt>
**Productions**:
1. \<letter> ::= A | B | C | ... | Z
2. \<digit> ::= 0 | 1 | 2 | .. | 9
3. \<identifer> ::= \<letter> | \<identifier> \<letter> | \<identifier> \<digit}
4. \<stmt> ::= \<identifier> := 0
**Start symbol**: \<stmt>

BNF is a convenient way to specify CFGs, i.e. without using the quadruple $<T,N,P,S>$ formulation.

**BNF**: A formal notation for describing a context-free grammar.

- Terminal symbol: **Symbol-In-Boldface**
- Non-terminal symbol: Symbol-in-angle-brackets
- Production rule:
	Nonterminal ::= Sequence of Symbols, or
	Non-terminal ::= Sequence | Sequence | ...
- Alternative symbol: |
- Empty string: $\epsilon$

## Parsing Grammar
We can write a program, called a **parser for L(G)**, that given an input string of terminal symbols (tokens) can construct a derivation (leftmost or rightmost) for the input using rules in G? If a derivation exists does not exist, then the machine reports an error.

We will discuss **recursive descent parser.==**

Many grammars can correspond to a single programming language, however good grammars will:
- capture the logical structure of the language
- use meaningful names,
- be easy to read
- be unambiguous if we want to attach meaning to structure
- suitable for different parsing strategies (LL(k), LR(k), LALR(1))

#### Ambiguity in grammars
A grammar $G$ is ambiguous if and only if there exists a $w \in L(G)$ such that there are:
1. two distinct parse trees for $w$,
2. two distinct leftmost derivations for $w$, or
3. two distinct rightmost derivations for $w$

We want a unique semantics of our programs, which typically requires a unique syntactic structure.

**How can we deal with ambiguity?**
1. Change the language to include **delimiters**
2. Change the grammar to impose **associativity** and **precedence*