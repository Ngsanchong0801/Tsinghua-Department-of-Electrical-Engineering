#include <stdio.h>
int main ()
{
	int num1, num2, num3, max;
	num1=0;
	num2=0;
	num3=0;
	max=0;

	printf("請輸入三個整數\n");
	scanf("%d%d%d",&num1,&num2,&num3);

	if (num1 > num2 && num1 > num3)
		max = num1;
	else if (num2 > num1 && num2 > num3)
		max = num2;
	else
		max = num3;

	printf("其中最大的整數為%d\n",max);
	return 0;
}