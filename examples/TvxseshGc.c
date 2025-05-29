#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "vec.h"
#include "span.h"
#include "array.h"


static void bar(span(int) v)
{
    int sum = 0;

    for (int i  = 0; i < span_length(int, &v); i++)
        sum += span_access(int, &v, i);

    printf("sum %d\n", sum);
}

int main()
{
    vec(int) *p = vec_alloc(int);

    for (int i = 0; i < 10; i++)
        vec_push(int, &p, i);
            
    bar(vec2span(int, p));

    free(p);
}
