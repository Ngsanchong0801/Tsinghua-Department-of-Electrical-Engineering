#include <stdio.h>
int main ()
{
	int days, first,i ;
	printf("請輸入本月的天數?\n");
	scanf("%d",&days);
	printf("請輸入1號是周幾?\n");
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