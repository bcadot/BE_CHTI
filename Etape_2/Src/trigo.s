; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export somme;
	extern TabSin
	extern TabCos
;
somme proc
	; M est dans r0
	push {lr}
	
	ldr	r1, =TabSin 	; adresse de TabSin dans r1
	ldrsh r1, [r1, r0]	; r1 = r1 + M*8
						; r1 = TabSin[M/2]
	ldr	r2, =TabCos 	; adresse de TabCos dans r2
	ldrsh r2, [r2, r0]
	
	mul r3, r1, r1
	mla r0, r2, r2, r3
	;valeur de retour dans r0
	
	pop	{pc}
	endp
	end
;