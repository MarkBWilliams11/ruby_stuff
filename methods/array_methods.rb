#map method (commonly used)
=begin 
The map method iterates over an array applying a block to each element of the
array and returns a new array with those results
the collect method is an alias to the map method-(they do the same thing)

  #Note: This method does not mutate the caller.
=end

p map_these_nums= [1,2,3,4]
p map_these_nums.map{|num| num**2} #=>[1,4,9,16]
p map_these_nums.collect{|num| num**2} #=>[1,4,9,16] same as map method
p map_these_nums #=> still the same [1,2,3,4]


#delete_at
=begin 
This method can be helpful for removing a value at a certain index of an array

Note: this changes the array permanently
=end
p map_these_nums.delete_at(1) #=>2
p map_these_nums #=> [1,3,4] changes our original array

#delete
=begin 
If you do not know the index but know the value. 
the delete method can hold that value  to be removed

Note: this permanently chances the array
=end
my_pets = ["cat", "dog", "bird", "cat", "snake"]
p my_pets.delete("cat") #=> "cat"
p my_pets #=> ["dog","bird","snake"] 

#uniq deletes any duplicate values that exist. results in new array.
b = [1, 1, 2, 2, 3, 3, 4, 4]
p b.uniq #=> [1,2,3,4] new array
p b #=> did not modify original

# !
=begin 
Adding the bang suffix(!) uinq! 
Note: this permanently chances the array
=end
b.uniq!
p b #=>[1,2,3,4]

#iterating over an array
=begin 
The select method iterates over an array and returns a new  array
that includes any items that return true to the expression provided.

Note: does not mutated the caller
=end
p"Iterating over arrays"
p number_array = [1,2,3,4,5,6,7]
p number_array.select{|number| number > 4} #=> [5,6,7]

puts "Caution mutating arrays"
#methods with  (!)
=begin 
The bang (!) at the end of a method name usually indicates that the method 
will change or mutate the caller permanently. Not always the case though.
  Note: double check ruby docs to make sure
=end


#Mutating the caller
=begin 
it is possible to send an argument to the method and change that argument
forever without knowing. So know about what a method is doing to its argument
and know what that method returns
=end
def mutate(arr)
  arr.pop#destructive method  on its argument modifiying intial arr outside
end

def not_mutate(arr)
  arr.select { |i| i > 3 }#array with the mutation from outcome
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)
not_mutate(a)

puts a #=> only [1,2,3,4,5] 

puts"Nested Arrays"

#Nested Arrays
=begin 
array inside of an array
=end
teams= [['Joe', 'Steve'], ['Frank', 'Molly'], ['Dan', 'Sara']]


p teams[2] #=> ["Dan,Sara"]
hash= [{name:"bob",age:30},{name:"Sara",age:40},]

p hash[1] #=> "name=> "Sara", age:=>40

puts"Comparing Arrays ex"
a = [1, 2, 3] #=> [1, 2, 3]
b = [2, 3, 4] #=> [2, 3, 4]

puts a == b #=> false
b.pop #=> 4 mutated our intial array

b.unshift(1) #=> [1, 2, 3]

puts a == b #=> true


#Common Array methods
p'using include'
#includes?
=begin 
checks to see if the argument given is included in the array. the ?
expects a boolen value return ing true or false
(we call this a predicte method)
=end
beta=["B","e","t","a"]
p beta.include?("t") #=> true
p beta.include?("u") #=> false

p'using flatten'
#flatten
=begin 
This method can takes the cotains of a nested array and creates a one-dimensional 
array
=end
p nest_array= [[1,2],[3,4],[5,6]] 
p nest_array.flatten #=>[1,2,3,4,5,6]
p nest_array#did not mutate

p'using each_index'
#each_index
=begin 
the variable represents the index, and it passes the index of the element
=end
nums = [1,2,3,4,5,6]
nums.each_index{|index| puts "This is index #{index}"}

#each_with_index
=begin 
gves us the index and the valueswe pass it parameters the value first than index
 (value,index)
=end
nums.each_with_index{|value, index| puts "This is the index:#{index} and the value:#{value}"}

p 'Sort method'
#sort
=begin 
orders our array
=end
 p a = [5, 3, 8, 2, 4, 1]
 p a.sort
p a #=> did not change orginal array 

p 'using product method'

#product
=begin 
used to combine two arrays. it returns an array that is a 
combination of all elements  from all arrays.
=end
p prod_ex =[1,2,3].product(["a",'b'])
#[[1, "a"], [1, "b"], [2, "a"], [2, "b"], [3, "a"], [3, "b"]]

p "Using each"
#each vs map
=begin 
using is more preferred than for loop. works on object allow for iterations
and are commonly used along with a block

each runs the code in the block once for each element in the collection
and returns the collection it was invoked on.

if no block is given, it returns an Enumerator(allows both internal and external iteration)
=end

a = [1,2,3]
a.each{|e| p e} #=>[1,2,3]
#we can modify our 
a.each{|e| p e + 2} #=>[3,4,5]
p a #=> Still [1,2,3]
p a.each #<Enumerator: [1, 2, 3]:each>

p "check if a nubmer exist using each or include"
arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |num|
  if num == number
    puts "#{number} is in the array."
  end
end

# ... or...
if arr.include?(number)
  puts "#{number} is indeed in the array."
end

p " returning a spefic word from an array"

arr = [["test", "hello", "world"],["example", "mem"]]
flatarr = arr.flatten
p flatarr.each_with_index{|val,idx| p "#{idx} val:#{val}"}
p flatarr[3]

p "build a new array from an exist on example with numbers"
a =[1,2,3,4]
new_a = a.map{|num| p num+=2} #=> adds two to each vaule
p a #=> [1,2,3,4]
p new_a #=> [3,4,5,6]


p "convinient method for wrting a array"
#writing an array without quotes 
p %w(john mary susan) #=> ["john","mary",'susan']

p "Using size to get the length of an array"
#getting length of and array using size
 names=  %w(john mary susan) 
p names.size #=> 3

p "convinient method for converting string"
#converting an array into a string  using join
p letters = %w(a b c d)
p letters.join
p letters.join(" ")#=> using space as sperator
p letters
#to make the string back into an array using the split
p "a b c".split

p "multi-dimensional arrays"
#multi-dimensional arrays (2D arrays and more)
users = [[1, 'Peter'],[2, 'Steven']
]
p users [0][0]#=> 1
p users [0][1]#=> peter

#sample method
=begin 
pickd a random element from an array
=end
p users.sample #=> random element

p "take method"
#take
=begin 
Using the take method slices a portion of the array, take one argument.
it will get those elements atarting at the zero index.
=end
numbers = [1,2,3,4,5,6,7,nil]
p numbers.take(3) #=> [1,2,3]
p numbers #=> did not change our numbers array

#remove nil values with compact method
p numbers.compact

p " clear method"
#clear removes all elements from itself
p d= [1,2,3,4,5,6,7,8]
p d.clear
p d
p " Using insert Method"
#insert (index,obj...)-> array
a = %w{ a b c d }
a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]

p " Using shuffle Method"
#shuffle return a new array with shullfed elements
p a =[1,2,3,4]
p a.shuffle #=> random shuffle
p a # did not change original array
#for that desired outcome we need to use shufle!