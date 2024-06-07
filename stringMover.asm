;Write 8086 assembly language code block to move a string from offset 2000h to offset 4000h where the length of the string is 0DH. Also illustrate any change in the flag status
   ; Initialize the data segment
MOV AX, 2000H  ; Source segment
MOV DS, AX

MOV AX, 4000H  ; Destination segment
MOV ES, AX

; Set up source and destination pointers
MOV SI, 2000H  ; Source index
MOV DI, 4000H  ; Destination index

; Set the length of the string to be moved
MOV CX, 0DH    ; Number of bytes to move

; Ensure direction flag is clear for forward movement
CLD            ; Clear direction flag (DF = 0)

; Use REP MOVSB to move the string
REP MOVSB   
HLT

; Check the flag status after the operation
; DF should be 0 as we cleared it
; ZF, SF, CF, etc. are not affected by MOVSB
