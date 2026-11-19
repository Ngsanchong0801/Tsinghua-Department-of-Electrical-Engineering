#include<stdio.h>
int main ()
{
	int cal (int a);
	int m, n,result;
	m=0;
	n=0;
	result=0;

	printf("Please input m and n\n");
	scanf("%d,%d",&m,&n);

	if (m<=12 && n<=12 && m>0 && n>0)
	{
		result= (cal(m))/(cal(n)*cal(m-n));
		printf("C(%d,%d)=%d",m,n,result);
	}
	else
	{
		printf("Wong!!");
	}
	return 0;
}


int cal (int a)
{
	int i,sum;
	i=1;
	sum=1;
	for (i=1;i<=a;i++)
	{
		sum=sum*i;
	}
	return sum;
}