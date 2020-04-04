#include<stdio.h>
extern long long int binarySearch(long long int *a,long long int size,long long int element);
int main()
{
	long long int N;
	scanf("%lld",&N);
	long long int arr[N];
	for(long long int i=0;i<N;i++)
		scanf("%lld",&arr[i]);
	long long int el;
	scanf("%lld",&el);
	printf("The element is found at index %lld\n",binarySearch(arr,N,el));
}
