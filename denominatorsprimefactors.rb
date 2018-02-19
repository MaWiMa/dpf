#!/usr/bin/ruby

require 'prime'

n = [6,12,24,18,25,15,30] # ...for example

n.sort! # looks better, doesn't it?

r = n.reduce(1,:lcm) # we do this at first, because we need to know how many digits the result has (look at w1c).

w1c = r.to_s.length # width of first column (how many digits has the resulting number)

k = []  # starts empty, helps to get uniq primefactors 
s = []  # starts empty, helps to do spacing in cell (b)
w2c = 0 # width of second column (this will be expanded)
q = ""

n.each { |i|
  j = i.prime_division # get all primefactors
  k = k|j              # only uniq primefactors needed
}

p = k.group_by(&:first).map { |f,l| 
  l.max
} # get the array of the primefactors for result, only primefactors with highest index (l.max) needed

p.each { |f,l|
  s << l*2 # should give the needed space for each col in (b)
  l.times do q.concat(" ",f.to_s) end # get primefactors for result
  w2c = w2c + l*2
}

2.times do print "\n" end # only format things

n.each { |b|
  printf("%" + (w1c+1).to_s + "s ",b) # print denominators (a)
  print  "│"                          # print vertical lineparts with u+2502
  b.prime_division.each { |f,l|       # prime_division gives us an array with the specific prime(s) and the index, how often prime(s) appear; example 24 =>[[2,3],[3,1]]
    (0..p.length-1).each { |i| #  count every primefactor in array p
      if f == p[i][0] # if b prime == p prime do
        l.times do print " ",f end # print the specific primefactor as often as it appears in b
        (s[i]-l*2).times do print " " end # fill the space to next prime with whitespaces
      end
    }
  }
  print "\n"
}

print " " # only format things
(w1c+1).times do print "─" end # horizontal line parts on right side with u+2500
print "┼" # intersection of horizontal and vertical lines with u+253c
 
w2c.times do print "─" end  # horizontal line parts on right side with u+2500

print "\n" # only format things
print " "  # only format things
print r    # result (d)
print " "  # only format things
print "│"  # vertical line part with u+2502
print q    # primefactors for result (c)

3.times do print "\n" end # only format things

