#include <stdio.h>
int main ()
{
	int num;
	num = 0;

	printf("請輸入一個整數\n");
	scanf("&d", &num);
	if ( num > 999999 )
		printf("暫時無法確定幾位\n");
	else if ( num >= 0 && num < 10 )
		printf("這個數有1位\n");
		
	return 0;
}