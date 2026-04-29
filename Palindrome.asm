.MODEL SMALL
.STACK 100H

.DATA
STR  DB "MADAM$"
LEN  EQU $-STR-1

RSTR DB 10 DUP('$')

MSG  DB 10,13,"Reverse string is: $"
MSG1 DB 10,13,"String is Palindrome$"
MSG2 DB 10,13,"String is Not Palindrome$"

.CODE
MAIN:
MOV AX,@DATA
MOV DS,AX
MOV ES,AX

; -------------------------
; REVERSE THE STRING
; -------------------------

LEA SI,STR        ; SI -> STR
LEA DI,RSTR       ; DI -> RSTR

ADD DI,LEN-1      ; DI points to last position of RSTR

MOV CX,LEN        ; counter

RPT:
MOV AL,[SI]       ; take character from STR
MOV [DI],AL       ; store into RSTR reverse side

INC SI            ; next char in STR
DEC DI            ; move backward in RSTR

LOOP RPT

; -------------------------
; DISPLAY ORIGINAL STRING
; -------------------------

LEA DX,STR
MOV AH,09H
INT 21H

; -------------------------
; DISPLAY MESSAGE
; -------------------------

LEA DX,MSG
MOV AH,09H
INT 21H

; -------------------------
; DISPLAY REVERSED STRING
; -------------------------

LEA DX,RSTR
MOV AH,09H
INT 21H

; -------------------------
; CHECK PALINDROME
; -------------------------

LEA SI,STR
LEA DI,RSTR

MOV CX,LEN

REPE CMPSB

JNE NOTPAL

; -------------------------
; PALINDROME MESSAGE
; -------------------------

LEA DX,MSG1
MOV AH,09H
INT 21H

JMP EXIT

; -------------------------
; NOT PALINDROME
; -------------------------

NOTPAL:
LEA DX,MSG2
MOV AH,09H
INT 21H

; -------------------------
; EXIT
; -------------------------

EXIT:
MOV AH,4CH
INT 21H

END MAIN
