#!/usr/bin/env python3

s = ""
i = 0
while True:
    i += 1
    s += str(i)
    if len(s) > 1000000:
        break

#  print(s)

v = 1
for j in range(0, 7):
    k = 10 ** j - 1
    print(j, k, s[k])
    v *= int(s[k])

print(v)
