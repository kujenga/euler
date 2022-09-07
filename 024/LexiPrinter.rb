#!/usr/bin/ruby

# (c) 2014 Aaron M. Taylor
# solution to project euler problem 24
# what is the millionth lexicographic permutiation of the digits 0-9?

def to_num(arr)
  arr.inject {|n,d| n*10 + d}
end

def reverse_part(arr,start)
  ending = arr.length-1
  while start <= ending
    arr[start],arr[ending] = arr[ending],arr[start]
    start += 1
    ending -= 1
  end
end

perm = (0...ARGV[0].to_i).to_a
c = 1
STDOUT.write "\r#{to_num(perm)}"
while c < 1000000 and !(perm.each_cons(2).all? { |a, b| (b <=> a) <= 0 })
  k = 0
  for i in (0...perm.length-1)
    if perm[i] < perm[i+1] then k = i end
  end
  l = k+1
  for i in (k+1...perm.length)
    if perm [i] > perm[k] && perm[i] < perm[l] then l = i end
  end
  perm[k],perm[l] = perm[l],perm[k]
  reverse_part(perm,k+1)
  STDOUT.write "\r#{to_num(perm)}"
  c += 1
end
puts()
