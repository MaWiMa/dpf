#!/usr/bin/ruby

require 'prime'

n = [6,12,24,18,25,15] # ...for example

n.sort! # looks better, doesn't it?

r = n.reduce(1,:lcm) # we do this at first, because we need to know how many digits the result has (look at w1c).

w1c = r.to_s.length # width of first column (how many digits has the resulting number)

n.each { |b|
  printf("%" + w1c.to_s + "s |",b) # only eye-catching (in my opinion) not needed to get at way to our result
  b.prime_division.each { |f,l| # prime_division gives us an array with the specific prime(s) and the index, how often this prime(s) appear; example 24 =>[[2,3],[3,1]]
    l.times do print " ",f end
  }
  print "\n"
}

(w1c+1).times do print "-" end
print "+"

print "\n"
print r," |"

a=1
k = []
n.each { |i|
  j = i.prime_division
  k = k|j
}

k.group_by(&:first).map { |f,l| 
  l.max
}.each { |f,l|
  l.times do print " ",f  end
}
print "\n"

