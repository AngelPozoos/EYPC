rosa: EX DE, HL
EXX
EX (SP),HL
EX (SP),IX
EX (SP),IY
LDI
LDIR
LDD
LDDR
CPI
CPD
CALL rosa ;asknackjans
LD A, B ;kaksnacnkascvav
LD H, 3 ; holaaa
	 LD C, (HL)
LD B, (IX+5)
LD E, (IY+7)
LD (HL), L
LD (IX+1), A
LD (IY+3), B
LD (HL), 4
	LD (IX+3), 3
	LD (IY+2), 6
	LD A, (BC)
	LD A, (DE)
	LD A, (5)
	LD (BC), A
	LD (DE), A
	LD (3), A
	LD A, I
	LD A, R
	LD I, A
	LD R, A
	LD SP, 5
	LD IX, 3
	LD IY, 3
	LD HL, (3)
	LD BC, (3)
	LD DE, (3)
	LD IX, (4)
		LD IY, (4)
		LD (5), HL
		LD (5), SP
		LD (5), IX
		LD (5), IY
		LD SP, HL
		LD SP, IX
		LD SP, IY
		PUSH BC
		PUSH DE
		PUSH IX
		PUSH IY
		POP DE
		POP HL
		POP AF
		POP IX
		POP IY
