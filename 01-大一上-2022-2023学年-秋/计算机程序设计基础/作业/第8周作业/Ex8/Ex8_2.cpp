#include<stdio.h>
#include<string.h>
int main()
{
	int location1,location2,i,j,m,n;
	m=0;
	n=0;
	i=0;
	j=0;
	location1=0;
	location2=0;
	int len=0;
	char name[50]={0},num[50]={0};
	char heart[26][100]=
	{
		"                                                             ",
		"                                                             ",
		"                *********           *********                ",
		"            *****************   *****************            ",
		"           ****************************************          ",		
		"         *******************************************         ",
		"        *********************************************        ",
		"        *********************************************        ",
		"        *********************************************        ",
		"        *********************************************        ",
		"        *********************************************        ",
		"        *********************************************        ",
		"         *******************************************         ",
		"          *****************************************          ",
		"           ***************************************          ",
		"            *************************************            ",
		"             ***********************************             ",
		"              *********************************              ",
		"                *****************************                ",
		"                  *************************                  ",
		"                    *********************                    ",
		"                       ***************                       ",
		"                          *********                          ",
		"                             ***                             ",
		"                                                             ",
		"                                                             "
	};

	printf("請輸入姓名、學號:\n");
	scanf("%s %s",name,num);
	printf("請輸入輸出起始位置:\n");
	scanf("%d %d",&location1,&location2);

	if (strlen(name)> strlen(num))
		len=strlen(name);
	else
		len=strlen(num);
	
	for(i=0;i<26;i++)
	{
		for (j=0;j<100;j++)
		{
			//名字比學號長
			if(strlen(name)>strlen(num))
			{
				//頭空白
				if(i==location1-2 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
				//輸出名字
				if (i==location1-1&& j==location2-1)
				{
					printf(" %s ",name);
					j=j+len+2;
				}
				//輸出學號
				if (i==location1 && j==location2-1)
				{
					printf(" %s ",num);
					//補空位
					for (m=0;m<(len-strlen(num));m++)
					{
						printf(" ");
					}
					j=j+len+2;
				}
				//尾空白
				if(i==location1+1 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
			}
			//學號比名字長
			if(strlen(name)<strlen(num))
			{
				//頭空白
				if(i==location1-2 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
				//輸出名字
				if (i==location1-1 && j==location2-1)
				{
					printf(" %s ",name);
					//補空位
					for (m=0;m<(len-strlen(name));m++)
					{
						printf(" ");
					}
					j=j+len+2;
				}
				//輸出學號
				if (i==location1 && j==location2-1)
				{
					printf(" %s ",num);

					j=j+len+2;
				}
				//尾空白
				if(i==location1+1 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
			}
			printf("%c",heart[i][j]);
		}

		printf("\n");
	}

	return 0 ;
}