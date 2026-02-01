; memory address where UDGs are loaded
UDG:        EQU $5C7B

; ROM routine to open a screen channel: 1=cmd line; 2=top screen
OPENCHAN:   EQU $1601

; System variable for permanent colour attributes
ATTR_P:     EQU $5C8D

; System variable containing current colour attributes
ATTR_T: EQU $5c8f

; System variable for border colour. Format is FBPPPIII
BORDCR:     EQU $5C48

; ROM routine to clear screen using ATTR_P
CLS:        EQU $0DAF

; Screen coordinates for ROM routine positioning the cursor
; The play area (the frame).
COR_X: EQU $20 ; X-coordinate of the upper left corner
COR_Y: EQU $18 ; Y-coordinate of upper left corner
MIN_X: EQU $00 ; To be subtracted from COR_X for X upper left corner
MIN_Y: EQU $00 ; To be subtracted from COR_Y for Y upper left corner
MAX_X: EQU $1f ; To be subtracted from COR_X for X bottom right corner
MAX_Y: EQU $15 ; To be subtracted from COR_Y for Y lower right corner

; Character code of the ship, starting position and buffers
SHIP_GRAPH: EQU $90
SHIP_INI:   EQU $0511
SHIP_TOP_L: EQU $1e
SHIP_TOP_R: EQU $01

; Shot character code and top
FIRE_GRAPH: EQU $91
FIRE_TOP_T: EQU COR_Y

; Character code of the blank character
WHITE_GRAPH:	EQU $9e