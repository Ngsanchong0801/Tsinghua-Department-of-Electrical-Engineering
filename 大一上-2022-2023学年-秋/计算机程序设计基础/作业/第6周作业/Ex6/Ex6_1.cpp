#include <stdio.h>
#include <math.h>
int main ()
{
	int num,i,j;
	i=0;
	j=0;
	num=0;

	int m[20];
	int N=20;
	for(num=2;num<=N;num++)
	{
		for(i=2;i<num;i++)
			if(num%i==0)
				break;
		if(i==num)
		{
			printf("%d\n",num);
			m[j]=num;
			j=j+1; 
		}
	}

	int k;
	for(k=0;k<j;k++)
		printf("%d ",m[k]);
	return 0;
	}



