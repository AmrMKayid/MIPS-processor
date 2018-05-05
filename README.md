# MIPS Processor Architecture

The MIPS architecture designed with verilog hardware modeling language.

## Design and Overview

This Processor was designed according to the MIPS specifications, supporting only a subset of the MIPS instructions. The processor is pipelined; However, hazards produced by executing several instructions in parrallel are not yet handled in the current version, but will be handled in subsequent versions.

#### Supported instructions
1. Add
2. Sub
3. Addi
4. LW
5. SW
6. LH
7. LHU
8. AND
9. OR
10. SLL
11. SLR
12. OR
13. BEQ
14. SLT
15. SLTU

#### Processor Components 
1. Data Memory: Stores the variables and the data of the program
2. Instruction Memory: Stores the instrcuctions to be executed 
3. Multiplexers: Controls the data path.
4. Control Unit: Outputs the control signals for the multiplexers and the ALU.
5. SignExtend: Extends a 16 bit number to a 32 bit according to the appropriate sign.
6. Adder.
7. Program Counter: Register that stores the address of the current instruction. 
8. RegisterFile: Contains 32 Register for performing operations.
9. shiftLeft2.
10. ALU 
11. ALUControl: control signals that specifies the correct operation for the ALU. 
12. processor: The actual MIPS processor.


For detailed information about these instructions visit [MIPS Instruction Reference](http://www.mrc.uidaho.edu/mrc/people/jff/digital/MIPSir.html)

## Dependencies: 
For this project it is highly recommended to use iverilog and vvp for compilation and simulation.

## Getting started

This section will explain how to build the processor and how to run a program on this MIPS processor.

#### Create a program 
First you will need to write a program in MIPS assembly that uses only the specified instructions. After writing the program you will need to assemble it to hexadecimal machine code. For examples: see the folders **Mips** and **programs** We suggest using [MARS assembler](http://courses.missouristate.edu/kenvollmar/mars/). Now follow these instructions: 

1. Add the assembled hexedecimal file in the **programs folder**.
2. Navigate your way to the tests folder and open **Processor_tb.v** file.
3. Find the line where it says `$readmemh("program/file_name.bin", mips.IM.memory);` replace the file_name with the file name of your hexadecimal file.

Note: Almost any program can be written and executed using the provided instructiosn set.

#### Compile the processor

###### In case you are on a unix enviroment you will just need to the run the following command
`make processor`

##### On window: 
`iverilog -o processor *.v tests/Processor_tb.v`

These commands should create the following file "**processor**"

#### Simulate the Execution: 
Run the following command to begin the simulation: 
`vvp processor`
 
