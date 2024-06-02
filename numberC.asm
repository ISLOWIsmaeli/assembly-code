ORG 100H

START:
    ; Load the first 16-bit number from addresses 1300H and 1301H into AX
    MOV SI, 1300H
    MOV AX, [SI]

    ; Load the second 16-bit number from addresses 1200H and 1201H into BX
    MOV SI, 1200H
    MOV BX, [SI]

    ; Subtract the second number from the first number
    SUB AX, BX

    ; Store the result temporarily
    MOV DX, AX

    ; Load the third 16-bit number from addresses 1500H and 1501H into AX
    MOV SI, 1500H
    MOV AX, [SI]

    ; Load the fourth 16-bit number from addresses 1400H and 1401H into BX
    MOV SI, 1400H
    MOV BX, [SI]

    ; Subtract the fourth number from the third number
    SUB AX, BX

    ; Add the result of the first subtraction (stored in DX) to the result of the second subtraction
    ADD AX, DX

    ; Store the final result in addresses 1600H and 1601H
    MOV SI, 1600H
    MOV [SI], AX

    RET

; End of program
