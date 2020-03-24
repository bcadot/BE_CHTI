; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
;

GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register

timer_callback proc
	push	{lr}
	
	CBZ r1, misea1
	
; mise a zero de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
	pop	{pc}
	endp
	end

misea1
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	bx lr
	
	pop	{pc}
	endp
	end

; N.B. le registre BSRR est write-only, on ne peut pas le relire

