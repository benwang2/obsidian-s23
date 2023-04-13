Assume that lexical scoping is used.
```c
program main(){
	int a, b;  // (1, 1), (1,2)
	procedure f(){
		int c; // (3, 1)
		procedure g(){  
			... = b + c // (2, 2) + (3, 1) ... POINT A
			print a,b,c;
			end g;
		}  
		a = 0; c = 1;  // (2,  1) = 0; (3, 1) = 1;
		... = b + c // (2, 2) + (3, 1) ... POINT A
		call g();  
		print c;  
		end f;  
	}  
	procedure h(){
		int a, b; // (2, 1), (2, 2)
		a = 3; b = 7;  
		call f();  
		print a,b;
		end g;  
	}
	a = 2; b = 3;  
	print a,b;  
	call h();  
	print a,b;  
	end main;  
}
```

At point A, the ILOC RISC code might look like this:
```C
loadAI r0, -4 => r1 // Get access link (offset for proc f)
loadAI r1, -4 => r2 // Get access link (offset for proc h)
loadAI r2,  8 => r3 // Get second variable in h (b = 7)
loadAI r1,  4 => r4 // Get first variable in f (c = 1)
add    r3, r4 => r5
```

and at point B, the ILOC RISC could would look like:
```C
loadAI r0, -4 => r1 // Get access link (offset for proc h)
loadAI r1,  8 => r2 // Get second variable in h (b = 7)
loadAI r0,  4 => r3 // Get first variable in f (c = 1)
add    r2, r3 => r4
```