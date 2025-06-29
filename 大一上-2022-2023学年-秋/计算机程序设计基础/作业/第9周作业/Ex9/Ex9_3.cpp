#include <stdio.h>
#include <string.h>
enum Course{KONG,tiyu,xianxingdaishu,weijifen,cyuyan,yingyu};
enum Course k; 
char timetable[6][7]={{KONG,KONG,tiyu,weijifen,KONG,KONG,KONG},
	                  {tiyu,KONG,KONG,KONG,yingyu,KONG,cyuyan},
	                  {KONG,KONG,cyuyan,KONG,KONG,KONG,KONG},
	                  {xianxingdaishu,weijifen,yingyu,KONG,xianxingdaishu,KONG,KONG},
	                  {KONG},
	                  {KONG}};
int main()
{
	void show( enum Course a  );
	char lesson2[50];

	scanf("%s",lesson2);
	if (strcmp(lesson2,"tiyu")==0)
		k = tiyu;
	else if (strcmp(lesson2,"xianxingdaishu")==0)
		k = xianxingdaishu;
	else if (strcmp(lesson2,"weijifen")==0)
		k = weijifen;
	else if (strcmp(lesson2,"cyuyan")==0)
		k = cyuyan;
	else if (strcmp(lesson2,"yingyu")==0)
		k = yingyu;

	show ( k );
	return 0;
}

void show( enum Course a  )
{
	int i,j;
	i=0;
	j=0;
	
	for(i=0;i<6;i++)
	{
		for (j=0;j<7;j++)
			if (a == timetable[i][j])
			{
				printf("%d-%d\n",j+1,i+1);
			}
	}
}