---
title: Lecture Notes 3
course: CS_314
date: 2023-01-24
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture 3</h1></center>

## Regular Expressions
| RE $r$     | Language $L(r)$                                                        |
| ---------- | ---------------------------------------------------------------------- |
| $a$        | $\{a\}$                                                                |
| $\epsilon$ | $\{\epsilon\}$                                                         |
| rs         | $\{rs \vert r \in L(r), s \in L(s)\}$                                  |
| $r^+$      | $L(r) \cup L(rr) \cup L(rrr) \cup \cdot\cdot$                          |
| $r^*$      | $\{\epsilon\} \cup L(r) \cup L(rr) \cup L(rrr) \cup \cdot\cdot\cdot\}$ |
| $r$ \| s   | L(r) $\cup$ L(s)                                                    |
| $(s)$      | $L(s)$                                                                 |

All regular expresions are left-associative in order of increasing precedence.

### Recognizers
