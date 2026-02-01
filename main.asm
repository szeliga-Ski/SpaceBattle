ORG $5DAD

; -------------------------------------------------------------------
; Indicators
;
; Bit 0 -> ship must be moved 0 = No, 1 = Yes
; Bit 1 -> shot is active 0 = No, 1 = Yes
; -------------------------------------------------------------------
;p.222
flags:
db $00

Main:
LD   A, $02             ; top screen channel ID
CALL OPENCHAN           ; ROM routine to select top screen for printing
LD   HL, udgsCommon     ; point to UDGs
LD   (UDG), HL          ; set System Variable to point to our UDGs

LD   HL, ATTR_P
LD   (HL), $07          ; attribute format: FBPPPIII
CALL CLS

XOR  A                  ; set border to black
OUT  ($FE), A           ;
LD   A, (BORDCR)        ; set border colour variable to black
AND  $C7                ;
OR   $07                ; set ink colour to white for when we return to BASIC
LD   (BORDCR), A        ; store in system variable

CALL PrintFrame         ; display game border
CALL PrintInfoGame      ; display game info
CALL PrintShip          ; display the ship

di
ld   a, $28
ld   i, a
im   2
ei

Main_loop:
CALL CheckCtrl          ; check for key presses
CALL MoveFire
CALL MoveShip
JR   Main_loop

include "const.asm"
include "ctrl.asm"
include "game.asm"
include "graph.asm"
;include "int.asm"
include "print.asm"
include "var.asm"

end  Main               ; tell pasmo to call Main from the Basic loader