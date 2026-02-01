; -------------------------------------------------------------------
; Move the shot
;
; Input: D -> Controls status
; Alters the value of the AF, BC and HL registers.
; -------------------------------------------------------------------
MoveFire:
ld   hl, flags             ; HL = address flags
bit  $01, (hl)             ; Active fire?
jr   nz, moveFire_try      ; If active, jumps
bit  $02, d                ; Trigger control active?
ret  z                     ; If not active, exits
set  $01, (hl)             ; Enables trigger bit in flags
ld   bc, (shipPos)         ; BC = ship position
inc  b                     ; B = top line
jr   moveFire_print        ; Paint shot

moveFire_try:
ld   bc, (firePos)         ; BC = shot position
call DeleteChar            ; Delete shot
inc  b                     ; B = top line
ld   a, FIRE_TOP_T         ; A = upper shot top
sub  b                     ; A = A - B (Y-coordinate shot)
jr   nz, moveFire_print    ; A!= B, does not reach top, jumps
res  $01, (hl)             ; Deactivates shot

ret

moveFire_print:
ld   (firePos), bc         ; Update shot position
call PrintFire             ; Paint shot

ret

; -------------------------------------------------------------------
; Move the ship
;
; Input: D -> Controls status
; Alters the value of the AF and BC registers.
; -------------------------------------------------------------------
MoveShip:
ld   hl, flags             ; HL = address flags
bit  $00, (hl)             ; Check bit 0
ret  z                     ; Bit 0 = 0? Yes, it comes out 
res  $00, (hl)             ; Bit 0 = 0

ld   bc, (shipPos)         ; BC = ship position
bit  $01, d                ; Go right?
jr   nz, moveShip_right    ; If it goes right, jump

bit  $00, d                ; Go left?
ret  z                     ; Does not go left, exits

moveShip_left:
ld   a, SHIP_TOP_L + $01   ; A = stop for left-hand ship
sub  c                     ; A = A - C (column ship)
ret  z                     ; A = C? Yes, it comes out
call DeleteChar            ; Delete ship
inc  c                     ; C = left column of current
ld   (shipPos), bc         ; Update ship position
jr   moveShip_print        ; Jump to the end of the routine

moveShip_right:
ld   a, SHIP_TOP_R + $01   ; A = stop for right-hand ship
sub  c                     ; A = A - C (column ship)
ret  z                     ; A = C? Yes, it comes out
call DeleteChar            ; Delete ship
dec  c                     ; C = right column of current
ld   (shipPos), bc         ; Update ship position

moveShip_print:
call PrintShip             ; Paints ship

ret
