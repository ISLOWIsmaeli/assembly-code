ORG 100H

START:
    MOV SI, 1200H  ; SI points to the start of the 16-bit numbers
    MOV CX, 8      ; Counter for loop, 8 numbers to add

    ; Initialize the sum to zero
    XOR AX, AX      ; Clear AX (AX will store the sum)

ADD_LOOP:
    ADD AX, [SI]   ; Add the value at SI to the sum in AX
    ADD SI, 2      ; Move to the next 16-bit number
    LOOP ADD_LOOP  ; Repeat the addition for all 8 numbers

    ; Perform an AND operation with 8888H
    AND AX, 8888H  ; Perform AND operation with the result

    ; Store the result in memory addresses 1400H and 1401H
    MOV DI, 1400H  ; DI points to the start of the result
    MOV [DI], AX   ; Store the low byte of the result at 1400H
    MOV [DI + 2], AH ; Store the high byte of the result at 1401H

    RET            ; Return from the program
