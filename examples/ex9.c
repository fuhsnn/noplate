#include <sys/types.h>
#include <stdio.h>

#include "core.h"
#include "vec.h"
#include "span.h"
#include "array.h"


static int array_sum(int N, int (*p)[N])
{
    return N ? (*p)[0] + array_sum(N - 1, &array_slice(*p, 1, N)) : 0;
}

static void bar(span(int) v)
{
    for (int i  = 0; i < span_length(int, &v); i++)
        (span2array(int, &v))[i] *= 2;

    int sum = array_sum(span_length(int, &v), &span2array(int, &v));

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
