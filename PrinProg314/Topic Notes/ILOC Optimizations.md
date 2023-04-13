ILOC optimizations reduce the amount of RISC instructions in a compiled RISC program. There are various ILOC optimizations, but the ones that were taught are:
- [Constant folding](Constant%20Folding.md)
- [Strength reduction](Strength%20Reduction.md)
- [Deadcode elimination](Deadcode%20Elimination.md)

These passes are all **peephole optimizations**, utilizing a window size of 3 instructions or less regardless of the size of the pattern they optimize.