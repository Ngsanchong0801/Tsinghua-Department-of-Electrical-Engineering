#include <stdio.h>
#include <math.h>

#define Pi 3.1415926
int main ()
{
	//��r=1.5, h=2
	float r, h, S, V ;
	r=1.5;
	h=2;

	S = 2 * Pi * r * r + 2 * Pi * r * h;
	V = Pi * r * r * h; 

	printf("��W�����n�O%.2f\n��W����n�O%.2f\n",S,V);
	printf("\n");
	//��r�Mh���ۦ��J���ƭ�

	printf("�п�Jr���ƭ�:");
	scanf("%f",&r);

	printf("�п�Jh���ƭ�:");
	scanf("%f",&h);

	S = 2 * Pi * r * r + 2 * Pi * r * h;
	V = Pi * r * r * h; 

	printf("��W�����n�O%.2f\n��W����n�O%.2f\n",S,V);
	return 0;
}