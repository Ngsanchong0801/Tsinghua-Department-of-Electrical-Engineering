#include <stdio.h>
int main ()
{
	printf ("石頭剪刀布遊戲\n");
	printf("字符'R'或'r'代表'石頭'\n");
	printf("字符'P'或'p'代表'布'\n");
	printf("字符'S'或's'代表'剪刀'\n");
	printf("\n");
	printf("下面請甲和乙分別輸入自己的手勢:\n");

	char cInputA, cInputB;
	scanf("%c %c",&cInputA,&cInputB);
	//甲出石頭
	if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'S'|| cInputB == 's') )
		printf("甲贏了!");

	else if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'P'|| cInputB == 'p') )
		printf("乙贏了!");

	else if ((cInputA == 'R'|| cInputA == 'r') && (cInputB == 'R'|| cInputB == 'r') )
		printf("平局!");

	//甲出布
	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'R'|| cInputB == 'r') )
		printf("甲贏了!");

	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'S'|| cInputB == 's') )
		printf("乙贏了!");

	else if ((cInputA == 'P'|| cInputA == 'p') && (cInputB == 'P'|| cInputB == 'p') )
		printf("平局!");

	//甲出剪刀
	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'P'|| cInputB == 'p') )
		printf("甲贏了!");

	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'R'|| cInputB == 'r') )
		printf("乙贏了!");

	else if ((cInputA == 'S'|| cInputA == 's') && (cInputB == 'S'|| cInputB == 's') )
		printf("平局!");

	return 0;
}