#!/usr/bin/ruby

# (c) 2014 Aaron M. Taylor
# Project Euler problem 20

def factorial(n)
  if n > 1
    n * factorial(n-1)
  else
    1
  end
end

sum_str = 0
factorial(100).to_s.chars.each { |a| sum_str +=a.to_i }
print("String parsing solution: "sum_str.to_s+"\n")

x = factorial(100)
sum = 0
while (x > 0)
  sum += x%10
  x = x/10
end
print("Numerical solution: "sum+"\n")
