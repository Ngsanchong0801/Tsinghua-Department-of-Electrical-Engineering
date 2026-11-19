#include <stdio.h>
#define  M  20
#define  N  20
int main ()
{
	double matric[M][N]={{0}};
	double max = 0;
	int col,row,i,j,m,n,a,b;
	col=0;
	row=0;
	i=0;
	j=0;
	m=0;
	n=0;

	printf("請輸入行和列數:\n");
	scanf("%d %d",&row,&col);
	printf("請輸入矩陣元素:\n");
	for (i=0;i<row;i++)
	{
		for (j=0;j<col;j++)
		{
			scanf("%lf",&matric[i][j]);
		}
	}

	for (m=0;m<row;m++)
	{
		for (n=0;n<col;n++)
		{
			if (matric[m][n]>max)
			{
				max = matric[m][n];
				a=m+1;
				b=n+1;
			}

		}
	}
	printf("最大元素值為%.6lf\n位于第%d行第%d列\n",max,a,b);
	return 0;
}