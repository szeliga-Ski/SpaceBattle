; memory address where UDGs are loaded
UDG:        EQU $5C7B

; ROM routine to open a screen channel: 1=cmd line; 2=top screen
OPENCHAN:   EQU $1601

; System variable for permanent colour attributes
ATTR_P:     EQU $5C8D

; System variable for border colour. Format is FBPPPIII
BORDCR:     EQU $5C48

; ROM routine to clear screen using ATTR_P
CLS:        EQU $0DAF
