#include <stdio.h>
#include <string.h>
int main()
{
	int checkup (char a[]);
	int checklow (char a[]);
	int checknum (char a[]);
	int checkoth (char a[]);

	int length,count,i;
	i=0;
	length=0;
	count=0;
	char pass[30];
	scanf("%s",pass);
	length=strlen(pass);

	if (length>=8 && length<=30)
	{
		for(i=0;i<length;i++)
		{
			count= checklow(pass)+checknum(pass)+checkup(pass)+checkoth(pass);
		}
		if(count>=3)
		{
			printf("Sting ""%s"" is ok",pass);
		}
		else
		{
			printf("Sting ""%s"" is not ok",pass);
		}

	}
	else
	{
		printf("Sting ""%s"" is not ok",pass);
	}
	return 0;
}

int checkup (char a[])
{
	int i,result1;
	i=0;
	result1=0;

	for (i=0;i<=strlen(a);i++)
	{
		if (a[i]>='A' && a[i]<='Z')
		{
			result1=1;
		}

	}
	return result1;
}

int checklow (char a[])
{
	int i,result2;
	i=0;
	result2=0;

	for (i=0;i<=strlen(a);i++)
	{
		if (a[i]>='a' && a[i]<='z')
		{
			result2=1;
		}

	}
	return result2;
}
int checknum (char a[])
{
	int i,result3;
	i=0;
	result3=0;

	for (i=0;i<=strlen(a);i++)
	{
		if (a[i]>='0' && a[i]<='9')
		{
			result3=1;
		}

	}
	return result3;
}

int checkoth (char a[])
{
	int i,result4;
	i=0;
	result4=0;

	for (i=0;i<=strlen(a);i++)
	{
		if (a[i]>127 || a[i]<1 )
		{
			result4=1;
		}

	}
	return result4;
}