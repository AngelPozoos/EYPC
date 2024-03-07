CPU "Z80.TBL"
HOF "INT8"
ORG 0F80H
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
Bucle:	LD A,E ;Se verifica si se es que ya acabo de recorrer todo el texto
	CP B
	JR Z,FIN
	LD A,(IX +0)
	CP (HL)
	JR Z,SoIgu	;Se compara el valor del cadena actual con el caracter actual del texto
	LD IX,1030H	;Reincia el apuntado de la cadena al primero y reinicia D = Se encontro la cadenacompleta
	LD D,0
	LD A,(HL)	;Si no son iguales pero el valor que sigue es el inicial se reinicia la cuenta
	CP (IX +0)
	JR Z,SoIgu
etiq:	INC B		
	INC HL
	JP Bucle
SoIgu:	INC D	;Si son iguales entonces se incrementa D y se mueve al siguiente de la cadena
	INC IX
	LD A,D
	CP 1
	JR Z,DirIni ;Si es el primer valor de la cadena se guarda tentativamente la ubicacion
Sigui:	LD A,D		
	CP C
	JP M,etiq
	EXX
	INC BC
	LD A,E
	LD (IY+0),A ;Se encontro la cadena entonces se guarda su direccion y se lleva su contador
	EXX
	INC IY
	LD D,0
	LD IX,1030H
	JP etiq
FIN:	EXX	
	LD (1011H),BC ;Donde va a poner el numero de repeticiones
	HALT
DirIni:	LD A,B	;Se guarda la direccion tentativa inicial
	EXX
	LD E,A
	EXX
	JP Sigui
	
