#include <stdio.h>
int main ()
{
	int num;
	num = 0;

	printf("�п�J�@�Ӿ��\n");
	scanf("&d", &num);
	if ( num > 999999 )
		printf("�ȮɵL�k�T�w�X��\n");
	else if ( num >= 0 && num < 10 )
		printf("�o�ӼƦ�1��\n");
		
	return 0;
}