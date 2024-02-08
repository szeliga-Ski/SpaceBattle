PrintString:
LD   A, (HL)
RST  $10
INC  HL
DJNZ PrintString
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
CP   $15
JR   NZ, printFrame_loop

RET