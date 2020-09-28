#include <stdio.h>
long long int fib(long long int n)
{
    int f1 = 0, f2 = 1, f3;
    if (n <= 1)
        f1 = 0;
    else
    {
        for (int now = 0; now < n; now++)
        {
            f3 = f1 + f2;
            f1 = f2;
            f2 = f3;
        }
    }
    printf("%d\n", f1);
    return f1;
}