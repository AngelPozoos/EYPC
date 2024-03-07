CPU "Z80.TBL"
HOF "INT8"

EXX
LD HL,1330H
LD BC,0
LD DE,0
EXX
LD HL,1300H
LD D,0
LD BC,(1300H)
Bucle:
    LD IX,1330H
    LD A,D
    CP (HL)
    JR Z,FIN
    ADD IX,BC
    LD A,0
    CP (IX+0)
    JR Z,Posible
    LD D,0
    INC BC
    JP Bucle
Posible:
    LD A,D
    CP 0
    JR Z,Inicial
INCM:
    INC BC
    INC D
    JR Bucle
Inicial:
    LD A,C
    EXX
    LD E,A
    EXX
    JP INCM
FIN:
    EXX
    LD BC,(1300H)
    LD A,0
    LD (HL),A  
    ADD HL,DE
    LD DE,1330H
    EX DE,HL
    LDIR
    HALT
