#include <stdio.h>
#define  N  14
int main ()
{
	int i,sum;
	i=1;
	sum=0;
	int fac(int a);

	for (i=1;i<=N;i++)
	{
		sum = sum + fac(i);
	}
	 printf("%d",sum);
	return 0;
}

int fac(int a)
{
	int i,sum;
	i=1;
	sum=1;
	for(i=1;i<=a;i++)
	{
		sum=sum*i;
	}
	return sum;
}