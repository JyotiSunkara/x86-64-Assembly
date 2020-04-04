#include<stdio.h>
extern void merge(long long int *a,long long int *b,long long int c,long long int d,long long int *e);
int main()
{
	long long int n1,n2,i,n;
	long long int *ptr;
	scanf("%lld %lld",&n1,&n2); 
	long long int arr1[n1],arr2[n2];
	for(i=0;i<n1;i++)  
		scanf("%lld",&arr1[i]); 
	for(i=0;i<n2;i++)  
		scanf("%lld",&arr2[i]); 
	n=n1+n2;
	long long int arr[n];
	merge(&arr1[0],&arr2[0],n1,n2,&arr[0]);
	for(i=0;i<n;i++)  
		printf("%lld ",arr[i]); 
	printf("\n");
}




