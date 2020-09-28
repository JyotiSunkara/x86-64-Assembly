#include <stdio.h>
extern int FIBB(int n);

int main()
{
    int n;
    scanf("%d",&n);
    printf("%d", FIBB(n));
    return 0;
}