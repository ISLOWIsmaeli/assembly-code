ORG 100H   ;standard for writing 8086 programs

; Load the first number from memory address 1000H into AL
MOV SI, 1000H  ; Set SI to point to offset 1000H
MOV [SI],011H  ; store value in SI memory
MOV AL, [SI]   ; Load the value at [SI] into AL

; Load the second number from memory address 1001H into BL
MOV SI, 1001H  ; Set SI to point to offset 1001H  
MOV [SI],010H  ; store value in SI memory
MOV BL, [SI]   ; Load the value at [SI] into BL

; Add the two numbers
ADD AL, BL     ; Add the value in BL to AL and store in AL

; Load the third number from memory address 1002H into BL
MOV SI, 1002H  ; Set SI to point to offset 1002H
MOV [SI],022H  ; store a number in the 1002H offset pointer
MOV BL, [SI]   ; Load the value at [SI] into BL

; Perform an OR operation between the result in AL and the value in BL
OR AL, BL      ; OR the value in BL with AL

; Store the final result at memory address 1100H
MOV SI, 1100H  ; Set SI to point to offset 1100H
MOV [SI], AL   ; Store the value in AL at [SI]

RET            ; Return from the program
