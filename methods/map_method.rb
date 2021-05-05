#map
=begin 
Ruby map method can use arrays hashes and ranges and the mainn uses 
is to transform data. returns data in a new array. orginal stays the same
=end
array =['a','b','c']
p array.map{|letter| letter.upcase} #=>["A", "B", "C"]

#converting hash values to symbols
hash= {bacon: "protein", apple: "fruit"}
p hash.map{|k,v|[k, v.to_sym]}.to_h #=>{:bacon=>:protein, :apple=>:fruit}
=begin 
#to_sym -converts to a symbol
returning a new array with the transformed key and values

the last step to_h converts back into a hash
=end

p "using map method and with_index method"

#here our result becomes a multi dimensional array
array = %w(a b c)
p array.map.with_index{|letter,idx| [letter,idx]} #=> [["a", 0], ["b", 1], ["c", 2]]
#Note: we can also pass a parameter to the index to start from 0

p "When you dont need arguments for map method"

p ["11", "21", "5"].map(&:to_i) #=> [11,21,5]
p ["orange", "apple", "banana"].map(&:class) #=> [string,string,string]

p " map with reduce"

=begin 
we start by pushing to our accumulator to join our element to it

before we could push a new element onto an array, we would need to apply
a function to it.Applying a function essentially using call to call a 
function in ruby

in map method we have an argument list where each item goes into
reduce as val. this will give use our array for accumulator to push
the array at the end of the list

but not before recieving the call from the calling method  

a           v    fn    new
[]    push  1 *  2    [2]
[2]   push  2 *  2    [2,4]
[2,4] push  3 *  2   [2,4,6]

1. we start with an empty array, and we push onto it the result of our first
element of 1. applied to our function val * 2. our value 2 gets puts onto
accumulator


2. we start with accumulator [2], val is 2 and we push onto it the result of val * 2
giving us 4. now we push 4 [2,4]

3. we start with accumulator [2,4], val is 3 and we push onto it the result of val * 2
giving us 6. now we push 6 [2,4,6]

4. nothing left to evaluate so we return our final accumulator array

=end

def map(list, &function)
    list.reduce([]){|acc, val|
      acc.push function.call(val) 
    }

  end
p map([1,2,3]) { |v| v*2}


#when to us map vs map with reduce
=begin 

To map is to apply a function to every element of a list to create a 
new list

To map with reduce is to apply a function before apppending an element to
a new list

=end