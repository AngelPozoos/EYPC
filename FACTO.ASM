CPU "Z80.TBL"
HOF "INT8"
ORG 1350H
LD SP, 2000H ;Se establece el lugar de la pila
LD A,(1400H) ;Aqui se pone el factorial a buscar
LD HL,1H
CP 0
JR Z,FAC0	;Primero se verifica si el factorial es 0
CALL FACN	
FAC0:	LD A,L ; Donde se guardara el valor
	LD (1411H),A
	LD A,H
	LD (1410H),A
HALT

FACN:	CP 1	;Caso base, cuando se llega el factorial de 1
	JR Z,FAC1
	LD C,A
	PUSH BC	;Se van guardando el multiplicador de cada factorial, HL * i
	DEC A
	CALL FACN ;Recursividad
	POP BC	;Cuando se llego al caso base, se empiezan a sacar los multiplicadores 
	LD D,H	
	LD E,L
	LD HL,0
MULTI:	ADD HL,DE ;Se multiplican con HL como multilplicando y BC es el multiplicador que es el fac delNUm actual
	DEC BC
	LD A,C
	CP 0
	JR Z,Sifac
	JP MULTI

Sifac:	RET

FAC1:	LD HL,1		;HL sera el multiplicando, que se modificara mientras se van sacando sus valores
	RET

		
