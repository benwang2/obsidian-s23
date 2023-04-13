The **scope** of a name binding (an association of a name to an entity, such as a variable) is the part of a program where the name binding is valid; that is, where the name can be used to refer to the entity. In other parts of the program, the name may refer to a different entity (it may have a different binding), or to nothing at all (it may be unbound).

There are two scoping styles
- [[Static Scoping]] - takes name binding in smallest syntax block enclosing the reference
- [[Dynamic scoping]] - finds most recent currently active run-time stack frame
containing a declaration of the variable