	thumb
	area moncode, CODE , READONLY


; Bit Set/Reset register
GPIOB_BSRR	equ	0x40010C10
	extern current_value
	export timer_callback
	

timer_callback proc
	ldr  r2, =current_value
	ldr  r0, [r2]
	ldr  r3, =GPIOB_BSRR
	cbnz r0, zero
	
;mise a 1 de PB1
	mov r1, #0x00000002
	str r1, [r3]
	mov r1, #1
	str r1, [r2]
	bx  lr
	
;mise a 0 de PB1
zero mov r1, #0x00020000
	 str r1, [r3]
	 mov r1, #0
	 str r1, [r2]
	 bx  lr
	
	endp
	end
	
	