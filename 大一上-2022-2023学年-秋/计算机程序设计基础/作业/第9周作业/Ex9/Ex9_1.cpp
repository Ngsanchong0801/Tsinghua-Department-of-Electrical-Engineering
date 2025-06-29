#include <stdio.h>
#include <string.h>
struct Result
{
	char name[40];
	int num;
	int normal;
	int mid;
	int final;
	char level[20];
}person[4]={{"丁一",2022010000,100,100,100," "},{"丁二",2022010001,80,50,50," "},{"丁三",2022010002,90,88,77," "},{"丁四",2022010003,96,84,50," "}};

int main()
{
	int count(int a,int b,int c);
	int i;
	int mark[4];
	i=0;

	for (i=0;i<4;i++)
	{
		mark[i]= count(person[i].normal,person[i].mid,person[i].final);

		if (mark[i]<=100 && mark[i]>=95)
			strcpy(person[i].level,"A");
		else if (mark[i]<=94 && mark[i]>=90)
			strcpy(person[i].level,"A-");
		else if (mark[i]<=89 && mark[i]>=85)
			strcpy(person[i].level,"B+");
		else if (mark[i]<=84 && mark[i]>=80)
			strcpy(person[i].level,"B");
		else if (mark[i]<=79 && mark[i]>=77)
			strcpy(person[i].level,"B-");
		else if (mark[i]<=76 && mark[i]>=73)
			strcpy(person[i].level,"C+");
		else if (mark[i]<=72 && mark[i]>=70)
			strcpy(person[i].level,"C");
		else if (mark[i]<=69 && mark[i]>=67)
			strcpy(person[i].level,"C-");
		else if (mark[i]<=66 && mark[i]>=63)
			strcpy(person[i].level,"D+");
		else if (mark[i]<=62 && mark[i]>=60)
			strcpy(person[i].level,"D");
		else if (mark[i]<=59 && mark[i]>=0)
			strcpy(person[i].level,"F");

		printf("(學生%d)\n姓名: %s\n學號: %d\n數學平時成績: %d\n數學期中成績: %d\n數學期末成績: %d\n數學最終成績: %s\n",i+1,person[i].name,person[i].num,person[i].normal,person[i].mid,person[i].final,person[i].level);
		printf("\n");
	}
	
	return 0;
}

int count(int a,int b,int c)
{
	int score;
	score = 0;

	score=a*0.5+b*0.2+c*0.3+0.5;

	return score;
}