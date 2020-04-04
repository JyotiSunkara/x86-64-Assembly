#include <stdio.h>
extern void reverse(char *s);
int main()
{
	char s[1000];
	scanf("%s", s);
	reverse(&s[0]);
	printf("The string after reversal is %s", s);
}
