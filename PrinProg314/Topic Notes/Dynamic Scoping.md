- Non-local variables are associated with declarations at run time
- Find the most recent, currently active run-time stack frame containing a declaration of the variable

The runtime state of the program stack determines what variable is being referred to.

```c
program a() {
  x: integer; // "x1" in discussions below
  x = 1;

  procedure b() {
    x = 2; // <-- which "x" do we write to?
  }

  procedure c() {
    x: integer; // "x2" in discussions below
    b();
  }

  c();
  print x;
}
```

With **dynamic scoping**, we have a stack of variable definitions tracked at runtime -- so which `x` we write to depends on what exactly is in scope and has been defined dynamically at **runtime**. Beginning to run `a` pushes `x => x1` onto the stack, calling `c` pushes `x => x2` onto the stack, and then when we get to `b`, the top of the stack is `x => x2`, and so we write into `x2`. This leaves `x1` untouched, and so we print `1` at the end of the program.