#include <stdio.h>
int main()
{
	float CalcMoney(int nX,int nK);
	int a,b,sum1,sum2;
	a=0;
	b=0;
	sum1=0;
	sum2=0;

	scanf("%d %d",&a,&b);
	sum1= CalcMoney(a,b);

		printf("it should be %d.00",sum1);


	return 0;
}

float CalcMoney(int nXishouye ,int nKouzhao )
{
	int sum,count,diss1,diss2,mfinally;
	count= 14*nXishouye+4*nKouzhao;
	sum=0;
	diss1=0;
	diss2=0;

	
	if (nKouzhao>=nXishouye)
	{
		nKouzhao=nKouzhao-nXishouye;
		sum = 14*nXishouye + 4*nKouzhao;
	}
	else if (nKouzhao<nXishouye)
	{
		nKouzhao=0;
		sum = 14*nXishouye;
	}
	diss1 = sum/50;
	diss2=diss1*10;
	sum = sum-diss2;

	return sum;
}


