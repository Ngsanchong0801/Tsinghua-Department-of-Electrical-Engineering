#include <stdio.h>
int main ()
{
	int num1, num2, num3, max;
	num1=0;
	num2=0;
	num3=0;
	max=0;

	printf("�п�J�T�Ӿ��\n");
	scanf("%d%d%d",&num1,&num2,&num3);

	if (num1 > num2 && num1 > num3)
		max = num1;
	else if (num2 > num1 && num2 > num3)
		max = num2;
	else
		max = num3;

	printf("�䤤�̤j����Ƭ�%d\n",max);
	return 0;
}