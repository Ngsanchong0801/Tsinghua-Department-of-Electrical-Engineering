#include <math.h>
#include <stdio.h>
int main ()
{
	float num1,num2,absolute1,absolute2;
	num1=  234.5;
	num2= -345.6;

	absolute1=fabs(num1);
	absolute2=fabs(num2);

	printf("�Ĥ@�ӹ�ƬO%6.1f,�ĤG�ӹ�ƬO%6.1f\n�Ĥ@�ӹ�ƪ�����ȬO%6.1f,�ĤG�ӹ�ƪ�����ȬO%6.1f",num1,num2,absolute1,absolute2); 

	return 0;
}