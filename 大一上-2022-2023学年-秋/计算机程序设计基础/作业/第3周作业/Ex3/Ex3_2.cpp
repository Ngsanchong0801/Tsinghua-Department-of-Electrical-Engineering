#include <stdio.h>
#include <math.h>
int main ()
{
	float cm,feet;
	cm = 0;
	char name[40]; 
	printf("�п�J�A���m�W:\n");
	scanf("%s",name);

	printf("%s,�A�������O�h��cm?\n",name);
	scanf("%f",&cm);

	feet= cm / 30.48;

	printf("�A�������O%.2ffeet\n",feet);

	return 0;
}