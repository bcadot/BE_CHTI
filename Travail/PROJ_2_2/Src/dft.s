	thumb
	area moncode, CODE , READONLY


	extern TabCos
	extern TabSin
	extern TabSig
	export dft
	

dft 	proc
		push {lr, r4, r5, r0}
		ldr r2, =TabCos
		bl calc
		smull r4, r5, r0, r0 ;r4r5 = Re(k)² 
		
		pop{r0}
		
		ldr r2, =TabSin
		bl calc
		smlal r4, r5, r0, r0 ;r4r5 = Re(k)² + Im(k)²
		
		mov r0,r5 ; permet de garder les 32bits de r5 (poids fort)
		
		pop {pc, r4, r5}
		endp



calc 	proc ;r0 = @x , r1 = k , r2 = @cos ou @sin
		push {r4, r5, r6, r7}
		mov r3, #0	;r3 = i
		mov r4, #0	;r4 = ik
		mov r5, #0	;r5 = 0 (valeur de la somme)
			
boucle  ldrh r6, [r0, r3, LSL #1] ;r6 = x[i]
		ldrsh r7, [r2, r4, LSL #1] ;r7 = cos[ik] ou sin[ik]
		mla r5, r6, r7, r5 ;r5 += x[i]*cos[ik] ou x[i]*sin[ik]
		
		add r4, r1 ;maj de ik
		and r4, #63 ;modulo 64
		add r3, #1 ;i++
		cmp r3, #64
		bne boucle ;si i!=64 -> on reboucle
		
		mov r0, r5	
		pop {r4, r5, r6, r7}
		bx lr
		endp
			
			
		end
	
	