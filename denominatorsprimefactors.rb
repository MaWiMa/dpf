#!/usr/bin/ruby

require 'prime'

n = [6,12,24,18,25,15,30,5,11,13,26,39,65] # ...for example

n.sort! # not really needed

r = n.reduce(1,:lcm) # we do this at first, because we need to know how many digits the result has (look at w1c).

w1c = r.to_s.length # width of first column (how many digits has the resulting number)

k = []  # starts empty, helps to get uniq primefactors 
s = []  # starts empty, helps to do spacing in cell (b)
w2c = 0 # width of second column (this will be expanded)
q = ""  # later primefactors are concatenated for (c) 

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
  w2c = w2c + (f.to_s.length + 1)*l
}

2.times do print "\n" end # only format things

n.each { |b|
  a = b.prime_division
  printf("%" + (w1c+1).to_s + "s ",b) # print denominators (a)
  print  "│"                          # print vertical lineparts with u+2502
  a.each { |f,l| # prime_division gives us an array with the specific prime(s) and the index, how often prime(s) appear; example 24 =>[[2,3],[3,1]]

    z = a.index([f,l])
    (0..p.length-1).each { |i| # count every primefactor in array p

      if f > p[i][0] and z <= i and p[i][0] != a[(z-1)][0] # if b prime is bigger than p prime and last b prime not equal to p prime
        (s[i]).times do print " " end # then fill the space to next prime with whitespaces
      elsif f == p[i][0] # if b prime == p prime do
        l.times do print " ",f end # then print the specific primefactor as often as it appears in b
        (s[i]-(f.to_s.length + 1)*l).times do print " " end # and fill the space to next prime with whitespaces
     end

    }
  }
  print "\n"
}

print " " # only format things
(w1c+1).times do print "─" end # horizontal line parts on right side with u+2500
print "┼" # intersection of horizontal and vertical lines with u+253c
s.sum.times do print "─" end  # horizontal line parts on right side with u+2500

print "\n" # only format things
print " "  # only format things
print r    # result (d)
print " "  # only format things
print "│"  # vertical line part with u+2502
print q    # primefactors for result (c)

3.times do print "\n" end # only format things

