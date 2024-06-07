.MODEL SMALL
.STACK 100H
.DATA
    ; No data section needed for this program
.CODE
START:
    MOV AX, 1       ; Initialize AX to 1 (factorial base case)
    MOV CX, 5       ; Example number to find factorial (change this to the desired number)
    
    ; Check if CX is zero
    CMP CX, 0
    JE END_FACTORIAL ; If CX is zero, skip the loop

FACTORIAL_LOOP:
    MUL CX          ; AX = AX * CX
    LOOP FACTORIAL_LOOP ; Decrement CX and loop until CX is zero
    
END_FACTORIAL:
    ; AX now contains the factorial of the number initially in CX
    
    MOV AH, 4CH     ; DOS interrupt to exit program
    INT 21H         ; Call DOS interrupt

END START
