# project euler - problem 28
# (c) 2014 Aaron Taylor

width = 1001

total = 1
inc = 2
cur = 1
n = 1
while cur < (width**2):
	cur += inc
	total += cur
	if n != 0 and n % 4 == 0:
		inc += 2
	n += 1

print total
