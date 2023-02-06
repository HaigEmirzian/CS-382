#Pledge: I pledge my honor that I have abided by the Stevens Honor System.
#Name: Haig Emirzian

def assembler():
    #File being converted to an image file
    file = 'simpleInstructions.s'

    #Reads from file
    with open(file, 'r') as file:
        read = file.readline()
        result = []
        convert = 0
        #Ends reading at .end 
        while(read != '' and read != 'FIN'):
            inst = read[0:3]
            if(inst == 'LDR' or inst == 'ldr' or inst == 'Ldr'):
                convert = (int(read[4:6])) << 2
                convert += (int(read[8]))
                #Adds a 0 to the hex conversion if it's just one nibble and makes it two nibbles
                if len(hex(convert)[2:4]) == 1:
                    result.append('0' + hex(convert)[2:4])
                else:
                    result.append(hex(convert)[2:4])
            #Add operation
            if (inst == 'ADD' or inst == 'add' or inst == 'Add'):
                convert = 64
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            #Sub operation
            if (inst == 'SUB' or inst == 'sub' or inst == 'Sub'):
                convert = 128
                convert += (int(read[5]) << 4)
                convert += (int(read[8]) << 2)
                convert += (int(read[11]))
                result.append(hex(convert)[2:4])
            read = file.readline()
        file.close()
    
    name = 'result.txt'
    #Writes to file
    with open(name, 'w') as file:
        hexs = 0
        #Adds space between hex values
        while(hexs != len(result)):
            file.write(result[hexs] + ' ')
            hexs += 1
        file.close()

assembler()
