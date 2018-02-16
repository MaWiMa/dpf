#!/usr/bin/ruby

require 'prime'

n = [6,12,24,18,25,15] # ...for example

n.sort! # looks better, doesn't it?

r = n.reduce(1,:lcm) # we do this at first, because we need to know how many digits the result has (look at w1c).

w1c = r.to_s.length # width of first column (how many digits has the resulting number)

a = 1
k = []
w2c = 0 # width of second column (this will be expanded)
q = ""

n.each { |i|
  j = i.prime_division
  k = k|j
}

p = k.group_by(&:first).map { |f,l| 
  l.max
}

n.each { |b|
  printf("%" + w1c.to_s + "s ",b) # denominators (a)
  print "|" # vertical lineparts        
  b.prime_division.each { |f,l| # prime_division gives us an array with the specific prime(s) and the index, how often this prime(s) appear; example 24 =>[[2,3],[3,1]]
    l.times do print " ",f end
  }
  print "\n"
}

(w1c+1).times do print "-" end # horizontal line parts on right side
print "+" # intersection of horizontal and vertical lines 
p.each { |f,l|
  l.times do q.concat(" ",f.to_s) end # get primefactors for result
  w2c = w2c + l*2    
}
 
w2c.times do print "-" end  # horizontal line parts on right side

print "\n"
print r    # result (d)
print " |" # vertical line part
print q    # primefactors for result (c)
print "\n"
