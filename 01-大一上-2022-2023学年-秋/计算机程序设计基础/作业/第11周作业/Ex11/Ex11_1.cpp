#include <stdio.h>
int main ()
{
	void split_time ( long int total_sec, int *hr, int* min, int * sec );
	int time,m,n,p;
	time=56789;
	m=0;
	n=0;
	p=0;

	split_time(time,&m,&n,&p);
	printf("%2d:%2d:%2d\n",m,n,p);

	return 0;
}

void split_time ( long int total_sec, int *hr, int* min, int * sec )
{
	int a,b,c;
	a=0;
	b=0;
	c=0;

	a=total_sec/3600;
	b=(total_sec-a*3600)/60;
	c=total_sec-a*3600-b*60;

	*hr = a;
	*min = b;
	*sec = c;
}