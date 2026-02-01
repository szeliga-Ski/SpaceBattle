; -------------------------------------------------------------------
; Deletes a character from the display
;
; Input: BC -> Y/X coordinates of the character
; Alters the value of the AF registers
; -------------------------------------------------------------------
DeleteChar:
call At                    ; Position cursor

ld   a, WHITE_GRAPH        ; A = white character
rst  $10                   ; Paints it and erases the ship

ret

PrintString:
LD   A, (HL)
RST  $10
INC  HL
DJNZ PrintString
RET

PrintInfoGame:
LD   A, $01                         ; open bottom channel for printing
CALL OPENCHAN                       ;
LD   HL, infoGame                   ; address of title in print.asm
LD   B, infoGame_end - infoGame      ; number of bytes to print
CALL PrintString                    ; display game info
LD   A, $02                         ; open upper channel for printing
CALL OPENCHAN                       ;0c
RET

PrintFrame:
LD   HL, frameTopGraph
LD   B,  frameEnd - frameTopGraph
CALL PrintString
LD   B, COR_Y - $01
printFrame_loop:
LD   C, COR_X - MIN_X
CALL At
LD   A, $99
RST  $10

LD   C, COR_X - MAX_X
CALL At
LD   A, $9A
RST  $10

DEC  B
LD   A, COR_Y - MAX_Y + $01
SUB  B
JR   NZ, printFrame_loop
RET

; -------------------------------------------------------------------
; Paints the ship at the current position.
; Alters the value of the A and BC registers.
; -------------------------------------------------------------------
PrintShip:
ld   a, $07                ; A = white ink
call Ink                   ; Change ink

ld   bc, (shipPos)         ; BC = ship position
call At                    ; Position cursor

ld   a, SHIP_GRAPH         ; A = ship character
rst  $10                   ; Print ship

ret