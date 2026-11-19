#include <stdio.h>
#include <stdlib.h>
int main()
{
	FILE*fp1,*fp2;
	fp1=fopen("S1.txt","r");
	fp2=fopen("S2.txt","w+");

	if(fp1==NULL || fp2==NULL)
	{
		printf("This file could not be opened!\n");
		exit(0);
	}

	int change,i;
	i=0;
	change=0;
	char a;

	printf("凱撒加密程序(讀入s1.txt,加密後寫入s2.txt)\n");
	printf("請輸入密鈅(1-25):");
	scanf("%d",&change);

	while (!feof(fp1))
	{
		a=fgetc(fp1);

		if ((a>='A' && a<='Z'))
		{
			a=a+change;
			if (a>'Z')
			{
				a=a-90;
				a=a+64;
				fputc(a,fp2);
				i++;
				continue;
			}
			fputc(a,fp2);
			i++;
			continue;
		}
		else if ((a>='a' && a<='z'))
		{
			a=a+change;
			if(a>'z')
			{
				a=a-122;
				a=a+96;
				fputc(a,fp2);
				i++;
				continue;
			}
			fputc(a,fp2);
			i++;
			continue;
		}

		fputc(a,fp2);
		i++;
	}
	printf("加密完成,共加密%d個字母",i);
	fclose(fp1);
	fclose(fp2);
	return 0;
}