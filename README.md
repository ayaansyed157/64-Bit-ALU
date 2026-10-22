# Abstract
This lab was performed through the implementation of 4 design source files, arithmetic, logical, and shift with an overseeing control file. The control file is implemented through a structural approach, calling the operations of the 3 separate files. The flow of the project was carried out through if/else and case statements, centered around the Op_Sel input. Through this lab, we were able to upscale an ALU to 64 bits, performing 12 different operations (4 operations per file). Through a VHDL design, the result can be expressed through a schematics and tested with a waveform result, showing the flow of the simulated hardware and software. 

# Implementation 
During implementation, Reg_A, Reg_B, Carry_In and Op_Sel were used as inputs to drive the functionality of the 64-ALU bit design. Setting the Reg_A to our student ID (in a 64 bit format) served as our constant throughout the experiment, as we tested how the values provided from Reg_B and Carry_In affected Reg_A given different operations performed. The operation to utilize was decided by the 4-bit value that was passed into the Op_Sel input, binary 0-3 accessed the arithmetic unit, 4-7 the logical unit, and 8-11 shift unit. These units were separated into distinct files and called in a control file through a structural approach. To show the results of the lab, generated are schematics and waveform diagrams.

#Requirements

<img width="775" height="466" alt="image" src="https://github.com/user-attachments/assets/ffc0227a-7bd0-4473-99f7-95293ef606ec" />

