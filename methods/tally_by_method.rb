#tally_by
#p [1, 2, 3].group_by(&:even?)

#atm does not accept tally_by
=begin 
tally by works like map it applies a function to a value, but here
it uses that value returned as a key to keep  tally. the case here it true 
or false

tally       v => key     new tally
            1 =>  f   f+= 1 => f=>1
f=>1        2 =>  t   t+= 1 => f=>1, t=>1
f=> t=>1    3 =>  f   t+= 1 => f=>2, t=>1

false=> 2 true=> 1
=end


def tally_by(list, &function)
    init = Hash.new(0)

    list.reduce(init) {|acc,val|
      key = function.call(val)
      acc[key]+=1
      acc
    }
  end

p  tally_by([1,2,3]) {|val| val.even?}

=begin 
1. there are no counts to start.the frist element is not even so add
to the false count, so one false count exists

2. there is a count of one false to start. the second element is even
so we add one count to the true. giving us two elements 
one false and one true

3. there are now one false and one true count to start, the third element
is not even so we add another to or false count. giving us two false
and one true count

=end