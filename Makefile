# Copyright 2021-2023. Martin Uecker
# All rights reserved. Use of this source code is governed by
# a BSD-style license which can be found in the LICENSE file.

CC ?= gcc
CFLAGS = -O2 -g -std=c23 -Wall -Wextra  -D_GNU_SOURCE
LDFLAGS =

CPPFLAGS= -iquote ./src/

SRCS = $(wildcard src/*.c)

.INTERMEDIATE: $(SRCS:.c=.o)

(%): %
	$(AR) $(ARFLAGS) $@ $%

lib/libnoplate.a: lib/libnoplate.a($(SRCS:.c=.o))

test: tests/list tests/maybe tests/span tests/string tests/vec
	# execstack -c test

tests/list: tests/list.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/list

tests/maybe: tests/maybe.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/maybe

tests/span: tests/span.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/span

tests/string: tests/string.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/string

tests/vec: tests/vec.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/vec



test_mdarray: test_mdarray.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-missing-braces -o $@ $^
	# execstack -c test

