---
title: Lecture Notes 9
course: CS_314
date: 2023-02-14
tags: 
- lectureNotes
- CS_314
---

<center><h1>Lecture 9</h1></center>
## Parsing
Using a parse table, a predictive parser can create a parse generator system.

**Recursive Descent Parsing**

```c
void proc_S {
	switch token {
		case a: /* S -> aSb */
			token = next_token();
			proc_S();
			if (token == b){
				token = next_token()
			} else {
				throw(err);
			}
		case b:
		case eof:
	}
	return otherwise; /* error */
}
```
