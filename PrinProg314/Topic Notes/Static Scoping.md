Also known as **lexical scoping**.
- Non-local variables are associated with declarations at compile time  
- Find the smallest block syntactically enclosing the reference and containing a declaration of the variable

Most languages are **lexically scoped**, because lexical scoping is intuitive.

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

With lexical scoping, we determine at compile time which `x` we are referring to based on the static, lexical structure of the program source code. The innermost definition of `x` in scope when **defining** `b` is `x1`, and so the write in question resolves to `x1`, and that's where `x = 2` writes, so we print `2` upon running this program.