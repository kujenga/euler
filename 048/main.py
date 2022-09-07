#!/usr/bin/env python3

# Bit of a cheap solution using arbitrary precision integers...

v = 0
for i in range(1, 1001):
    print(f'{i}^{i}')
    v += i ** i

print(str(v)[-10:])
