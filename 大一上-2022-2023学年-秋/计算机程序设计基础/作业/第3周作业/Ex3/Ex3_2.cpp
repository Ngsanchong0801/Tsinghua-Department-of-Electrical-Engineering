#include <stdio.h>
#include <math.h>
int main ()
{
	float cm,feet;
	cm = 0;
	char name[40]; 
	printf("請輸入你的姓名:\n");
	scanf("%s",name);

	printf("%s,你的身高是多少cm?\n",name);
	scanf("%f",&cm);

	feet= cm / 30.48;

	printf("你的身高是%.2ffeet\n",feet);

	return 0;
}