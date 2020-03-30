; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	
	extern TabSin
	extern TabCos
	export somme;
;
somme proc
	; M est dans r0
	
	ldr	r1, =TabSin 	; adresse de TabSin dans r1
	mov r3, #2
	mul r0, r3			; on a 2M dans r0
	ldrsh r1, [r1, r0]	; r1 = r1 + 2M*8         
						; r1 = TabSin[M]
	ldr	r2, =TabCos 	; adresse de TabCos dans r2
	ldrsh r2, [r2, r0]
	
	mul r3, r1, r1
	mla r0, r2, r2, r3
	; valeur de retour dans r0 codé en 2 - 30 !!!!
	; ATTENTION A LA RECONVERSION
	
	endp
	end
;