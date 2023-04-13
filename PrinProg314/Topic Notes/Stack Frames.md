The stack frame is a run-time stack that contains 'frames' for the main program and each active procedure.

Each stack frame includes:
1. pointer to stack frame of caller (**control link** for maintenance and dynamic scoping)
2. return address (within calling procedure)
3. mechanism to find non-local variables (**access link** for lexical scoping)
4. storage for parameters, local variables, and final values

When a procedure becomes **active**, a new frame is allocated on the stack. When that procedure finishes and returns, it is popped off the stack frame.

There are two contexts:
- static placement in source code
- dynamic run-time stack context

Each avraible reference must be associated with a single declaration (offset within a stack frame).

Two choices:
1. Use static and dynamic context: *lexical scope*
2. Use dynamic context: *dynamic scope*
