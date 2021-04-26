=begin 
find method works similar to the select method, but once we find what we're
looking for we stop. if it is not found we can use a default
=end
p [1,3].find {|val| val.even?} #=> nil if the vaule is no found
p [1,2,3].find {|val| val.even?} #=> 2

p " using find with reduce"
=begin 
break -first we would break out of our reduce

if function.call- second only return our truthy value if our function reuturns
  true

really dont care for acc for this mehod. the break wil break out of reduce and 
return the value, and if never happend then we just get nil

=end

def find (list, &function)
    list.reduce(nil){ |_, val|
      break val if function.call(val)
        }
end
p find([1,2,3]) {|val| val.even?} #=> 2

=begin 
1.we breakout and return 1 if its even. 1 in not so continue
2. we break out and return 2 if its even. 2 is so return and stop!

we dont look any further
=end

#when to use find vs find reduce
=begin 
To find is to use a function to locate a single element in a list 
then stop lookin

To find with reduce is to reduce into nothing until an element matches a function
the break out with that value
=end