//Name: Haig Emirzian
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
.extern printf

evaluate:
        SUB SP, SP, #8  //Allocate space on the stack
        STR LR, [SP]    //Store LR in SP
        MOV X12, #0     //i = 0
        MOVI D8, #0     //Index of array

outerLoop: 
        CMP X12, X1     //i <= N
        B.GT outerLoopEnd //If i > N, then branch to end loop
        MOV X13, #0     //j = 0
        FMOV D14, D5    //Use for x^i
        LSL X15, X12, #3 //Left shift i to increment
        LDR D15, [X0, X15]//Loads coeff

innerLoop:
        CMP X13, X12      //j < i
        B.GE innerLoopEnd //If j >= i, then branch to end loop
        FMUL D14, D14, D7 //Multiplies i in x^i to the current index
        ADD X13, X13, #1  //j++
        B innerLoop       //Repeat
innerLoopEnd:
        FMUL D15, D15, D14 //Multiplies coeff and x
        FADD D8, D8, D15   //Adds all the products
        ADD X12, X12, #1   //i++
        B outerLoop        //Branch to outerloop

outerLoopEnd: 
        LDR LR, [SP]    //Loads the SP into the SP
        ADD SP, SP, #8  //Reallocates space onto the stack
        RET             //Returns
                         
bisection:              
        SUB SP, SP, #8   //Allocate space on the stack
        STR LR, [SP]     //Store LR in SP
while:  FADD D7, D2, D3  //a + b
        FDIV D7, D7, D6  //(a + b) /2
        BL evaluate      //Branch to evaluate procedure
        FMUL D9, D8, D8  //Finds absolute value of f(midpoint)
        FCMP D9, D4      //Compares f(midpoint)^2 and tolerance^2
        B.LT lessThan    //If less than, then branch to lessThan
        FMOV D10, D7     //Preserves midpoint 
        FMOV D11, D8     //Preserves f(midpoint)
        FMOV D7, D2      //a -> f(a)
        BL evaluate      //Evaluate f(a)
        FMUL D8, D8, D11 //f(a) * f(midpoint)
        FCMP D8, #0      //Compares f(a)*midpoint and 0
        B.LT shiftB     //If less than, then shift B
               

shiftA: FMOV D2, D10    //Moves midpoint to a
        B while         //Branch to while

shiftB: FMOV D3, D10    //Moves midpoint to b
        B while         //Branch to while

lessThan: FMOV D0, D7   //Moves midpoint to print
        FMOV D1, D8     //Moves f(midpoint) to print
        LDR LR, [SP]   //Loads SP into LR
        ADD SP, SP, #8  //Reallocates stack
        RET             //Returns to main

_start:                 //Starts the program
        ADR X0, coeff   //Initializes coeff label
        ADR X1, N       //Initializes N label
        ADR X2, a       //Initializes a label
        ADR X3, b       //Initializes b label
        ADR X4, tolerance //Initializes tolerance label
        ADR X5, one     //Initializes one label
        ADR X6, two     //Initializes two label
        LDR X1, [X1]    //Loads N into X1
        LDR D2, [X2]    //Loads a into D2
        LDR D3, [X3]    //Loads b into D3
        LDR D4, [X4]    //Loads tolerance into D4
        FMUL D4, D4, D4 //Tolerance^2 to check if f(midpoint)^2 is less than
        LDR D5, [X5]    //Loads one into D5
        LDR D6, [X6]    //Loads two into D6

        BL bisection    //Calls the function

        ADR X0, str     //Initializes str to print
        BL printf       //Prints results

        MOV X0, #0      //Exits the program
        MOV X8, #93
        SVC #0                  
    

.data
coeff:  .double 5.3, 0.0, 2.9, -3.1
N:      .dword 3
a:      .double -1
b:      .double 4
tolerance:      .double 0.001
one:    .double 1.0
two:    .double 2.0
str:    .string "X0: %lf\nf(X0): %lf\n"

.end
