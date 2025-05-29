
#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "maybe.h"


static maybe(int) divide(int a, int b) 
{ 
    return (b != 0) ? maybe_ok(int, a / b) : maybe_fail(int);
}

int main()
{
    int d = 2; // 0

    maybe(int) p = divide(6, d);

    if (p.ok) {

        printf("%d\n", maybe_just(int, p));

    } else {

        printf("division by zero\n");
        fflush(stdout);
    }

    return 0;
}

