; -------------------------------------------------------------------
; Position the cursor at the specified coordinates.
;
; Input: B = Y-coordinate (24 to 3).
;        C = X-coordinate (32 to 1).
; Alters the value of the AF register
; -------------------------------------------------------------------
At:
push bc                    ; We preserve the value of BC
exx                        ; We preserve the value of BC, DE and HL
pop  bc                    ; Retrieve the value of BC
call $0a23                 ; Call the ROM routine
exx                        ; Retrieve the value of BC, DE and HL

ret

; -------------------------------------------------------------------
; Change the ink
;
; Input: A -> Ink colour
; Alters the value of the A register.
; -------------------------------------------------------------------
Ink:
exx                        ; Preserves BC, DE and HL
ld   b, a                  ; B = ink
ld   a, (ATTR_T)           ; A = current attributes
and  $f8                   ; A = Ink 0
or   b                     ; A = Ink received
ld   (ATTR_T), a           ; Current attributes = A
exx                        ; Retrieves BC, DE and HL

ret

; -------------------------------------------------------------------
; copy the current level's enemy UDGs into "var.asm/udgsExtension"

LoadUdgsEnemies:
DEC  A                      ; A=level number so calculate the UDG offset
LD   H, $00                 ;
LD   L, A                   ;
ADD  HL, HL                 ; 31 levels so multiply HL by 32 since there are
ADD  HL, HL                 ; 32 bytes of UDG enemy graphics per level
ADD  HL, HL                 ;
ADD  HL, HL                 ;
ADD  HL, HL                 ;
LD   DE, udgsEnemiesLevel1  ; DE points to 1st enemy graphic
ADD  HL, DE                 ; HL = offset + DE
LD   DE, udgsExtension      ; point to current level's UDG data block
LD   BC, $20                ; number of bytes to copy from HL to DE
LDIR                        ; copy UDG data to "udgsExtension"
RET