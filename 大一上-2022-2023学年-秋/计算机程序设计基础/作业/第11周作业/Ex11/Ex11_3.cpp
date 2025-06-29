#include <stdio.h>
	
int main ()
{
	int * find_middle( int a[], int n );

	int  naData[10]={0,1,2,3,4,5,6,7,8,9}, 
		 naData2[11]={9,8,7,5,4,3,2,1};


	printf("%d\n",*find_middle( naData, 3 ));
	printf("%d\n",*find_middle( naData2, 4 ));

	return 0;
}

int * find_middle( int a[], int n )
{
	int len,num;
	int *p=0;
	len=n;
	num=0;

	if (len%2==1)
	{
		num=a[((len+1)/2)-1];
	};
	if (len%2==0)
	{
		num=a[(len)/2];
	};

	p=&num;
	return p;
}