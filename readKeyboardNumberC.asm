ORG 100H

START:
    MOV DI, 2000H  ; Initialize DI to point to the starting offset address 2000H

READ_CHAR:
    MOV AH, 01H    ; Function 01H: Read character from standard input
    INT 21H        ; Call DOS interrupt
    MOV [DI], AL   ; Store the ASCII value of the character in memory at [DI]
    CMP AL, 0DH    ; Compare the character with carriage return (0DH)
    JE END_READ    ; If carriage return, jump to end of reading
    INC DI         ; Increment DI to point to the next memory location
    JMP READ_CHAR  ; Repeat the process

END_READ:
    RET            ; Return from the program
