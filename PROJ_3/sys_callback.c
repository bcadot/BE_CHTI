#include <gassp72.h>
#define M2TIR 985661
int tab_k[6] = {17, 18, 19, 20, 23, 24};
int res;
extern unsigned short dma_buf[64];
extern int compteur_occurences[6];

int dft(int *TSig,int k);

void sys_callback(){
	// Démarrage DMA pour 64 points
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	for(int i=0; i<6; i++){
		res = dft((int *)dma_buf, tab_k[i]);
		if(res > M2TIR)
			compteur_occurences[i] += 1;
		else	
			compteur_occurences[i] = 0;
	}
	
		
}