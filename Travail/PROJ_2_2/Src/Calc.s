	thumb
	area moncode, CODE , READONLY


	extern TabCos
	extern TabSin
	extern TabSig
	export calc
	

calc 	proc
		movs r1, #0
		B comp
		
begin	

		ADDS r1, r1, #1
comp 	CMP r1, #64
		BLT begin
		
		endp
		end
	
	