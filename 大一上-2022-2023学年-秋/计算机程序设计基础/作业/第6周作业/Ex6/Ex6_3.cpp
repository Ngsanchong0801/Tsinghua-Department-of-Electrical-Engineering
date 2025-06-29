#include <stdio.h>
#include <string.h>
int main ()
{
	char word1[12], word2[12];
	int len1 = 0;
	int len2 = 0;
	int i,j; 
	int correct = 0;

	printf("Enter first word: \n");
	scanf("%s",word1);
	printf("Enter second word: \n");
	scanf("%s",word2);

	len1 = strlen(word1);
	len2 = strlen(word2);

	if (len1 == len2 )
	{
		for (i=0; i <len1; i++)
		{
			for (j = 0;j<len1;j++)
			{
				if (word1[i] == word2[j])
				{
				correct = correct + 1;
				word2[j] = 0;
				break;
				}
			}
		}
		if (correct == len1)
		{
			printf("The words are anagrams");
		}
		else
		{
			printf("The words are not anagrams");
		}
	}
	else
		printf("The words are not anagrams");

	return 0;
}
