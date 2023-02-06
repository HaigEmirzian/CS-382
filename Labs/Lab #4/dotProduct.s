//Pledge: I pledge my honor that I have abided by the Stevens Honor System.
//Name: Haig Emirzian

.text
.global _start

_start:                 //Starts the program
    ADR X0, vec1        //Loads vec1 label into X0
    ADR X1, vec2        //Loads vec1 label into X2
    LDUR X2, [X0]       //Loads vec1[0] into X1
    LDUR X3, [X1]       //Loads vec2[0] into X3
    MUL X4, X2, X3      //Multiplies vec1[0] and vec2[0] into X4
    ADD X0, X0, #8      //Adds int 8 to X0 for vec1[1] offset
    ADD X1, X1, #8      //Adds int 8 to X1 for vec2[1] offset
    LDUR X2, [X0]       //Loads vec1[1] into X1
    LDUR X3, [X1]       //Loads vec2[1] into X3
    MUL X3, X2, X3      //Multiplies vec1[1] and vec2[1] into X3
    ADD X4, X4, X3      //Adds [0] product with [1] product
    ADD x0, x0, #8      //Adds int 8 to X0 for vec1[2] offset
    ADD X1, X1, #8      //Adds int 8 to X1 for vec2[2] offset
    LDUR X2, [X0]       //Loads vec1[2] into X2
    LDUR X3, [X1]       //Loads vec2[2] into X3
    MUL X3, X2, X3      //Multiplies vec1[2] and vec2[2] into X3
    ADD X4, X4, X3      //Adds [0], [1], and [2] products 
    ADR X5, dot         //Loads dot label in X5
    MOV X5, X4          //Moves the dot product into X5
    MOV x1, X5          //Moves the dot product into X1
    MOV X0, #0          //Exit
    MOV X8, #93
    SVC #0

.data

vec1:   .quad 10, 20, 30
vec2:   .quad 1, 2, 3
dot:    .quad 0 

.end
