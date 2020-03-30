#include <stdio.h>

//variables
int M = 8;
int somme(int Indice);
int s = 0;

int main(void)
{	
	for (int i = 0; i < M; i++) {
		s = somme(i);
		printf("Somme = %d", s);
	}
}
