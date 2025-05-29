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
examples: examples/ex1 examples/ex2 examples/ex5 examples/ex8 examples/ex9 examples/ex10 examples/ex11

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

examples/ex1: examples/ex1.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex1 | md5sum | grep e952d7233d4efeddc809ae617814b021

examples/ex2: examples/ex2.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex2 | md5sum | grep 67c4d8fa4a5ee32765a817b5fb7ee0b2

examples/ex5: examples/ex5.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex5 | md5sum | grep 6d7fce9fee471194aa8b5b6e47267f03

examples/ex8: examples/ex8.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex8 | md5sum | grep 2df8bfac4665ecf57d9e59efa87adb96

examples/ex9: examples/ex9.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex9 | md5sum | grep 91d85da8bb7ad96cd040be4eca026160

examples/ex10: examples/ex10.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex10 | md5sum | grep 9ca49815df0df7ace8ab74f10c2ba4a8

examples/ex11: examples/ex11.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/ex11 | md5sum | grep b0e8e34df326ded2c6d06cc53d7a16c3

test_mdarray: test_mdarray.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-missing-braces -o $@ $^
	# execstack -c test

