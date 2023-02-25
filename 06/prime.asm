// HACK assembly program:
// Prime number checker
// By Roy Simanovich, and Shanny Abid.
// This program checks if the number in RAM[R0] is a prime and stores the answer in RAM[R1].

// First prime is 2.
@2
D=A

@div
M=D

(CHECKPRIME)
	@R0
	D=M

	@tester
	M=D

(LOOP)
	@div
	D=M

	@tester
	MD=D-M

	@LOOP
	D;JGT

	@FACTORFOUND
	D;JEQ

	// This isn't our factor, continue the search
	@div
	MD=M+1

	@divmufac
	D=M

// This section handles the part of "is factor<=sqrt(R0)?".
// As we don't need to check factor bigger than sqrt(n) to see if n is prime number.
(MULOOP)
	@div
	D=M

	@divmures
	D=M+D

	@divmufac
	MD=M-1

	@MULOOP
	D;JGT

	@divmures
	D=M

	@R0
	D=M-D

	@CHECKPRIME
	D;JGE

	@R1
	M=1

	@END
	0;JMP

// In-case we found a factor, thus RAM[R0] isn't prime!
(FACTORFOUND)
	@R1
	M=0

// End the program.
(END)
	@END
	0;JMP