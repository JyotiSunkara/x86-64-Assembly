#include<stdio.h>
extern long long int isPrime(long long int n);
int main(void)
{
	long long int n;
	scanf("%lld",&n);
	if(isPrime(n))
		printf("The number %lld is prime.\n",n);
	else
		printf("The number %lld is not prime.\n",n);
	return 0;
}
