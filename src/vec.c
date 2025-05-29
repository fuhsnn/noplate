/* Copyright 2021-2025. Martin Uecker
 * All rights reserved. Use of this source code is governed by
 * a BSD-style license which can be found in the LICENSE file.
 * */

#include "vec.h"

#if (GCC_VERSION < 110300) && !defined __clang__
_Thread_local struct vec_a vec_array_tmp = { 0 };
#endif

extern inline ssize_t vec_capacity_auto(ssize_t x);
