#!/usr/bin/ruby
require 'prime'

 n = [26,30,39,65,123,143,154,195,\
    226,231,462,625,715,997,1430,2310,5,6,12,15,18,21,22,24,25,].sort!
 r = n.reduce(1,:lcm) # we do this at first, because we need to know how many digits the result has.
 k = []  # starts empty, helps to get uniq primefactors 
 s = []  # starts empty, helps to do spacing in cell (b)
 q = ""  # later primefactors are concatenated for (c) 
sl = "┼" # intersection of horizontal and vertical lines with u+253c
hl = "─" # horizontal line part with u+2500
vl = "│" # vertical line part with u+2502 


n.each { |i|
  j = i.prime_division # get all primefactors
  k = k|j              # only uniq primefactors needed
}

p = k.group_by(&:first).map { |f,l| 
  l.max
} # get the array of the primefactors for result, only primefactors with highest index (l.max) needed
p.sort! # this is needed for (c) and positions in (b)

p.each { |f,l|
  s << (f.to_s.length + 1)*l # needed space (number of digits plus one whitespace) for each col in (b)
  l.times do q.concat(" ",f.to_s) end # get primefactors for result
}

2.times do print "\n" end # only format things

n.each { |b|
  a = b.prime_division
  printf("%" + (r.to_s.length+1).to_s + "s ",b) # print denominators (a)
  print vl # upper vertical line part 
  a.each { |f,l| # prime_division gives us an array with the specific prime(s) and the index, how often prime(s) appear; example 24 =>[[2,3],[3,1]]
    z = a.index([f,l])
    (0..p.length-1).each { |i| # count every primefactor in array p
      if f > p[i][0]
        if z == 0 # if first b prime is bigger then p prime
          (s[i]).times do print " " end # then move to next prime (position) with whitespaces
        elsif z <= i and p[i][0] > a[(z-1)][0] # if b prime is bigger than p prime and p prime is bigger than last b prime
          (s[i]).times do print " " end # then (dito)
        end
      elsif f == p[i][0] # if b prime == p prime do
        l.times do print " ",f end # then print the specific primefactor as often as it appears in b
        (s[i]-(f.to_s.length + 1)*l).times do print " " end # and fill the space to next prime with whitespaces
      end
    }
  }
  print "\n"
}

print " " # only format things
(r.to_s.length+1).times do print hl end # horizontal line parts on left side
print sl # intersection
s.sum.times do print hl end  # horizontal line on right side
print "\n" # only format things
print " "  # only format things
print r    # result (d)
print " "  # only format things
print vl   # lower vertical line part
print q    # primefactors for result (c)
3.times do print "\n" end # only format things
