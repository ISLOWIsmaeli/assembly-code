MOV AX, 1234H
MOV BX, 1234H
XOR AX, BX
JZ ABC ;it will go to this label since we expect result to be zero
MOV CX,1234H
HLT

ABC: MOV DX,1234H
HLT 

;JNZ(Z=0) JC(C=1) JNC(C=0)
;JG 'first operand greater than second operand"
;JB 'first operand lower than second operand"
