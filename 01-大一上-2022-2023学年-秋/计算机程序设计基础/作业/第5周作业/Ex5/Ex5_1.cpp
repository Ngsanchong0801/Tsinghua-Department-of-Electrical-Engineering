 #include<stdio.h>
#include<string.h>
int main()
{
	char word[100];
	int i=0;
	int sum=0;
	scanf("%s", word);

	for(i=0;i<strlen(word);i++)
	{
	sum=sum+word[i]-64;
	}

	printf("%d",sum);

	return 0;
}