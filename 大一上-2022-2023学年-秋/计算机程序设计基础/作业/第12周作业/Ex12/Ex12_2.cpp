#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
	int sub_strings( const char* str1, const char* str2);
	char a[100]="";
	char b[100]="";
	int len1,len2;
	len1=0;
	len2=0;

	printf("�п�J�@�Ӧr�Ŧ�\n");
	scanf("%s",a);
	len1=strlen(a);
	if (len1>20)
	{
		printf("�r�ƶW�L20!!");
		exit(0);
	}

	printf("�п�J�l�r�Ŧ�\n");
	scanf("%s",b);
	len2=strlen(b);
	if (len2>20)
	{
		printf("�r�ƶW�L20!!");
		exit(0);
	}

	printf("�l�r�Ŧ�X�{�F%d��\n",sub_strings(a,b));
	return 0;
}

int sub_strings( const char* str1, const char* str2)
{
	int times,len_a,len_b,i,j;
	j=0;
	i=0;
	times=0;
	len_a=strlen(str1);
	len_b=strlen(str2);
	char a[100]="";

	for (i=0;i<len_a;i++)
	{
		for (j=0;j<len_b;j++)
		{
			a[j]=str1[i+j];
		}
		if (strcmp(a,str2)==0)
		{
			times++;
		}
	}
	return times;
}