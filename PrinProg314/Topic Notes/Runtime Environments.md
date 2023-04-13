Runtime environments has to do with how the code finds non-local data at run-time.

### Real globals
- visible *everywhere*
- translated into an address at compile time

### Lexical scoping
- view variables as (level, offset) pairs (**compile-time symbol table**)
- look-up of (level,offset) pair uses chains of access links (**at run-time**)
- optimization to reduce access cost: display

### Dynamic scoping
- variable names must be preserved  
- look-up of variable name uses chains of control links (at  
run-time)  
- optimization to reduce access cost: reference table