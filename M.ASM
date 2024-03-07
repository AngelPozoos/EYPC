     CPU "Z80.tbl"
     hof "int8"
     ld a, (1001H)
     cp 0
     jp z, eti1
     ld b,a
     ld a,(1000H)
     cp 0
     jr z,eti1
     cp b
     jp p, eti2
     ld c,a 
     ld d,b
eti3: ld a,d
SUMA: add a,d
      dec c
      jr nz,SUMA
eti1: ld (1002H),a
      HALT
eti2: ld c,b
      ld d,a
      jp eti3