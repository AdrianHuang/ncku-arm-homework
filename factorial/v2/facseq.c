#include <stdio.h>

extern int fac(int x);

int main(int argc, char **argv)
{
	int number=0;
 	int result=0;
	
	printf("Please input a number:");
	scanf("%d",&number);
	
	result = fac(number);
	
	printf("The factorial of %d is: %d\n", number, result);

	return 0;
}

