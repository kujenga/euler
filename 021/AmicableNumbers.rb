#!/usr/bin/ruby

# (c) 2014 Aaron.M. Taylor
# Solution to Project Euler problem 21

def d(n)
  p_div_sum = 0
  for i in 1..(n/2+1)
    if n%i == 0
      p_div_sum += i
      #print(i.to_s+",")
    end
  end
  p_div_sum
end

start = Time.now

max = ARGV[0].to_i

full_sum = 0
for a in 1..max
  b = d(a)
  if (a != b) && (a == d(b))
    full_sum += a # finds each number twice due to symmetry, so for now just add only one of the pairs
  end
end

finish = Time.now

print((finish - start).to_s+": "+full_sum.to_s+"\n")
