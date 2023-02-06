//Name: Haig Emirzian
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
                        //X3 stores p1[0] X5 stores p1[1]
                        //X6 stores p2[0] X8 stores p2[1]
                        //X9 stores p3[0] X11 stores p3[1]

_start:                 //Starts the program
    ADR X0, p1          //Loads p1 label into X0
    ADR X1, p2          //Loads p2 label into X1
    ADR X2, p3          //Loads p3 label into X2

                        //Gets x and y from p1
    LDUR X3, [x0]       //Loads p1[0] into X3
    ADD X4, X0, #8      //Adds 8 to X0 to get p1[1]
    LDUR x5, [X0]       //Loads p1[1] into X5

                        //Gets x and y from p2
    LDUR X6, [x1]       //Loads p2[0] into X6
    ADD X7, X1, #8      //Adds 8 to X1 to get p2[1]
    LDUR x8, [X0]       //Loads p2[1] into X8  

                        //Gets x and y from p3
    LDUR X9, [x2]       //Loads p3[0] into X9
    ADD X10, X2, #8     //Adds 8 to X2 to get p3[1]
    LDUR x11, [X2]      //Loads p3[1] into X11  

                        //Find the distance of a
    SUB X12, X8, X5     //p2[1] - p1[1] = X12
    SUB X13, X6, X3     //p2[0] - p1[0] = X13
    MUL X14, X12, X12   //X12 squared and stored in X14
    MUL X15, X13, X13   //X13 sqaured and stored in X15
    ADD X16, X14, X15   //Distance of a is stored in X16

                        //Find the distance of b
    SUB X12, X8, X5     //p3[1] - p1[1] = X12
    SUB X13, X6, X3     //p3[0] - p1[0] = X13
    MUL X14, X12, X12   //X12 squared and stored in X14
    MUL X15, X13, X13   //X13 sqaured and stored in X15
    ADD X17, X14, X15   //Distance of b is stored in X17

                        //Find the distance of c
    SUB X12, X8, X5     //p3[1] - p2[1] = X12
    SUB X13, X6, X3     //p3[0] - p2[0] = X13
    MUL X14, X12, X12   //X12 squared and stored in X14
    MUL X15, X13, X13   //X13 sqaured and stored in X15
    ADD X19, X14, X15   //Distance of c is stored in X19

                        //See if b^2 + c^2 = a^2
    ADD X20, X17, X19   //Adds b^2 and c^2
    SUB X23, X20, X16   //Subtracts b^2 + c^2 with a^2
    CBZ X23, equal      //If the difference is == 0, then jump to label equal
                        //Else it will pass
                        

                        //See if a^2 + c^2 = b^2
    ADD X21, X16, X19   //Adds a^2 and c^2
    SUB X24, X21, X17   //Subtracts a^2 + c^2 with b^2
    CBZ X24, equal      //If the difference is == 0, then jump to label equal
                        //Else it will pass

                        //See if a^2 + b^2 = c^2
    ADD X22, X16, X17   //Adds a^2 and b^2
    SUB X25, X12, X19   //Subtracts a^2 + b^2 with c^2
    CBZ X25, equal      //If the difference is == 0, then jump to label equal
    ADR X1, no          //Outputs no label  
    B done              //If not a triangle, then jump to end the program    

                        //Code is executed if legs are equal to hypotenuse
equal:  ADR X1, yes     //Outputs yes label
            
                        

done: MOV X0, #0        //Exits the program
      MOV X8, #93
      SVC #0                  
    

.data
p1: .quad 0, 4
p2: .quad 1, 2
p3: .quad 3, 2
yes: .string "It is a right triangle."
no: .string "It is not a right triangle."

.end
