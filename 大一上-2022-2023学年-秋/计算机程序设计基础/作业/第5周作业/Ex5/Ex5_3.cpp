#include <stdio.h>
int main ()
{
	int days, first,i ;
	printf("�п�J���몺�Ѽ�?\n");
	scanf("%d",&days);
	printf("�п�J1���O�P�X?\n");
	scanf("%d",&first);

	for(i=1;i<first;i++)
	{
			printf("   ");
	}

	for(i=1;i<=days;i++)
	{
		if ((i+first-1)%7==0)
			printf("%3d\n",i);

		else 
			printf("%3d",i);
		
	}
return 0;
}