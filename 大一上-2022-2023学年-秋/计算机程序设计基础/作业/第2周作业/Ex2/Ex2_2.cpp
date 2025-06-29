#include <math.h>
#include <stdio.h>
int main ()
{
	float num1,num2;
	num1= 100;
	num2= log10( num1);

	printf("原數是 %6.1f\n其對數值是 %6.1f\n",num1,num2);

	return 0;
}