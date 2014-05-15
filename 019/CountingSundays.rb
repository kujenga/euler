
require 'date'

Date.new(1901).step(Date.new(2000,-1,-1)).select{|d| d.sunday? & (d.day == 1) }.size
