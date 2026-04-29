.MODEL SMALL
.STACK 100H

.DATA
N       DW 6
R       DW 2
RESULT  DW 0

MSG1 DB 'NCR RESULT = $'

.CODE

MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Load n and r
    MOV AX, N
    MOV BX, R

    ; Call recursive procedure
    CALL NCR_PROC

    ; Store answer
    MOV RESULT, AX

    ; Print message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Print result
    MOV AX, RESULT
    CALL PRINT_NUM

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP


;-----------------------------------
; Recursive NCR Procedure
; AX = n
; BX = r
; Returns answer in AX
;-----------------------------------

NCR_PROC PROC

    ; if r == 0
    CMP BX, 0
    JE BASE1

    ; if r == n
    CMP AX, BX
    JE BASE1

    ; Save n and r
    PUSH AX
    PUSH BX

    ; First recursive call
    ; nCr(n-1, r)

    DEC AX
    CALL NCR_PROC

    MOV CX, AX

    ; Restore n and r
    POP BX
    POP AX

    ; Save first answer
    PUSH CX

    ; Second recursive call
    ; nCr(n-1, r-1)

    DEC AX
    DEC BX
    CALL NCR_PROC

    ; Get first answer
    POP CX

    ; Add both answers
    ADD AX, CX

    RET

BASE1:
    MOV AX, 1
    RET

NCR_PROC ENDP


;-----------------------------------
; Procedure to print number
;-----------------------------------

PRINT_NUM PROC

    MOV CX, 0
    MOV BX, 10

NEXT1:
    MOV DX, 0
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE NEXT1

NEXT2:
    POP DX
    ADD DL, 30H
    MOV AH, 02H
    INT 21H
    LOOP NEXT2

    RET

PRINT_NUM ENDP

END MAIN
