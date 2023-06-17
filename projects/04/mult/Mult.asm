// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    @R2
    M=0
    @i
    M=0
(LOOP)
    @i
    D=M //get i

    @R1
    D=D-M //get i - r1

    @END
    D;JEQ //if i - r1 == 0, jump to end

    @i
    D=M+1 //d = i + 1
    M=D //i = i + 1

    @R0
    D=M //d = r0
    @R2
    D=D+M //d= r2 + r0
    M=D // r2 = r2 + r0

    @LOOP
    0;JMP

(END)
    @END
    0;JMP



