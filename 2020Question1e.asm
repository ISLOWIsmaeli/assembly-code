.MODEL SMALL
.STACK 100H

.DATA
FILENAME DB 'RESULT', 0
BUFFER   DB 500H DUP(?)

.CODE
START:
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Set interrupt vector for Type 0AH
    CLI
    MOV AX, 0         ; Segment 0 for interrupt vector table
    MOV DS, AX
    MOV WORD PTR DS:[0A * 4], OFFSET INTR_HANDLER
    MOV WORD PTR DS:[0A * 4 + 2], CS
    MOV AX, @DATA     ; Restore data segment
    MOV DS, AX
    STI

    ; Main loop
MAIN_LOOP:
    HLT             ; Halt CPU until an interrupt occurs
    JMP MAIN_LOOP

; Interrupt handler for Type 0AH
INTR_HANDLER:
    CLI             ; Disable interrupts

    ; Copy 500H bytes from 1000:1000 to BUFFER
    MOV AX, 1000H   ; Source segment
    MOV DS, AX
    MOV SI, 1000H   ; Source offset
    MOV ES, SEG BUFFER
    LEA DI, BUFFER  ; Destination buffer
    MOV CX, 500H    ; Number of bytes to copy

COPY_LOOP:
    MOV AL, DS:[SI]
    MOV ES:[DI], AL
    INC SI
    INC DI
    LOOP COPY_LOOP

    ; Write BUFFER to file 'RESULT'
    MOV DX, OFFSET FILENAME
    MOV CX, 500H
    MOV BX, OFFSET BUFFER

    ; Create file
    MOV AH, 3CH     ; DOS function 3CH - Create file
    MOV CL, 0       ; Normal file attribute
    INT 21H
    JC FILE_ERROR   ; Jump if error

    ; Write to file
    MOV BX, AX      ; File handle
    MOV DX, OFFSET BUFFER
    MOV CX, 500H    ; Number of bytes to write
    MOV AH, 40H     ; DOS function 40H - Write to file
    INT 21H
    JC FILE_ERROR   ; Jump if error

    ; Close file
    MOV AH, 3EH     ; DOS function 3EH - Close file
    INT 21H

    STI             ; Enable interrupts
    IRET            ; Return from interrupt

FILE_ERROR:
    MOV AH, 4CH     ; DOS function 4CH - Terminate program
    INT 21H

END START
