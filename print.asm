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
LD   B, $01
printFrame_loop:
LD   A, $16
RST  $10
LD   A, B
RST  $10
LD   A, $00
RST  $10
LD   A, $99
RST  $10
LD   A, $16
RST  $10
LD   A, B
RST  $10
LD   A, $1F
RST  $10
LD   A, $9A
RST  $10
INC  B
LD   A, B
CP   $14
JR   NZ, printFrame_loop
RET