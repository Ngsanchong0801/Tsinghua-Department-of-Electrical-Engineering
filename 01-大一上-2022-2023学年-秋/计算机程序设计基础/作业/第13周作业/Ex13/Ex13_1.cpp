#include <stdio.h>
#include <stdlib.h>
FILE*fp1,*fp2,*fp3,*fp4,*fp5;
int main()
{
	fp1=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\matrix_1.txt","r+");
	fp2=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\matrix_2.txt","r+");
	fp3=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\matrix_3.txt","r+");
	fp4=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\matrix_4.txt","r+");
	fp5=fopen("W:\\ConsoleApplication1\\Project\\Ex13\\info.txt","w+");
	if(fp1==NULL || fp2==NULL || fp3==NULL || fp4==NULL || fp5==NULL)
	{
		printf("This file could not be opened!\n");
		exit(0);
	}

	//存入矩陣大小
	int  size[10][2];
	while (!feof(fp1))
	{
		fscanf(fp1,"%d %d",&size[0][0],&size[0][2]);
		fprintf(fp5,"4martix_1是一個%d x %d矩陣\n",size[0][0],size[0][2]);
		break;
	};

	while (!feof(fp2))
	{
		fscanf(fp2,"%d %d",&size[1][0],&size[1][2]);
		fprintf(fp5,"martix_1是一個%d x %d矩陣\n",size[1][0],size[1][2]);
		break;
	};

	while (!feof(fp3))
	{
		fscanf(fp3,"%d %d",&size[2][0],&size[2][2]);
		fprintf(fp5,"martix_1是一個%d x %d矩陣\n",size[2][0],size[2][2]);
		break;
	};

	while (!feof(fp4))
	{
		fscanf(fp4,"%d %d",&size[3][0],&size[3][2]);
		fprintf(fp5,"martix_1是一個%d x %d矩陣\n",size[3][0],size[3][2]);
		break;
	};

	//判斷能否進行運算
	int add (int a,int b,int c,int d,int m,int n);
	int sub (int a,int b,int c,int d,int m,int n);
	int mul (int a,int b,int c,int d,int m,int n);
	int i,j,count;
	count=0;
	i=0;
	j=0;

	for (i=0;i<4;i++)
	{
		for (j=0;j<4;j++)
		{
			add(size[i][0],size[i][2],size[j][0],size[j][2],i+1,j+1);
			count++;
			sub(size[i][0],size[i][2],size[j][0],size[j][2],i+1,j+1);
			count++;
			mul(size[i][0],size[i][2],size[j][0],size[j][2],i+1,j+1);
			count++;
			fprintf(fp5,"\n");
		}
	}
	fprintf(fp5,"一共進行了%d次運算\n",count);







	fclose(fp1);
	fclose(fp2);
	fclose(fp3);
	fclose(fp4);
	return 0;
} 

int add (int a,int b,int c,int d,int m,int n)
{
	if(a<7 && b<7 && c<7 && d<7)
	{
		if (a==c && b==d)
		{
			fprintf(fp5,"矩陣%d和矩陣%d可以相加\n",m,n);
			int m[7][7];
			fgets(m[i],10,fp3);

		}
		else
		{
			fprintf(fp5,"矩陣%d和矩陣%d不可以相加\n",m,n);
		}
	}
	else
	{
		printf("矩陣大於7階");
	}
	return 0;
}

int sub (int a,int b,int c,int d,int m,int n)
{
	if(a<7 && b<7 && c<7 && d<7)
	{
		if (a==c && b==d)
		{
			fprintf(fp5,"矩陣%d和矩陣%d可以相減\n",m,n);
			


		}
		else
		{
			fprintf(fp5,"矩陣%d和矩陣%d不可以相減\n",m,n);
		}
	}
	else
	{
		printf("矩陣大於7階");
	}
	return 0;
}

int mul (int a,int b,int c,int d,int m,int n)
{
	if(a<7 && b<7 && c<7 && d<7)
	{
		if (b==c)
		{
			fprintf(fp5,"矩陣%d和矩陣%d可以相乘\n",m,n);




		}
		else
		{
			fprintf(fp5,"矩陣%d和矩陣%d不可以相乘\n",m,n);
		}
	}
	else
	{
		printf("矩陣大於7階");
	}
	return 0;
}