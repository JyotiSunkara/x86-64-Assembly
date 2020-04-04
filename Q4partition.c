#include<stdio.h>
extern void partition(long long int *a,long long int size);
int main()
{
	long long int N;
	scanf("%lld",&N);
	long long int arr[N];
	for(long long int i=0;i<N;i++)
		scanf("%lld",&arr[i]);
	partition(arr, N);
	printf("\nAfter partition:\n");
	for(long long int i=0;i<N;i++)
		printf("%lld ",arr[i]);
	printf("\n");
}
