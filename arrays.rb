#Array
=begin 
https://ruby-doc.org/core-3.0.1/Array.html
Represents a collection of data, which we think of as ordered lists.
The individual variables,numbers, or string within array are elements.
it can contain any combination of them. aswell as or object(arrays)

Note: better to keep similara data if at all possible

Array literal: #Note more commonly used
number_array = [1,2,3,4,5] #=> array with five elements
str_array = ["This","is","a","string","array"] #=> array with five elements

can create new object also by calling the Array.new() method
includes up to 2 arguments(initial size , default value)
Array.new => []
Array.new(3) => [nil,nil,nil]
Array.new(3,true) #=>[true,true,true]
=end
puts "Array Literals"
p number_array = [1,2,3,4,5] #=> array with five elements
p str_array = ["This","is","a","string","array"] #=> array with five elements


#Accessing Elements
=begin 
every element has an index, which is zero-based. 
arry[index]. Ruby also allows negative indices Which return elements
starting from the end of an array, starting at [-1]

Note: calling a invaild position will result in nil.
=end
puts "Accessing arrays"
p str_array[3] #=> string
p str_array[-1] #=> array

#first Method - first element can use integer to get more data
p str_array.first #=> "This"
p str_array.first(2) #=> "This" "is"

#last Method - last element can use integer to get more data
p number_array.last #=> 5
p number_array.last(2) #=> [4,5]

puts "Adding elements"
#Adding an element
=begin 
Adding a element can be done with the push method or the shovel operator.
=end
p number_array.push(6,7) #=> [1,2,3,4,5,6,7]
p number_array<<8  #=> [1,2,3,4,5,6,7,8]

#unshift
=begin 
adds elements from the beginning and returns that array
=end
p number_array.unshift(0) #=> [0,1,2,3,4,5,6,7,8]

puts "Adding elements"
#Removing Elements
#pop
=begin 
With the pop method we can remove elements at the end of an array
and return the element the was removed
Note: pop can take integer
=end
p number_array.pop #=>8
p number_array #=>[0,1,2,3,4,5,6,7]

=begin 
The shift removes first element of that array, and returns it
Note: shift can take integer
=end

p number_array.shift #=> 0
p number_array #=> [1,2,3,4,5,6,7]

puts "adding and subtracting arrays"
arr_one = ["a","b","c"]
arr_two =  ["d","e","f"]

p arr_one + arr_two # => ["a","b","c","d","e","f"]
#or
p arr_one.concat( arr_two) # => ["a","b","c","d","e","f"]

#When subtracting - arrays any element that appear in second array is removed
arr_three = ["d","e"]
p arr_two-arr_three #=> ["f"]