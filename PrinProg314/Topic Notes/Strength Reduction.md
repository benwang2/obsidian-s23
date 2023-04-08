Strength reduction is an optimization pass that optimizes multiplication and division operations where applicable. It converts 'strong' multiplications and divisions with bit shift operations which are 'weaker' operations that run quicky.

This optimization is performed where there is a multiplication/division instruction with the  divisor or the multiplicator is a power of 2.

### Explanations
For example, the following division operation
```R (ISC)
loadI 80 => r3
loadI 16 => r4
div r3, r4 => r5
```

could be optimized to
```R (ISC)
loadI 80 => r3
loadI 16 => r4
rshiftI r3, 4 => r5
```

because $2^4 = 16$.

and the following multiplication operation
```R (ISC)
loadI 7 => r3
loadI 8 => r4
mul r3, r4 => r5
```

could be optimized to
```R (ISC)
loadI 7 => r3
loadI 8 => r4
lshiftI r3, 3 => r5
```

because $2^3 = 8$.

### Examples

###### Multiplication
**Pre-optimization**
```R (ISC)
loadI 7 => r3
loadI 8 => r4
mul r3, r4 => r5
```
**Optimized**
```R (ISC)
loadI 7 => r3
loadI 8 => r4
lshiftI r3, 3 => r5
```

###### Division
**Pre-optimization**
```R (ISC)
loadI 80 => r3
loadI 16 => r4
div r3, r4 => r5
```
**Optimized**
```R (ISC)
loadI 80 => r3
loadI 16 => r4
rshiftI r3, 4 => r5
```
