#include <stdio.h>
int main ()
{
	int i,countwin,countlose;
		i = 0;
		countwin=0;
		countlose=0;

	char m[] = {'S','S','P','R','P','R','S','S','P','R' };
	char n[] = {'S','P','R','R','S','S','P','R','P','P' };

	for (i=0;i<=9;i++)
	{
		int judge (char a, char b);
		if (judge(m[i],n[i])== 1)
			countwin=countwin+1;
		else if (judge(m[i],n[i])== -1)
			countlose=countlose+1;
	}
	printf("¥Ò%dÐ`%d±Ñ",countwin,countlose);
	return 0;
}


int judge (char a, char b)
{
	int result;
	result = 0;

	//¥Ò¥X¥ÛÀY
	if((a == 'R') && (b=='S'))
		result = 1;
	else if ((a == 'R') && (b=='P'))
		result = -1;
	else if ((a == 'R') && (b=='R'))
		result = 0;
	//¥Ò¥X°Å¤M
	else if((a == 'S') && (b=='S'))
		result = 0;
	else if ((a == 'S') && (b=='P'))
		result = 1;
	else if ((a == 'S') && (b=='R'))
		result = -1;
	//¥Ò¥X¥¬
	else if((a == 'P') && (b=='S'))
		result = -1;
	else if ((a == 'P') && (b=='P'))
		result = 0;
	else if ((a == 'P') && (b=='R'))
		result = 1;

	return result;
}