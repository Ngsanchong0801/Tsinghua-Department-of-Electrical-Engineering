#include <stdio.h> 

int main()
{
	int i, N, fac;
	printf("ÇëÊäÈë´ıÇó½×³ËÊıN£º");
	scanf("%d",&N);
	fac = 1;
	for(i=1;i<=N;i++)
	{
		fac =fac * i;
	}
	printf("1*2*...*%d=%d\n",N,fac);
	return 0;
}