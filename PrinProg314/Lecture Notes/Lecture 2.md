---
title: Lecture Notes X
course: CS_314
date: 2023-01-20
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture 2</h1></center>

**Terminology**
**Syntax**: Describes what a legal program looks like
**Semantics**: Describes what a correct (legal) program means
**Formal language**: a possibly infinite set of sentences (finite sequences of symbols) over a finite alphabet of $\Sigma$ of terminal symbols: $L \subseteq \Sigma^*$
**Regular expression**: 
**Computation**: A way of manipulating syntax that follows a finite set of rules defined by the language.

## What is a Compiler?
A compiler generates machine code based on the syntax.

At the front end of a compiler, we find the **scanner** and the **parser**.
The **parser** acts as a syntax and semntic analyzer, and as an **intermediate language** code generator. It is a **syntax-directed** translator.

The responsibilities of the front end are:
- recognize legal programs
- report errors
- produce intermediate language
- preliminary storage map
- shape the code for the back end

### Language Analysis
The syntax of programming languages is often defined in two layers: *tokens* and *sentences*.
- A **token** is the most basic unit of the language. Tokens are defined by *regular expressions*.
- A **sentence** is a legal combination of *tokens* in the language. Sentences can be validated using context-free grammars (e.g. Backus-Naur / BNF)
- Context free grammars distinguish what kind of sentence of tokens are valid.

#### Steps in language analysis
1. **Lexical analysis**: Converts source code into a sequence of tokens
2. **Syntax analysis**: Structures tokens into parse tree.

Two issues in **Formal Languages**:
- Language **Specification** $\rightarrow$ we use **formalism** to describe what a valid program (sentence) looks like.
- Language **Recognition** $\rightarrow$ formalism to describe a machine and an algorithm that can verify that a program is valid or not

Regular expression is used for lexical analysis, which can be implemented using a finite state machine.

Context free grammar is used for syntax analysis, which can be implemented using **push-down automata**, or a stack machine.

Regular Expression $\rightarrow$ Generator  $\rightarrow$ Finite State Machine $\rightarrow$ Scanner
Context Free Grammar $\rightarrow$ Generator $\rightarrow$ Push-down Automata 

#### Example of Syntactic Replacement

<div align="center"><b>Rewriting</b> "game"</center>
$$\begin{align}
\text{Rule 1} && \$1  &\Rightarrow 1\& \\
\text{Rule 2} && \$0 & \Rightarrow 0\$ \\
\text{Rule 3} && \&1 & \Rightarrow 1\$ \\
\text{Rule 4} && \&0 & \Rightarrow 0\& \\
\text{Rule 5} && \$\# & \Rightarrow \rightarrow A \\
\text{Rule 6} && \&\# & \Rightarrow \rightarrow B \\
\end{align}$$

Say, our input is a sequence of characters starting with $ and ending with #, and any combination of **0**s and **1**s inbetween.

For the input, $\$0110\#$, we can apply the rules to perform syntactic replacements.

$$\begin{align}
\$0110\# & \Rightarrow \text{Rule 2} \\
0\$110\# & \Rightarrow \text{Rule 1} \\
01\&10\# & \Rightarrow \text{Rule 3} \\
011\$0\# & \Rightarrow \text{Rule 2} \\
0110\$\# & \Rightarrow \text{Rule 5} \\
0110 & \rightarrow A
\end{align}$$
Ideally, a language will have a singular normal form that will be obtained upon termination of syntactic replacements.



# Interpreter
What is an interpreter? An interpreter "interprets" code and returns a value upon termination.


