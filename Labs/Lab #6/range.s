//Name: Haig Emirzian
//Pledge: I pledge my honor that I have abided by the Stevens Honor System.

.text
.global _start
.extern printf

//Procedure parameters: X0-X7
//Local varibales: X19-X28

range: 
if:   SUB X1, X1, #1    //Decrement ending or current value
      SUB SP, SP, #16   //Allocates space on the stack
      STR LR, [SP]      //Stores the loading register onto the stack pointer
      STR X1, [SP, #8]  //Stores an int in the next space allocated for it

      CMP X1, X0        //Compares the current iteration and ending value
      B.EQ else         //If equal, then go to else
      BL range          //Otherwise loop again

else: ADR X0, outstr    //Intializes outstr label
      LDR X1, [SP, #8]  //Loads the int from the stack
      BL printf         //Prints the int from the stack
      LDR LR, [SP]      //Loads the SP into the LR
      ADD SP, SP, #16   //Adds 16 to increment to the next int in the stack
      RET               //Returns


_start:                 //Starts the program
      ADR X0, starting  //Initializes starting label into X0
      ADR X1, ending    //Initializes ending label into X1
      LDR X0, [X0]      //Loads starting into X2
      LDR X1, [X1]      //Loads ending into X3

      MOV X7, #40       //Allocator for stack pointer
      BL range          //Calls the range recursion
      
      MOV X0, #0        //Exits the program
      MOV X8, #93
      SVC #0                  
    

.data
starting: .quad 10
ending: .quad 15
outstr: .string "%ld\n"

.end
