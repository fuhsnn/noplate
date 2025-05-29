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

test: tests/list tests/maybe tests/span tests/string tests/vec tests/variadic
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

tests/variadic: tests/variadic.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	tests/variadic

# 9bh6sPc3K / hhT98vM7Y require nested functions
examples: examples/4n7vE3jTh examples/TvxseshGc examples/MMKEdG3or \
 examples/3WsWzfcKK examples/YqnKTT6ds examples/hjMaM3K3Y examples/xeYfn17zG \
 examples/sjbT453dM examples/E6cMMr8vx

examples/4n7vE3jTh: examples/4n7vE3jTh.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/4n7vE3jTh | md5sum | grep -q e952d7233d4efeddc809ae617814b021

examples/TvxseshGc: examples/TvxseshGc.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/TvxseshGc | md5sum | grep -q 67c4d8fa4a5ee32765a817b5fb7ee0b2

examples/MMKEdG3or: examples/MMKEdG3or.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/MMKEdG3or | md5sum | grep -q f799d4d9561d0c8fd0085f12ac7642f8

examples/3WsWzfcKK: examples/3WsWzfcKK.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/3WsWzfcKK | md5sum | grep -q 6d7fce9fee471194aa8b5b6e47267f03

examples/YqnKTT6ds: examples/YqnKTT6ds.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/YqnKTT6ds | md5sum | grep -q 2df8bfac4665ecf57d9e59efa87adb96

examples/hjMaM3K3Y: examples/hjMaM3K3Y.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/hjMaM3K3Y | md5sum | grep -q 91d85da8bb7ad96cd040be4eca026160

examples/xeYfn17zG: examples/xeYfn17zG.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/xeYfn17zG | md5sum | grep -q 9ca49815df0df7ace8ab74f10c2ba4a8

examples/sjbT453dM: examples/sjbT453dM.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/sjbT453dM | md5sum | grep -q b0e8e34df326ded2c6d06cc53d7a16c3

examples/E6cMMr8vx: examples/E6cMMr8vx.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^
	examples/E6cMMr8vx | md5sum | grep -q d41d8cd98f00b204e9800998ecf8427e

test_mdarray: test_mdarray.c lib/libnoplate.a
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -Wno-missing-braces -o $@ $^
	# execstack -c test

