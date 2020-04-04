#include<stdio.h>
extern long long int parityCheck(long long int n);
int main(void)
{
	long long int n;
	scanf("%lld",&n);
	if(parityCheck(n))
		printf("The number %lld contains odd number of 1s.\n",n);
	else
		printf("The number %lld contains even number of 1s.\n",n);
	return 0;
}
