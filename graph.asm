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