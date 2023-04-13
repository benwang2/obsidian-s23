C is an **imperative programming language**, meaning that it:
- is made up of a sequence of state-changing actions
- manipulates an abstract machine with:
	1. variables naming memory locations
	2. arithmetic and logical operations
	3. reference, evaluate, assign operations
	4. explicit control flow statements

### Expressions
Expressions include procedure and function calls and assignments, and thus can have side-effects

### Control structures
Control structures include instructions or code that implement control flow and conditions. In C, these are:
- if statements, with and without else clauses
- loops, with break and continue exits
	- while ( \<expr> ) \<stmt>
	- do \<stmt> while ( \<expr> )
	- for ( \<expr> ; \<expr> ; \<expr> ) \<stmt>
- switch statements
- goto with labelled branch targets

### Data types
C has 4 main classifications for its data types.

#### Primitives
- `char` - Single string tokens, or characters
- `int` - Integers
- `float` - Floating point numbers
- `double` - Double-precision foating point numbers

C does not implement booleans, however any integer greater than 0 is true and 0 is false.

#### Aggregates
- `arrays` - arrays of primitives, structures, of any dimension
- `structures` - any user-defined structures 

```c
char a[10], b[2][10];  

struct point {
	int x;
	int y;
}

struct rectangle {  
	struct point p1;  
	struct point p2;  
}
```

#### Enumerations
Collections of sequence values which are tokenized and assigned to variables. They mainly exist for readability of code.

#### Pointers
Pointers are data types that store addresses that contain values. They 'point' to a value but do not contain the value. 

The syntax is as follows:
- `&i` - address of i  
- `*p` - dereferenced value of p  
- `p+1` - pointer arithmetic

Example code:
```c
int *p, i;    // Create a pointer p and an integer i
p = &i;       // Set pointer p to point at address of i
*p = *p + 1;  // Increase value that p points to by 1
```