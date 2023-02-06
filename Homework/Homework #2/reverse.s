//Name: Haig Emirzian
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start

_start:                 //Starts the program
    ADR X1, arr         //Loads array label into X1
    ADR X4, length      //Loads length label into X4
    LDRSH X4, [X4]      //Loading length into X4
    LSL X4, X4, #2      //4 * length
    MOV X2, #1          //Initializes 1 into X2
    SUBS X4, X4, #1     //Decrements length by 1
    MOV X5, #0          //Initializes 0 into X5

reverse:CMP X4, X5      //Compares X4 and X5
    B.LT done           //If less than, then branch to done
    LDRB W7, [X1, X4]   //Loads arr+offset into W7
    LDRB W8, [X1, X4]   //Loads arr+offset into W8
    AND W7, W7, 0x0F    //Bitwise AND for 0x0F and W7 register
    LSL W7, W7, #4       //Left shifts by 4
    AND W8, W8, 0xF0    //Bitwise AND for 0xF0 and W8
    LSR W8, W8, #4       //Right shift by 4
    ORR W9, W7, W8      //Bitwise ORR for W7 and W8
    LDRB W7, [X1, X5]   //Loads arr+offset into W7 register
    LDRB W8, [X1, X5]   //Loads arr+offset into W8 register
    AND W7, W7, 0x0F    //Bitwise AND for 0x0F and W7
    LSL W7, W7, #4      //Left shift by 4
    AND W8, W8, 0xF0    //Bitwise AND for 0xF0 and W8
    LSR W8, W8, #4      //Right shift by 4
    ORR W10, W7, W8     //Bitwise ORR for W7 and W8

    STRB W9, [X1, X5]   //Stores arr+offset into its intended register
    STRB W10, [X1, X4]  //Stores arr+offset into its intended register

    SUBS X4, X4,#1      //Decrements by 1
    ADD X5, X5, #1      //Increments by 1

    B reverse           //Branches to reverse label to loop

done:   MOV X0, #0          //Exits the program
        MOV X8, #93
        SVC #0                  
    

.data
arr: .word 0x12BFDA09, 0x9089CDBA, 0x56788910
length: .word 3

.end
