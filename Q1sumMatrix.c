#include<stdio.h>
extern long long int sum2d(long long int *a,long long int rows,long long columns);
int main()
{
	long long int N,M;
	scanf("%lld %lld",&N,&M);
	long long int arr[N][M];
	for(long long int i=0;i<N;i++)
		for(long long int j=0;j<M;j++)
			scanf("%lld",&arr[i][j]);
	printf("%lld\n",sum2d(&arr[0][0],N,M));
}
