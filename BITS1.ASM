CPU "Z80.TBL"
HOF "INT8"
LD HL, (1000H)
eti1:   LD A, (HL)
        CP 0H
        JP Z, fin
        LD C,80H
eti2:   CP C
        JP M, eti3
        SUB C
eti3:   RRC C
        CP 0H
        JP Z, eti2
        INC HL
        INC C
fin:    JP eti1
        HALT
        