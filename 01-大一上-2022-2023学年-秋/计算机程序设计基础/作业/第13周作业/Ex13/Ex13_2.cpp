#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
	FILE*fp1,*fp2,*fp3;
	fp1=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\KeBiao_input.txt","r");
	fp2=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\KeBiao_Modified.txt","w+");
	fp3=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\TiaoKe.txt","r");
	if(fp1==NULL || fp2==NULL || fp3==NULL)
	{
		getchar();
		printf("This file could not be opened!\n");
		exit(0);
	}

	char a[100][100],b[100][10],c[10][10];
	int i,j,k;
	i=0;
	j=0;
	k=0;

	int aa[100],bb[100],cc[10];

	while (!feof(fp3))
	{
		fgets(c[i],10,fp3);
		i++;
	};
	i=0;

	while (!feof(fp1))
	{
		fgets(a[j],100,fp1);

		for (i=0;i<3;i++)
		{
			if( a[j][1]==c[i][1])
			{
				a[j][1]=c[i][5];
			break	;
			}
		}
		//printf("%s",a[j]);
		j++;
	};

	int m,n,l;
	char tem[100][100];
	m=1;
	n=0;
	l=0;
	
	for (m=1;m<=10;m++)
	{
		for (n=0;n<10-m;n++)
		{
			if(a[n][1]>a[n+1][1])
			{
				strcpy(tem[n],a[n]);
				strcpy(a[n],a[n+1]);
				strcpy(a[n+1],tem[n]);
			}
		}
	}

	
	for (l=0;l<11;l++)
	{
		if (a[l][1]==']')
		{
			break;		
		}
		fputs(a[l],fp2);
		//printf("%s",a[l]);
	}

	fclose(fp1);
	fclose(fp2);
	fclose(fp3);
	return 0;
}