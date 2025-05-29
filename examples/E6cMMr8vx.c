// containerof
#include "core.h"
#include "variadic.h"



static void inc_int(variadic *x) { variadic_access(int, x)++; }
static bool tst_int(variadic *x) { return variadic_access(int, x); }
static void dbl_int(variadic *o, variadic *i)
{
    variadic_access(int, o) = 2 * variadic_access(int, i);
}

typedef struct genops {
    void (*increment)(variadic *);
    bool (*test)(variadic *);
    void (*dbl)(variadic *, variadic *);
} genops;

static const genops vt = { inc_int, tst_int, dbl_int };

static void generic_algo(genops vt, variadic *val)
{
    vt.dbl(val, val);

    if (vt.test(val))
        vt.increment(val);
}

static int int_algo(int x)
{
    variadic *m = variadic_make(int, x);
    generic_algo(vt, m);
    return variadic_access(int, m);
}

int main()
{
    return int_algo(17);
}

