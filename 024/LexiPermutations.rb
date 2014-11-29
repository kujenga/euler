#!/usr/bin/ruby

# (c) 2014 Aaron M. Taylor
# solution to project euler problem 24
# what is the millionth lexicographic permutiation of the digits 0-9?

def arrToNum(arr)
  n = 0
  arr.each {|d| n = n*10 + d}
  n
end

@calls = 0
@mil = 0

def recPerms(arr, n, pos)
  @calls += 1
  if (n == pos)
    return
  end
  STDOUT.write "\r#{arr} : #{@calls}"  
  for i in pos...n
    arr[pos],arr[i] = arr[i],arr[pos] #swaps elements
    recPerms(arr, n, pos+1)
    arr[pos],arr[i] = arr[i],arr[pos] #swaps elements back
  end
end

#recPerms((0..9).to_a, 10, 0)

def iter_perms(n)
  list=[]
  a = (0...n).to_a
  p = [0]*n
  i,j = 1,0
  list.push(a)
  while(i < n)
    if p[i] < i then
      j = i % 2 * p[i] # if even, equal to p[i], else 0
      a[j],a[i] = a[i],a[j] # swap elements
      STDOUT.write "\r#{a}"
      list.push(a)
      p[i] += 1
      i = 1
    else
      p[i] = 0
      i += 1
    end
  end
  return list
end

perms = []
#permute_map(ARGV[0].to_i) {|p| perms.push(p)}
perms = iter_perms(ARGV[0].to_i)
puts()
perms.sort! {|a,b| arrToNum(a) <=> arrToNum(b)}

if perms.length > 1000000
  puts(arrToNum(perms[1000000]))
end
