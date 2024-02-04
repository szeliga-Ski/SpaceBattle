ORG $5DAD

Main:
LD   HL, udgsCommon ; point to UDGs
LD   (UDG), HL      ; set System Variable to point to our UDGs

LD   A, $90     ; 1st UDG
LD   B, $15     ; 21 UDGs to print

Loop:
PUSH AF         ; store A's code for UDG 
RST  $10        ; print the UDG in A
POP  AF         ; restore A
INC  A          ; get code for next UDG
DJNZ Loop       ; Loop

RET

include "const.asm"
include "var.asm"
end  Main