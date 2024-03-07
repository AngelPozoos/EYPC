CPU "Z80.TBL"
HOF "INT8"
ORG 1150
EXX
LD BC, 0 ; Se movera como nuestro indice en nuestro: arreglo [BC]		
EXX
LD A, (1200) ;Tamaño del arreglo
LD B, A	; Se guarda en B
DEC B
LD A, (1210) ;Es el valor que buscamos
LD E, A	;Y se guarda en E
LD C, 0	;C es nuestro indice inicial
bucle:	LD IX, 1230	;Ubicacion del primer valor del arreglo	
	LD A, C		
	CP B	;Se verifica que si todavia hay valores a comparar, cundo el indice incial es 
	JR Z, condi	
	JP M, condi	;Se verifica si es menor o igual al indice final 
	LD A, -1
etiqdos:	LD (1201), A	;Se guarda el resultado
	HALT
condi:	ADD A, B		;El indice de medio es D = (indicefinal+indiceINicial)//2
	LD D, A
	SRL D	;Division entre dos entera
	SRL A
	EXX
	LD C, A
	ADD IX, BC ;Mueve nuestro indice a la posicion BC
	EXX
	LD A, E
	CP (IX+0)
	JR Z, encon	;Se verifica si en el medio esta nuestro valor
	JP P, etiqtres	;Se verifica si nuestro valor esta  mas arriba del arreglo
	DEC D		;Si es negativo es decir nuestro valor es mas alto se mueve hacia la derecha	
	LD B, D
	JP bucle
etiqtres:	INC D		;Si es positivo significa que nuestro valor es mas bajo se mueve a la izquierda
	LD C, D
	JP bucle
encon:	LD A, D		;SI se encuentra se guarda el indice de en medio
	JP etiqdos
