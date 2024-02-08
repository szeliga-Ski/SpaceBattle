ORG $5DAD

Main:
LD   A, $02             ; top screen channel ID
CALL OPENCHAN           ; ROM routine to select top screen for printing
LD   HL, udgsCommon     ; point to UDGs
LD   (UDG), HL          ; set System Variable to point to our UDGs

;LD   A, $90             ; $90 represents the 1st UDG
;LD   B, $0f             ; 15 "common" UDGs to print
;
;Loop:
;PUSH AF                 ; store A's code for UDG 
;RST  $10                ; print the UDG in A
;POP  AF                 ; restore A's code for UDG 
;INC  A                  ; get code for next UDG
;DJNZ Loop               ; Loop
;
;LD   A, $01             ; level 1
;LD   B, $1e             ; 30 levels
;
;Loop2:                  ; to draw the enemies of 30 levels
;PUSH AF                 ; preserve registers
;PUSH BC                 ;
;CALL LoadUdgsEnemies    ; copy graphics data into udgsExtension
;LD   A, $9F             ; 1st enemy graphic
;RST  $10                ; print
;LD   A, $A0             ; 2nd enemy graphic
;RST  $10                ; print
;LD   A, $A1             ; 3rd enemy graphic
;RST  $10                ; print
;LD   A, $A2             ; 4th enemy graphic
;RST  $10                ; print
;POP  BC                 ; restore registers
;POP  AF                 ;
;INC  A                  ; go to the next level
;DJNZ Loop2              ; loop
;
;LD   HL, String
;LD   B, String_End - String
;CALL PrintString

CALL PrintFrame

RET

;String:
;db   $16, $0A, $0A      ; AT (10,10)
;db   $11, $00           ; PAPER 0
;db   $10, $06           ; INK 6
;db   $12, $01           ; FLASH 1
;db   'Hello World'
;String_End:
;db   $

include "const.asm"
include "graph.asm"
include "var.asm"
include "print.asm"
end  Main