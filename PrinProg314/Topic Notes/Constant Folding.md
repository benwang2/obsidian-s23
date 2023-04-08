Constant folding is an optimization pass that 'folds' a basic arithmetic operation into a single instruction. For example, we have the instructions below.

### Explanation
```R (ISC)
loadI 5 => r4  
loadI 7 => r5
add r4, r5 => r6
```

The 'add' instruction is very simple because it loads 5 + 7 into r6. Constant folding optimizes this code by changing this code to

``` R (ISC)
loadI 5 => r4  
loadI 7 => r5
loadI 12 => r6
```

Constant folding optimizes the following basic arithmetic operations:
- add
- sub
- mul

but not `div` due to it's floating point nature.
The additional instructions `loadI 5 => r4` and `loadI 7 => r5` are not removed because they could be used in other instructions.

### Examples
**Pre-optimization**
```R (ISC)
loadI 5 => r4  
loadI 7 => r5
add r4, r5 => r6
```

**Optimized**
``` R (ISC)
loadI 5 => r4  
loadI 7 => r5
loadI 12 => r6
```
