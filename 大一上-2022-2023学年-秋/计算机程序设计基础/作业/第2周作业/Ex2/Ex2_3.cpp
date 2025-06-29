#include <math.h>
#include <stdio.h>
int main ()
{
	float num1,num2,absolute1,absolute2;
	num1=  234.5;
	num2= -345.6;

	absolute1=fabs(num1);
	absolute2=fabs(num2);

	printf("第一個實數是%6.1f,第二個實數是%6.1f\n第一個實數的絕對值是%6.1f,第二個實數的絕對值是%6.1f",num1,num2,absolute1,absolute2); 

	return 0;
}