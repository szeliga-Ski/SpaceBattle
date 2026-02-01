; -------------------------------------------------------------------
; Evaluates whether any of the arrow keys have been pressed.
; The arrow keys are:
;             Z -> Left
;             X -> Right
;             V -> Trigger
;
; Return: D -> Keys pressed.
;             Bit 0 -> Left
;             Bit 1 -> Right
;             Bit 2 -> Trigger
;
; Alters the value of the registers A and D
; -------------------------------------------------------------------
CheckCtrl:
ld   d, $00                ; D = 0
ld   a, $fe                ; A = half-stack Cs-V
in   a, ($fe)              ; Read keyboard

checkCtrl_fire:
bit  $04, a                ; V pressed?
jr   nz, checkCtrl_left    ; Not pressed, skip
set  $02, d                ; Set bit 2 of D

checkCtrl_left:
bit  $01, a                ; Z pressed?
jr   nz, checkCtrl_right   ; Not pressed, skip
set  $00, d                ; Set bit 0 of D

checkCtrl_right:
bit  $02, a                ; X pressed?
ret  nz                    ; Not pressed, exits
set  $01, d                ; Set bit 1 of D

checkCtrl_testLR:
ld   a, d                  ; A = D
and  $03                   ; Keeps bits 0 and 1
sub  $03                   ; Active both bits?
ret  nz                    ; Both not active (!=0), outputs
ld   a, d                  ; A = D
and  $04                   ; Keeps bit 2
ld   d, a                  ; D = A

checkCtrl_end:
ret
