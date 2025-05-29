
#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "mem.h"


int main()
{
    char buf[sizeof(int)];

    poke(int, &buf, 33);

    printf("Value: %d\n", peek(int, &buf));

    return 0;
}
