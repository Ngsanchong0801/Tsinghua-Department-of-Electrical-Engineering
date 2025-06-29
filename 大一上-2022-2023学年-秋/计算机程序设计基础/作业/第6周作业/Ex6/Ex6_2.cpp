#include <stdio.h>
int main()
{
	int i,up,num;
	i=0;
	up=0;
	num=0;

	char sentence1[500] ="(CNN) -- Beijing hosted one of the most memorable Summer Olympics in recent history -- now the Chinese capital is hoping to welcome the world's top Winter Games stars for the first time in a joint 2022 bid.";

	for(i=0;i<=500;i++)
	{
		if (sentence1[i]>='A'&& sentence1[i]<='Z')
		{
			up=up+1;
		}

		else if (sentence1[i]>= '0' && sentence1[i]<= '9')
		{
			num=num+1;
		}




	}
	printf("%d\n",up);
	printf("%d",num);

}