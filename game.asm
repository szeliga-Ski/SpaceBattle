; -------------------------------------------------------------------
; Move the ship
;
; Input: D -> Controls status
; Alters the value of the AF and BC registers.
; -------------------------------------------------------------------
MoveShip:
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
