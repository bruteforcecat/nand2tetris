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
(SETUP)
  @8192
  D=A
  @n
  M=D

(LOOP)
  @i
  M=0
  @KBD
  D=M
  @FILL
  D;JNE
  @CLEAR
  D;JEQ
  @LOOP
  0;JMP

(FILL)
  // check if filling is done
  @i
  D=M
  @n
  D=D-M
  @LOOP
  D;JEQ

  @SCREEN
  D=M
  @i
  A=D+M
  M=-1
  @i
  M=M+1
  @FILL
  0;JMP

(CLEAR)
  // check if clear is done
  @i
  D=M
  @n
  D=D-M
  @LOOP
  D;JEQ

  @SCREEN
  D=M
  @i
  A=D+M
  M=-1
  @i
  M=M+1
  @FILL
  0;JMP
