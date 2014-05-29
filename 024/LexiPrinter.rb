#!/usr/bin/ruby

def to_num(arr)
  arr.inject {|n,d| n*10 + d}
end

def sort_part(arr,start)
  start.upto(arr.length - 1) do |i|
    value = arr[i]
    j = i + 1
    while j < arr.length and arr[j] < value
      arr[j-1] = arr[j]
      j += 1
    end
    arr[j-1] = value
  end
  arr
end

perm = (0...ARGV[0].to_i).to_a
c = 1
#STDOUT.write "\r#{perm}"
puts(to_num(perm))
while c < 1000001 and !(perm.each_cons(2).all? { |a, b| (b <=> a) <= 0 })
  k = 0
  for i in (0...perm.length-1)
    if perm[i] < perm[i+1] then k = i end
  end
  l = k+1
  for i in (k+1...perm.length)
    if perm [i] > perm[k] && perm[i] < perm[l] then l = i end
  end
  perm[k],perm[l] = perm[l],perm[k]
  sort_part(perm,fst+1)
  puts(to_num(perm))
  #STDOUT.write "\r#{perm}"
  c += 1
end
puts()
puts("#{to_num(perm)} : #{c}")
