;program used to write 5 even numbers in a given memory diagram
MOV AX, 0300H
MOV DS, AX
MOV DI, 0000H
MOV AX, 0000H
MOV CL, 05H
ABC: MOV [DI],AX
INC DI
ADD AX, 02H
LOOP ABC
HLT