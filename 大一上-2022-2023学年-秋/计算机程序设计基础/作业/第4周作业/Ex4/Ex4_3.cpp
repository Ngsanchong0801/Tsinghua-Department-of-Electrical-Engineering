#include <stdio.h>
int main ()
{
	char cha;
	printf("請輸入一個字符\n");
	cha= getchar();

	if (cha>='A' && cha<='Z')
		printf("輸入的字符屬於大寫字母");
	else if (cha>='a' && cha<='z')
		printf("輸入的字符屬於小寫字母");

	else if (cha == '!' || cha == '。')
		printf("輸入的字符屬於標點符號");

	else
		printf("輸入的字符屬於其他類");

	return 0;
}