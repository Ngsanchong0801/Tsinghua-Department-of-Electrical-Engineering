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

	printf("�п�J��M�C��:\n");
	scanf("%d %d",&row,&col);
	printf("�п�J�x�}����:\n");
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
	printf("�̤j�����Ȭ�%.6lf\n��_��%d���%d�C\n",max,a,b);
	return 0;
}