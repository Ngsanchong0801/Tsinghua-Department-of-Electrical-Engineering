#include <stdio.h>
int main ()
{
	int a[10]={ 100, 90, 80, 70, 60, 50 };
	int num = 0;
	int i = 0;
	int j = 0;
	int k = 0;
	int m = 0;

	printf("請輸入要插入的整數\n");
	scanf("%d",&num);

	a[6]=num;
	for (i=0;i<6;i++)
	{
		for (j=0;j<6-i;j++)
		{
			if(a[j]<a[j+1])
			{
				m = a[j];
				a[j] = a[j+1];
				a[j+1] = m;
			}
		}
	}

	printf("排序後:\n");

	for(k=0;k<7;k++)
		printf("%d ",a[k]);
	return 0;
}