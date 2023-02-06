//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Name: Haig Emirzian

.text
.global _start

_start:
        MOV X3, #10         //multiple used later
        MOV X9, #0          //counts

convert:MOV X0, #0          //fd == 0
        ADR X1, buff        //Load input
        MOV X19, X1         //temp
        MOV X2, #1          //read call
        MOV X8, #63         //read call
        SVC #0              //read call       
        LDR X4, [X1]        //loads current char into X4
        CMP X4, #10         //see if X4 is a null terminator
        B.EQ square         //if equal to the null terminator, then square the input
        SUB X4, X4, #48     //subtracts digit for ascii process
        MUL X5, X5, X3      //multiplies current value by 10 
        ADD X5, X5, X4      //adds the value to the one's digit
        B convert           //loops
        
square: MUL X5, X5, X5      //squares the input
        MOV X13, X5         //temp
        B convertBack       //branches to convert back into a string


convertBack:    ADD X9, X9, #1          //increments
                UDIV X5, X13, X3        //unsigned division of temp and 10
                MUL X20, X5, X3	        //10 * X5
                SUB X21, X13, X20	//subs previous instruction from temp
                ADD X21, X21, #48	//starting ascii		        
                STR X21, [X1]           //stores input
                CMP X5, #0              //compares value with null
                B.EQ print              //if equal then go to print

                ADD X1, X1, #1          //increments
                MOV X13, X5             //stores value in X13
                B convertBack           //loop

print:  MOV X0, #1          //fd == 1
        MOV X2, #1          //write call
        MOV X8, #64         //write call
        SVC #0              //write call
        SUB X1, X1, #1      //decrementing
        SUB X9, X9, #1      //decrementing
        CMP X9, #0          //if not 0
        B.NE print          //go to print
        
        
exit:   MOV X0, X5          //move it to X0
        MOV X0, #0          //exits the program
        MOV X8, #93
        SVC #0

.bss
    buff: .skip 100

.end
