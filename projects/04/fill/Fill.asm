// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//Function listen key enter
(LISTEN)
    @24576
    D=M

    @BLACK
    D;JNE //ram[24576] != 0, jump to black

    @CLEAR
    0;JMP

(AFTER) //after black or clear, return here to listen
    @LISTEN
    0;JMP


//Functon change to black
(BLACK)
    D=-1
    @c
    M=D // set c = -1
    @PROCESS
    0;JMP

//Function change to white
(CLEAR)
    D=0
    @c
    M=D // set c = 0
    @PROCESS
    0;JMP

//Function process the change
(PROCESS)
    @16384
    D=A
    @i
    M=D //i = 16384

    @24576
    D=A
    @j
    M=D //j = 24576

    @c
    D=M //d=c(-1 or 0)
    @tempc
    M=D //tempc = c
    
(LOOP)
    @i
    D=M //d = i
    @j
    D=D-M //d= i - j

    @ENDLOOP
    D;JEQ //if i - j == 0, jump to end loop

    @c
    D=M //d=c(-1 or 0)
    @i
    A=M
    M=D //set RMA[i] = -1 or 0

    @i
    D=M+1
    M=D  // i = i + 1
// ------------ begin: this is add for change in process, option -------------------
    //check if status changed, end process
    @24576
    D=M
    @PRESS
    D;JNE //ram[24576] != 0, keyboard is press
    D=0
    @testc
    M=D // set testc = 0

    @testc
    D=M //d=testc(-1 or 0)
    @tempc
    D=D-M //d = testc -tempc

    @ENDLOOP
    D;JNE //if testc != tempc, jump to end loop

    @LOOP
    0;JMP //loop
(PRESS)
    D=-1
    @testc
    M=D // set c = -1

    @testc
    D=M //d=testc(-1 or 0)
    @tempc
    D=D-M //d = testc -tempc 

    @ENDLOOP
    D;JNE //if testc != tempc, jump to end loop
// ------------ end: this is add for change in process, option -------------------

    @LOOP
    0;JMP //loop
(ENDLOOP)
    @AFTER  //after loop, jump back to listen
    0;JMP


(END)
    @END
    0;JMP