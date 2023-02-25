// HACK assembly program:
// Fibonacci calculator
// By Roy Simanovich, and Shanny Abid.
// This program calculates the RAM[R0] fibonacci number and stores the result in RAM[R1].

// Initialization of all necessary components:
// F(0) = 0
// F(1) = 1
// n = RAM[R0]
// RAM[R1] = 0
@R0
D=M

@n
M=D

@R1
M=0

@F0
M=0

@F1
M=1

// Check if n=1
@FINISH
D-1;JEQ

// Check if n=0
@END
D;JEQ

// Offset for n, since we covered the first two cases
@2
D=M

@n
M=M-D

(LOOP)
	// f(n-2)
	@F0
	D=M

	// f(n) = f(n-2)
	@R1
	M=D

	// f(n) = f(n-1) + f(n-2)
	@F1
	D=M

	@R1
	M=M+D

	// Prepre for next cycle of the loop
	// f(n-2) = f(n-1)
	// f(n-1) = f(n)
	@F1
	D=M

	@F0
	M=D

	@R1
	D=M

	@F1
	M=D

	// n=n-1
	@n
	MD=M-1

	// Check if we reached n=0
	@LOOP
	D;JGT

	// Finish the program
	@END
	0;JMP

// For case of n=1
(FINISH)
	@R1
	M=1

// End program section
(END)
	@END
	0;JMP