#include <stdio.h>
int main ()
{
	char cha;
	printf("�п�J�@�Ӧr��\n");
	cha= getchar();

	if (cha>='A' && cha<='Z')
		printf("��J���r���ݩ�j�g�r��");
	else if (cha>='a' && cha<='z')
		printf("��J���r���ݩ�p�g�r��");

	else if (cha == '!' || cha == '�C')
		printf("��J���r���ݩ���I�Ÿ�");

	else
		printf("��J���r���ݩ��L��");

	return 0;
}