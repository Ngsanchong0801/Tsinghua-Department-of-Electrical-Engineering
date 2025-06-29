//ÃD¥Ø3:
#include <stdio.h>
void main()
{
	int i,j;
	for (i=1; i< 10 ; i++) {
		for (j=1; j<= i ; j++)
			printf("%d*%d=%2d ",j,i,j*i);
		printf("\n");
	}
}