#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "vec.h"


#define INDEX 5 // change to 10 to check bounds checking

// best-effort bounds checking with -fsanitize=object-size
static void foo(int *p) { p[INDEX] = 1; } 

int main()
{
    vec(int) *p = vec_alloc(int);

    for (int i = 0; i < 10; i++)
        vec_push(int, &p, i);
            
    int len = vec_length(int, p);

    auto vp = &vec2array(int, p);

    // bounds checking via dependent (=variably modified) types
    printf("%d\n", (*vp)[INDEX]);

    foo(vec2array(int, p));

    for (int i = 0; i < len; i++)
        printf("%d ", vec_pop(int, &p));

    printf("\n");
    free(p);
}
