	thumb
	area moncode, CODE , READONLY


	extern TabCos
	extern TabSin
	export somme
	

somme proc
	mov r1, #2
	mul r0, r0, r1
;i est dans r0, @TabCos dans r1, @TabSin dans r2
	ldr  r1, =TabCos
	ldr  r2, =TabSin
	ldrsh r1, [r1,r0]
	ldrsh r2, [r2,r0]
	mul r3, r1, r1
	mla r0, r2, r2, r3
	bx  lr
	
	endp
	end
	
	