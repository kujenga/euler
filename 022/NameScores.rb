#!/usr/bin/ruby

# (c) 2014 Aaron Taylor
# solution to project euler 22

CHAR_START = 64

def name_value(name)
  val = 0
  name.chars {|c| val += c.ord - CHAR_START}
  val
end

def read_file(filename)
  txt = File.read(filename)
  names = txt.scan(/".*?"/) # regex to match each name
  names.map! { |n| n = n[1...(n.length-1)] } # strips off quotes and commas
  names
end

if __FILE__ == $0
  names = read_file("names.txt")
  names.sort! { |a,b| a <=> b } # sorts alphabetically
  total = 0
  names.each_index { |i| total += name_value(names[i])*(i+1) }
  print(total.to_s + "\n" )
end
