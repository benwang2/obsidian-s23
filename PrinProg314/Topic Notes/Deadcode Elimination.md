Deadcode elimination is an optimization pass that removes any instructions that do not contribute to the output of the program.

In the constant folding pass, references to the registers `r4` and `r5` are lost. If these registers are not used in any other instruction that contribute to the output, then they will be removed in a deadcode elimination pass.

![[Constant Folding#Examples]]

In the strength reduction pass, references to the register `r4` are lost. Assuming it's not used anywhere else in the program that contributes to the output, it will be removed in the deadcode optimization pass.
![[Strength Reduction#Examples]]