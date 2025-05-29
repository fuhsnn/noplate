
#include <sys/types.h>
#include <stddef.h>
#include <assert.h>
#include <stdio.h>

// ... to get the implementation from github
#include "core.h"
#include "array.h"
#include "span.h"
#include "vec.h"
#include "string.h"
#include "string.c"


int main()
{
    string *a = string_init("abc");
    string *b = string_printf("%d", 3);
    string *c = string_concat(a, b);

    printf("%s\n", string_cstr(c));

    assert(string_length(c) + 1 == sizeof(string_cstr(c)));

    // don't let the array decay...
    auto s = &string_cstr(c);   // s has type char(*)[.len]
    (*s)[0] = 'A';

    printf("%s\n", *s);

#if 0
    (*s)[5] = 'a';  // this is bounds checked

    char *t = *s;   // array decays

    // not bounds checked anymore ;-(
    // (but counted_by will help check this as a best-effort in GCC 15)
    t[5] = 'b';     
#endif

    free(a);
    free(b);
    free(c);
}
