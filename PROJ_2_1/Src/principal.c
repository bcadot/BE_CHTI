int somme(int i);
	

int main(void)
{
	int min = 32767;
	int max = 0;
	int res = 0;
	for(int i=0 ; i<8; i++){
		res = somme(i);
		if(res > max)
			max = res;
		else if(res < min)
			min = res;
	}
	
	
	while	(1){}
}
