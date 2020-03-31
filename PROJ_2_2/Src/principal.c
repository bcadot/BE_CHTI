const int N = 64;
extern int TabSig[N];

int dft(int *TSig,int k);

int res[N];

int main(void)
{
	for(int i = 1 ; i < N-1; i++){
			res[i] = dft(TabSig, i);
	}
	while	(1){}
}
