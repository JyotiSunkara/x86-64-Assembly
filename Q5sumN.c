#include<stdio.h>
extern long long int sumN(long long int n);
int main(void)
{
	long long int n;
	scanf("%lld",&n);
	printf("%lld\n",sumN(n));
	return 0;
}
