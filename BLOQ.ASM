CPU "Z80.TBL"
HOF "INT8"
ORG 1430H
;La longitud de memoria se extiende 1510H a 1530H
EXX 
LD HL,(1502H) ;Direccion del bloque en memoria
LD DE,(150AH) ; Direccion del ultimo elemento en memoria
EXX
LD A,(1505H)
CP 10H
JP M,FIN1
YARecorrio:	LD A, (1500H) ; Se obtiene el tamaño del bloque a mover
	LD C,A ;DEspues de recorrer la memoria se reinicia el sistema para mover el bloque
	INC C
	INC C
	LD IX,(1505H) ;Lugar donde se movera el bloque de codigo, se obtiene su direccion
	LD A,(1505H)
	LD E,A
	DEC IX 
	LD H,0
	LD B,0
Bucle:	LD A, B ;Se sigue checando la memoria
	CP C 
	JR NZ, Sigue ; Si no se cumple significa que ya tiene espacio y puede meter la cadena
EM:	LD HL, (1502H) ; Direccion de inicio del bloque a mover y se guarda en HL(SE ESCRIBE 1526H AL REVES)
	LD DE, (1505H); Direccion final del bloque
	LD BC,(1500H) ;Tamaño del bloque a mover
Mov:	LD A, (HL) ;Mueve el bloque solicitado
	LD (DE),A
	LD (HL),0
	INC HL
	INC DE
	DEC BC
	LD A,C
	CP 0
	JR Z, FIN
	JP Mov
FIN:	HALT
;Se sigue checando si cabe en el espacio nuestro bloque a mover	
Sigue:	LD A,0
	CP (IX +0)
	JR Z, SonIguales
;Si no esta vacio se busca la longitud del bloque que ocupa su lugar	
Checa:	INC H
	INC IX
	LD A,0
	CP (IX+0)
	JR Z, Recorre
	JP Checa
SonIguales:	INC B	;Si es cero el valor se sigue buscando en la memoria
		INC IX
		INC E
		LD A,(1502H)
		CP E
		JR Z,EM
		JP Bucle
;LDIR modificado para dejar en cero el bloque original		
LDIRMo:	LD A,(HL)
	LD (DE),A
	LD (HL),0
	INC DE
	INC HL
	DEC BC
	LD A,C
	CP 0
	JR Z, YARecorrio
	JP LDIRMo
;Recorremos toda la memoria NL + i veces
Recorre:
	EXX
	LD A,E
	EXX
	LD E,A
	LD A, B
	ADD A,H
	LD B,A
	LD A,E
	SUB B
	LD B,A
	EXX
	SBC HL,DE
	LD A,L
	EXX
	LD C,A
	LD D,15H
	LD E,B
	LD B,0
	LD A,E
	EXX 
	LD L,E
	LD E,A
	LD A,L
	LD D,15H
	LD HL, (1502H) ;Reestablecemos la direccion del bloque a mover
	EXX
	LD L,A
	LD H,15H
	LD A,E
	CP 10H
	JP M,FIN1
	JP LDIRMo
;Si se quiere acceder a memoria indebida sale un error	
FIN1:	LD A,-1
	LD (1500H),A
	JP FIN		
		
