#include <stdio.h>
int main ()
{
	printf ("���Y�ŤM���C��\n");
	printf("�r��'R'��'r'�N��'���Y'\n");
	printf("�r��'P'��'p'�N��'��'\n");
	printf("�r��'S'��'s'�N��'�ŤM'\n");
	printf("\n");
	printf("�U���ХҩM�A���O��J�ۤv�����:\n");

	char cInputA, cInputB;
	scanf("%c %c",&cInputA,&cInputB);
	//�ҥX���Y
	if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'S'|| cInputB == 's') )
		printf("��Ĺ�F!");

	else if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'P'|| cInputB == 'p') )
		printf("�AĹ�F!");

	else if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'R'|| cInputB == 'r') )
		printf("����!");

	//�ҥX��
	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'R'|| cInputB == 'r') )
		printf("��Ĺ�F!");

	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'S'|| cInputB == 's') )
		printf("�AĹ�F!");

	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'P'|| cInputB == 'p') )
		printf("����!");

	//�ҥX�ŤM
	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'P'|| cInputB == 'p') )
		printf("��Ĺ�F!");

	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'R'|| cInputB == 'r') )
		printf("�AĹ�F!");

	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'S'|| cInputB == 's') )
		printf("����!");

	return 0;
}