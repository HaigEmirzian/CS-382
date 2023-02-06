//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Name: Haig Emirzian

.text
.global _start

_start:
        MOV X3, #10         //multiple used later

convert:MOV X0, #0          //read call
        ADR X1, buff        //read call
        MOV X2, #1          //read call
        MOV X8, #63         //read call
        SVC #0              //read call       
        LDR X4, [X1]        //loads current char into X4
        CMP X4, #10         //see if X4 is a null terminator
        B.EQ exit           //if equal to the null terminator, then exit
        SUB X4, X4, #48     //subtracts digit for ascii process
        MUL X5, X5, X3      //multiplies current value by 10 
        ADD X5, X5, X4      //adds the value to the one's digit
        B convert           //loops
        
    
exit:   MOV X0, X5          //move it to X0
        MOV X0, #0          //exits the program
        MOV X8, #93
        SVC #0

.bss
    buff: .skip 100

.end
