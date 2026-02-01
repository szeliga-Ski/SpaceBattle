org  $7e5c

Isr:
push hl
push de
push bc
push af

ld   hl, $5dad  ;flag to move ship or not - see declaration at start of main.asm
set  00, (hl)

Isr_end:
pop  af
pop  bc
pop  de
pop  hl
ei
reti
