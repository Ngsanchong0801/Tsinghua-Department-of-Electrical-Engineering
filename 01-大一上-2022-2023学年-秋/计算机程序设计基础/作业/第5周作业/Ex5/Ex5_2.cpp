#include <stdio.h>
#include <math.h>
int main ()
{
	int num,i,a;
	num = 0;
	i = 2;
	a = 0;

	printf("輸入一個整數N(N<10000):\n");
	scanf("%d",&num);
	for (i=2; i <= num ; i=i+2)
	{
		if(i*i<=num)
		{
			a = i*i;
			printf("%d\n",a);
		}
	}
	return 0;
}
