#!/usr/bin/ruby

# (c) 2014 Aaron M. Taylor
# solution to project euler problem 25
# finding the first number in the fibonacci sequence containing 1000 digits

term = 1
last = 0
cur = 1
while (cur.to_s.size < 1000)
  term += 1
  nxt = last + cur
  last = cur
  cur = nxt
end

print(term.to_s + "\n")
