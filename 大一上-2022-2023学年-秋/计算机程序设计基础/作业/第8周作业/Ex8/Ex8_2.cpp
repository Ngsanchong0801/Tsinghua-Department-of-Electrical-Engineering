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

	printf("�п�J�m�W�B�Ǹ�:\n");
	scanf("%s %s",name,num);
	printf("�п�J��X�_�l��m:\n");
	scanf("%d %d",&location1,&location2);

	if (strlen(name)> strlen(num))
		len=strlen(name);
	else
		len=strlen(num);
	
	for(i=0;i<26;i++)
	{
		for (j=0;j<100;j++)
		{
			//�W�r��Ǹ���
			if(strlen(name)>strlen(num))
			{
				//�Y�ť�
				if(i==location1-2 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
				//��X�W�r
				if (i==location1-1&& j==location2-1)
				{
					printf(" %s ",name);
					j=j+len+2;
				}
				//��X�Ǹ�
				if (i==location1 && j==location2-1)
				{
					printf(" %s ",num);
					//�ɪŦ�
					for (m=0;m<(len-strlen(num));m++)
					{
						printf(" ");
					}
					j=j+len+2;
				}
				//���ť�
				if(i==location1+1 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
			}
			//�Ǹ���W�r��
			if(strlen(name)<strlen(num))
			{
				//�Y�ť�
				if(i==location1-2 && j==location2-1)
				{
				for (n=0;n<len+2;n++)
					{
						printf(" ");
					}
				j=j+len+2;
				}
				//��X�W�r
				if (i==location1-1 && j==location2-1)
				{
					printf(" %s ",name);
					//�ɪŦ�
					for (m=0;m<(len-strlen(name));m++)
					{
						printf(" ");
					}
					j=j+len+2;
				}
				//��X�Ǹ�
				if (i==location1 && j==location2-1)
				{
					printf(" %s ",num);

					j=j+len+2;
				}
				//���ť�
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