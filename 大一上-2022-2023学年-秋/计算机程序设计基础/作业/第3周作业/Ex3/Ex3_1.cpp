#include <stdio.h>
#include <math.h>

#define Pi 3.1415926
int main ()
{
	//當r=1.5, h=2
	float r, h, S, V ;
	r=1.5;
	h=2;

	S = 2 * Pi * r * r + 2 * Pi * r * h;
	V = Pi * r * r * h; 

	printf("圓柱的表面積是%.2f\n圓柱的體積是%.2f\n",S,V);
	printf("\n");
	//當r和h為自行輸入的數值

	printf("請輸入r的數值:");
	scanf("%f",&r);

	printf("請輸入h的數值:");
	scanf("%f",&h);

	S = 2 * Pi * r * r + 2 * Pi * r * h;
	V = Pi * r * r * h; 

	printf("圓柱的表面積是%.2f\n圓柱的體積是%.2f\n",S,V);
	return 0;
}