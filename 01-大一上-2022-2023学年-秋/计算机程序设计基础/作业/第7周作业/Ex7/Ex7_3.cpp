#include <stdio.h>
#include <string.h>
int main()
{
	char sentence1[] = "(CNN) -- Beijing hosted one of the most memorable Summer Olympics in recent history -- now the Chinese capital is hoping to welcome the world's top Winter Games stars for the first time in a joint 2022 bid.";
	char sentence2[] = "The 2008 host, along with the northern city of Zhangjiakou, is vying with several European cities after having officially entered the bidding, according to the Chinese Olympic Committee (COC).";
	char sentence3[] = "Beijing would stage the ice events, reports the country's state-run news agency Xinhua, while snow-based competitions would take place in Zhangjiakou.";
	int i,count1,count2,count3,count4,count5;
	i=0;
	count1=0; 
	count2=0; 
	count3=0; 
	count4=0; 
	count5=0;

	int check(char sentence);
	int length;

	length=strlen(sentence1);
	for (i=0;i<length;i++)
	{
		if (check(sentence1[i])==1)
			count1=count1+1;
		else if (check(sentence1[i])==2)
			count2=count2+1;
		else if (check(sentence1[i])==3)
			count3=count3+1;
		else if (check(sentence1[i])==4)
			count4=count4+1;
		else if (check(sentence1[i])==5)
			count5=count5+1;
	}
	printf("Sentence1:\n  Uppercase letters:%d\n  Lowercase letters:%d\n  Numbers:%d\n  Spaces:%d\n  Others:%d\n",count1,count2,count3,count4,count5);

	count1=0; 
	count2=0; 
	count3=0; 
	count4=0; 
	count5=0;

	length=strlen(sentence2);
	for (i=0;i<length;i++)
	{
		if (check(sentence2[i])==1)
			count1=count1+1;
		else if (check(sentence2[i])==2)
			count2=count2+1;
		else if (check(sentence2[i])==3)
			count3=count3+1;
		else if (check(sentence2[i])==4)
			count4=count4+1;
		else if (check(sentence2[i])==5)
			count5=count5+1;
	}
	printf("Sentence2:\n  Uppercase letters:%d\n  Lowercase letters:%d\n  Numbers:%d\n  Spaces:%d\n  Others:%d\n",count1,count2,count3,count4,count5);

	count1=0; 
	count2=0; 
	count3=0; 
	count4=0; 
	count5=0;

	length=strlen(sentence3);
	for (i=0;i<length;i++)
	{
		if (check(sentence3[i])==1)
			count1=count1+1;
		else if (check(sentence3[i])==2)
			count2=count2+1;
		else if (check(sentence3[i])==3)
			count3=count3+1;
		else if (check(sentence3[i])==4)
			count4=count4+1;
		else if (check(sentence3[i])==5)
			count5=count5+1;
	}
	printf("Sentence3:\n  Uppercase letters:%d\n  Lowercase letters:%d\n  Numbers:%d\n  Spaces:%d\n  Others:%d\n",count1,count2,count3,count4,count5);

	count1=0; 
	count2=0; 
	count3=0; 
	count4=0; 
	count5=0;

	return 0;
}
int check(char sentence)
{
	int i,result;
	i=1;
	result=0;
	//大寫字母:1
	//小寫字母:2
	//數字:3
	//空格:4
	//其他:5
	if (sentence >='A' && sentence <='Z')
		result = 1;
	else if (sentence >='a' && sentence<='z')
		result = 2;
	else if (sentence >='0' && sentence<='9')
		result = 3;
	else if (sentence ==' ')
		result = 4;
	else
		result = 5;

	return result;
}






