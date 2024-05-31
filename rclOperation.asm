;RCL D, COUNT rotate left through carry
MOV AX, 1234H
STC ;set carry flag
MOV CL, 01H
RCL AX,CL