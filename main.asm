ORG $5DAD

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

Main_loop:
JR   Main_loop

include "const.asm"
include "graph.asm"
include "var.asm"
include "print.asm"
end  Main               ; tell pasmo to call Main from the Basic loader