MOV AX, 1234H ; store value in AX register
MOV BX, 5678H ; store value in BX register
ADD BX, AX ;  add AX and BX and store in BX (68AC)
ADD BH, 24H ; add 24 to 68 stored in BH (8C) 
HLT