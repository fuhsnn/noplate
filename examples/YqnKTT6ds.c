
#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "array.h"


int main()
{
    char str[] = "hallo";

    auto slice = &array_slice(str, 1, 1 + 3);
    (*slice)[0] = 'A';
    (*slice)[1] = 'L';
    (*slice)[2] = 'L';

    puts(str);
}
