CPU "Z80.TBL"
HOF "INT8"

LD IX,1030H ;Ubicacion de la cadena
LD HL,1050H ;Ubicacion del texto
LD IY,1013H ;Donde va a poner el indice de los iniales hacia adelante
EXX
LD BC,0
EXX
LD A,(1010H); Ubicacion longitud cadena
LD C,A
LD A,(1020H); Ubicacion longitud texto
LD E,A
LD B,0
Bucle:	LD A,E
	CP B
	JR Z,FIN
	LD A,(IX +0)
	CP (HL)
	JR Z,SoIgu
	LD IX,1030H
	LD D,0
etiq:	INC B
	INC HL
	JP Bucle
SoIgu:	INC D
	INC IX
	LD A,D
	CP 1
	JR Z,DirIni
Sigui:	LD A,D		
	CP C
	JP M,etiq
	EXX
	INC BC
	LD A,E
	LD (IY+0),A
	EXX
	INC IY
	LD D,0
	LD IX,1030H
	JP etiq
FIN:	EXX	
	LD (1011H),BC ;Donde va a poner el numero de repeticiones
	HALT
DirIni:	LD A,B
	EXX
	LD E,A
	EXX
	JP Sigui
	
