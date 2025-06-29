#include <stdio.h>
#include <string.h>
int main ()
{
	void reverse_string( const char* str_in, char* str_out);
	char arr1[10]="Goodnight", arr2[10]="";

	reverse_string(arr1,arr2);
	printf("%s\n",arr1);
	printf("%s\n",arr2);
	
	return 0;
}

void reverse_string( const char* str_in, char* str_out)
{
	int i,j,len;
	len=strlen(str_in);
	i=0;
	j=0;

	for (i=len-1;i>=0;i--)
	{
			str_out[j]=str_in[i];
			j++;
	}
}